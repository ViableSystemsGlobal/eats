<?php

namespace App\Services;

use App\Models\Tax;
use App\Models\Order;

class TaxCalculationService
{
    /**
     * Calculate taxes with the correct method:
     * 1. Apply levies first (NHIL, GETFund, COVID Fund, Tourism) on the base amount
     * 2. Calculate VAT on the subtotal after levies
     * 
     * Note: This method assumes the provided subtotal is the base amount (product price excluding taxes)
     */
    public static function calculateTaxes($subTotal, $discountAmount = 0, $restaurantId = null, $cachedTaxes = null)
    {
        $baseAmount = $subTotal - $discountAmount;
        $levies = [];
        $vat = null;
        $totalTaxAmount = 0;
        $subtotalAfterLevies = $baseAmount;

        // Use cached taxes if provided, otherwise get from database
        if ($cachedTaxes === null) {
            $taxes = Tax::where('restaurant_id', $restaurantId)->get();
        } else {
            $taxes = $cachedTaxes;
        }

        // Calculate levies first on the base amount
        foreach ($taxes as $tax) {
            if (strtolower($tax->tax_name) === 'vat') {
                $vat = $tax;
            } else {
                // These are levies (NHIL, GETFund, COVID Fund, Tourism, etc.)
                $levyAmount = ($tax->tax_percent / 100) * $baseAmount;
                $levies[] = [
                    'tax' => $tax,
                    'amount' => $levyAmount
                ];
                $totalTaxAmount += $levyAmount;
                $subtotalAfterLevies += $levyAmount;
            }
        }

        // Calculate VAT on the subtotal after levies
        if ($vat) {
            $vatAmount = ($vat->tax_percent / 100) * $subtotalAfterLevies;
            $totalTaxAmount += $vatAmount;
        }

        return [
            'levies' => $levies,
            'vat' => $vat ? [
                'tax' => $vat,
                'amount' => ($vat->tax_percent / 100) * $subtotalAfterLevies
            ] : null,
            'totalTaxAmount' => $totalTaxAmount,
            'subtotalAfterLevies' => $subtotalAfterLevies,
            'baseAmount' => $baseAmount
        ];
    }

    /**
     * Calculate the base amount (product price excluding taxes) from a final price
     * This is useful when you have the final price and need to work backwards
     */
    public static function calculateBaseAmountFromFinalPrice($finalPrice, $restaurantId = null)
    {
        $taxes = Tax::where('restaurant_id', $restaurantId)->get();
        
        // Calculate total levy percentage
        $totalLevyPercentage = 0;
        $vatPercentage = 0;
        
        foreach ($taxes as $tax) {
            if (strtolower($tax->tax_name) === 'vat') {
                $vatPercentage = $tax->tax_percent;
            } else {
                $totalLevyPercentage += $tax->tax_percent;
            }
        }
        
        // Formula: Final Price = Base Amount * (1 + levy%) * (1 + VAT%)
        // So: Base Amount = Final Price / ((1 + levy%) * (1 + VAT%))
        $baseAmount = $finalPrice / ((1 + $totalLevyPercentage/100) * (1 + $vatPercentage/100));
        
        return $baseAmount;
    }

    /**
     * Get the total amount including taxes
     */
    public static function calculateTotalWithTaxes($subTotal, $discountAmount = 0, $restaurantId = null)
    {
        $taxCalculation = self::calculateTaxes($subTotal, $discountAmount, $restaurantId);
        return $subTotal - $discountAmount + $taxCalculation['totalTaxAmount'];
    }

    /**
     * Check if a tax is a levy (not VAT)
     */
    public static function isLevy($taxName)
    {
        $levyNames = ['nhil', 'getfund', 'covid fund', 'tourism', 'sgst', 'cgst'];
        return in_array(strtolower($taxName), $levyNames);
    }

    /**
     * Check if a tax is VAT
     */
    public static function isVAT($taxName)
    {
        return strtolower($taxName) === 'vat';
    }

    /**
     * Calculate taxes with the reverse method:
     * The TOTAL remains the same, but we break it down into components
     * This is useful when you want to show the breakdown of a fixed total price
     */
    public static function calculateReverseTaxes($totalPrice, $discountAmount = 0, $restaurantId = null, $cachedTaxes = null)
    {
        $baseAmount = $totalPrice - $discountAmount;
        $levies = [];
        $vat = null;
        $totalTaxAmount = 0;

        // Use cached taxes if provided, otherwise get from database
        if ($cachedTaxes === null) {
            $taxes = Tax::where('restaurant_id', $restaurantId)->get();
        } else {
            $taxes = $cachedTaxes;
        }

        // Calculate total levy percentage and VAT percentage
        $totalLevyPercentage = 0;
        $vatPercentage = 0;
        
        foreach ($taxes as $tax) {
            if (strtolower($tax->tax_name) === 'vat') {
                $vatPercentage = $tax->tax_percent;
            } else {
                $totalLevyPercentage += $tax->tax_percent;
            }
        }

        // Calculate the actual food cost (base amount before taxes)
        // Formula: Total = Food Cost * (1 + levy%) * (1 + VAT%)
        // So: Food Cost = Total / ((1 + levy%) * (1 + VAT%))
        $foodCost = $baseAmount / ((1 + $totalLevyPercentage/100) * (1 + $vatPercentage/100));

        // Calculate subtotal after levies (before VAT)
        $subtotalAfterLevies = $foodCost;
        
        // Now calculate individual tax amounts based on the food cost
        foreach ($taxes as $tax) {
            if (strtolower($tax->tax_name) === 'vat') {
                $vat = $tax;
                // VAT is calculated on subtotal after levies
                $vatAmount = ($tax->tax_percent / 100) * $subtotalAfterLevies;
                $totalTaxAmount += $vatAmount;
            } else {
                // These are levies (NHIL, GETFund, COVID Fund, Tourism, etc.)
                $levyAmount = ($tax->tax_percent / 100) * $foodCost;
                $levies[] = [
                    'tax' => $tax,
                    'amount' => $levyAmount
                ];
                $totalTaxAmount += $levyAmount;
                $subtotalAfterLevies += $levyAmount;
            }
        }

        return [
            'levies' => $levies,
            'vat' => $vat ? [
                'tax' => $vat,
                'amount' => ($vat->tax_percent / 100) * $subtotalAfterLevies
            ] : null,
            'totalTaxAmount' => $totalTaxAmount,
            'subtotalAfterLevies' => $subtotalAfterLevies,
            'baseAmount' => $baseAmount,
            'foodCost' => $foodCost
        ];
    }

        /**
     * Get the appropriate tax calculation based on the receipt format setting
     */
    public static function getTaxCalculation($subTotal, $discountAmount = 0, $restaurantId = null, $taxFormat = 'current', $cachedTaxes = null)
    {
        if ($taxFormat === 'reverse') {
            return self::calculateReverseTaxes($subTotal, $discountAmount, $restaurantId, $cachedTaxes);
        }

        return self::calculateTaxes($subTotal, $discountAmount, $restaurantId, $cachedTaxes);
    }

    /**
     * Get cached taxes for a restaurant to avoid repeated database queries
     */
    public static function getCachedTaxes($restaurantId)
    {
        // Use Laravel's cache to store taxes for 1 hour
        return cache()->remember("taxes_restaurant_{$restaurantId}", 3600, function () use ($restaurantId) {
            return Tax::where('restaurant_id', $restaurantId)->get();
        });
    }
} 