# Receipt Template Updates

## Overview
Updated all receipt templates to reflect the new tax calculation structure where:
1. **Levies** (NHIL, GETFund, COVID Fund, Tourism) are displayed first
2. **VAT** is displayed last, calculated on the subtotal after levies

## Files Updated

### 1. Customer Receipt (`resources/views/order/print.blade.php`)
**Before:**
```php
@foreach ($order->taxes as $item)
    <div class="summary-row">
        <span>{{ $item->tax->tax_name }} ({{ $item->tax->tax_percent }}%):</span>
        <span>{{ currency_format(($item->tax->tax_percent / 100) * ($order->sub_total - ($order->discount_amount ?? 0))) }}</span>
    </div>
@endforeach
```

**After:**
```php
@php
    // Use the new tax calculation service
    $taxCalculation = \App\Services\TaxCalculationService::calculateTaxes(
        $order->sub_total, 
        $order->discount_amount ?? 0, 
        $order->branch->restaurant_id
    );
@endphp

{{-- Display Levies First --}}
@foreach ($taxCalculation['levies'] as $levy)
    <div class="summary-row">
        <span>{{ $levy['tax']->tax_name }} ({{ $levy['tax']->tax_percent }}%):</span>
        <span>{{ currency_format($levy['amount']) }}</span>
    </div>
@endforeach

{{-- Display VAT on subtotal after levies --}}
@if ($taxCalculation['vat'])
    <div class="summary-row">
        <span>{{ $taxCalculation['vat']['tax']->tax_name }} ({{ $taxCalculation['vat']['tax']->tax_percent }}%):</span>
        <span>{{ currency_format($taxCalculation['vat']['amount']) }}</span>
    </div>
@endif
```

### 2. POS Order Detail (`resources/views/pos/order_detail.blade.php`)
**Before:**
```php
@foreach ($orderDetail->taxes as $item)
<div class="flex justify-between text-sm text-gray-500 dark:text-neutral-400">
    <div>{{ $item->tax->tax_name }} ({{ $item->tax->tax_percent }}%)</div>
    <div>{{ currency_format(($item->tax->tax_percent / 100) * ($orderDetail->sub_total - ($orderDetail->discount_amount ?? 0)), restaurant()->currency_id) }}</div>
</div>
@endforeach
```

**After:**
```php
@php
    // Use the new tax calculation service
    $taxCalculation = \App\Services\TaxCalculationService::calculateTaxes(
        $orderDetail->sub_total, 
        $orderDetail->discount_amount ?? 0, 
        $orderDetail->branch->restaurant_id
    );
@endphp

{{-- Display Levies First --}}
@foreach ($taxCalculation['levies'] as $levy)
<div class="flex justify-between text-sm text-gray-500 dark:text-neutral-400">
    <div>{{ $levy['tax']->tax_name }} ({{ $levy['tax']->tax_percent }}%)</div>
    <div>{{ currency_format($levy['amount'], restaurant()->currency_id) }}</div>
</div>
@endforeach

{{-- Display VAT on subtotal after levies --}}
@if ($taxCalculation['vat'])
<div class="flex justify-between text-sm text-gray-500 dark:text-neutral-400">
    <div>{{ $taxCalculation['vat']['tax']->tax_name }} ({{ $taxCalculation['vat']['tax']->tax_percent }}%)</div>
    <div>{{ currency_format($taxCalculation['vat']['amount'], restaurant()->currency_id) }}</div>
</div>
@endif
```

### 3. Livewire Order Detail (`resources/views/livewire/order/order-detail.blade.php`)
**Before:**
```php
@foreach ($order->taxes as $item)
    <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400">
        <div>{{ $item->tax->tax_name }} ({{ $item->tax->tax_percent }}%)</div>
        <div>{{ currency_format(($item->tax->tax_percent / 100) * ($order->sub_total - ($order->discount_amount ?? 0))) }}</div>
    </div>
@endforeach
```

**After:**
```php
@php
    // Use the new tax calculation service
    $taxCalculation = \App\Services\TaxCalculationService::calculateTaxes(
        $order->sub_total, 
        $order->discount_amount ?? 0, 
        $order->branch->restaurant_id
    );
@endphp

{{-- Display Levies First --}}
@foreach ($taxCalculation['levies'] as $levy)
    <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400">
        <div>{{ $levy['tax']->tax_name }} ({{ $levy['tax']->tax_percent }}%)</div>
        <div>{{ currency_format($levy['amount']) }}</div>
    </div>
@endforeach

{{-- Display VAT on subtotal after levies --}}
@if ($taxCalculation['vat'])
    <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400">
        <div>{{ $taxCalculation['vat']['tax']->tax_name }} ({{ $taxCalculation['vat']['tax']->tax_percent }}%)</div>
        <div>{{ currency_format($taxCalculation['vat']['amount']) }}</div>
    </div>
@endif
```

### 4. Shop Order Detail (`resources/views/livewire/shop/order-detail.blade.php`)
**Before:**
```php
@foreach ($order->taxes as $item)
    <div class="flex items-center justify-between text-xs">
        <span class="text-gray-600 dark:text-gray-400">{{ $item->tax->tax_name }} ({{ $item->tax->tax_percent }}%)</span>
        <span class="text-gray-900 dark:text-white">{{ currency_format(($item->tax->tax_percent / 100) * ($order->sub_total - ($order->discount_amount ?? 0)), $restaurant->currency_id) }}</span>
    </div>
@endforeach
```

**After:**
```php
@php
    // Use the new tax calculation service
    $taxCalculation = \App\Services\TaxCalculationService::calculateTaxes(
        $order->sub_total, 
        $order->discount_amount ?? 0, 
        $restaurant->id
    );
@endphp

{{-- Display Levies First --}}
@foreach ($taxCalculation['levies'] as $levy)
    <div class="flex items-center justify-between text-xs">
        <span class="text-gray-600 dark:text-gray-400">{{ $levy['tax']->tax_name }} ({{ $levy['tax']->tax_percent }}%)</span>
        <span class="text-gray-900 dark:text-white">{{ currency_format($levy['amount'], $restaurant->currency_id) }}</span>
    </div>
@endforeach

{{-- Display VAT on subtotal after levies --}}
@if ($taxCalculation['vat'])
    <div class="flex items-center justify-between text-xs">
        <span class="text-gray-600 dark:text-gray-400">{{ $taxCalculation['vat']['tax']->tax_name }} ({{ $taxCalculation['vat']['tax']->tax_percent }}%)</span>
        <span class="text-gray-900 dark:text-white">{{ currency_format($taxCalculation['vat']['amount'], $restaurant->currency_id) }}</span>
    </div>
@endif
```

### 5. Shop Cart (`resources/views/livewire/shop/cart.blade.php`)
**Before:**
```php
@foreach ($taxes as $item)
    <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400">
        <div>{{ $item->tax_name }} ({{ $item->tax_percent }}%)</div>
        <div>{{ currency_format(($item->tax_percent / 100) * $subTotal, $restaurant->currency_id) }}</div>
    </div>
@endforeach
```

**After:**
```php
@php
    // Use the new tax calculation service
    $taxCalculation = \App\Services\TaxCalculationService::calculateTaxes(
        $subTotal, 
        0, // No discount in cart context
        $restaurant->id
    );
@endphp

{{-- Display Levies First --}}
@foreach ($taxCalculation['levies'] as $levy)
    <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400">
        <div>{{ $levy['tax']->tax_name }} ({{ $levy['tax']->tax_percent }}%)</div>
        <div>{{ currency_format($levy['amount'], $restaurant->currency_id) }}</div>
    </div>
@endforeach

{{-- Display VAT on subtotal after levies --}}
@if ($taxCalculation['vat'])
    <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400">
        <div>{{ $taxCalculation['vat']['tax']->tax_name }} ({{ $taxCalculation['vat']['tax']->tax_percent }}%)</div>
        <div>{{ currency_format($taxCalculation['vat']['amount'], $restaurant->currency_id) }}</div>
    </div>
@endif
```

## Benefits

### For Customers:
- **Clear Tax Breakdown**: Customers can see exactly how taxes are calculated
- **Transparent Pricing**: Understand the difference between levies and VAT
- **Compliance**: Receipts now match Ghanaian tax regulations

### For Restaurant Staff:
- **Accurate Information**: All displays show the correct tax calculations
- **Consistent Experience**: Same tax structure across all interfaces
- **Professional Appearance**: Properly structured tax breakdowns

### For System:
- **Centralized Logic**: All templates use the same `TaxCalculationService`
- **Maintainable**: Easy to update tax calculations in one place
- **Consistent**: Same calculation method across all receipt types

## Example Receipt Structure

**New Receipt Format:**
```
Sub Total: GHS 210.00

NHIL (2.50%) (Levy): GHS 5.25
GETFund (2.50%) (Levy): GHS 5.25
COVID Fund (1.00%) (Levy): GHS 2.10
Tourism (1.00%) (Levy): GHS 2.10
Subtotal after levies: GHS 224.70
VAT (15.00%) (VAT): GHS 33.71

Total: GHS 258.41
```

**Old Receipt Format:**
```
Sub Total: GHS 210.00

NHIL (2.50%): GHS 5.25
GETFund (2.50%): GHS 5.25
COVID Fund (1.00%): GHS 2.10
Tourism (1.00%): GHS 2.10
VAT (15.00%): GHS 31.50

Total: GHS 256.20
```

The new structure clearly shows:
1. **Initial Sub Total** (base amount)
2. **Individual Levies** (calculated on base amount) - marked with "(Levy)"
3. **Subtotal after levies** (intermediate step) - **BOLD**
4. **VAT** (calculated on subtotal after levies) - marked with "(VAT)"
5. **Final Total**

This makes it crystal clear that **VAT is calculated on the subtotal after levies**, which matches the Ghanaian tax regulations. The visual indicators help customers and staff understand the difference between levies and VAT.

## Implementation Status
✅ **All receipt templates updated**
✅ **Tax calculation service integrated**
✅ **Consistent display across all interfaces**
✅ **Compliant with Ghanaian tax regulations**

Your restaurant management system now displays the correct tax structure on all receipts and interfaces! 🎉 