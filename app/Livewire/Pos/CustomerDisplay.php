<?php

namespace App\Livewire\Pos;

use Livewire\Component;
use App\Models\Order;
use App\Services\TaxCalculationService;

class CustomerDisplay extends Component
{
    public $orderNumber = null;
    public $orderType = null;
    public $tableNo = null;
    public $cartItems = [];
    public $subTotal = 0;
    public $discountAmount = 0;
    public $totalAmount = 0;
    public $taxCalculation = null;

    public function mount()
    {
        // Get the current active order from session or cache
        $this->loadCurrentOrder();
    }

    public function loadCurrentOrder()
    {
        // Get the current order from session
        $currentOrder = session('current_pos_order');
        
        if ($currentOrder) {
            $this->orderNumber = $currentOrder['order_number'] ?? null;
            $this->orderType = $currentOrder['order_type'] ?? null;
            $this->tableNo = $currentOrder['table_no'] ?? null;
            $this->cartItems = $currentOrder['cart_items'] ?? [];
            $this->subTotal = $currentOrder['sub_total'] ?? 0;
            $this->discountAmount = $currentOrder['discount_amount'] ?? 0;
            $this->totalAmount = $currentOrder['total_amount'] ?? 0;
            
            // Calculate taxes
            if ($this->subTotal > 0) {
                $this->taxCalculation = TaxCalculationService::calculateTaxes(
                    $this->subTotal,
                    $this->discountAmount,
                    restaurant()->id
                );
            }
        }
    }

    public function render()
    {
        return view('pos.customer-display')
            ->layout('layouts.customer-display');
    }

    // Method to update order data from the main POS
    public function updateOrderData($data)
    {
        $this->orderNumber = $data['order_number'] ?? null;
        $this->orderType = $data['order_type'] ?? null;
        $this->tableNo = $data['table_no'] ?? null;
        $this->cartItems = $data['cart_items'] ?? [];
        $this->subTotal = $data['sub_total'] ?? 0;
        $this->discountAmount = $data['discount_amount'] ?? 0;
        $this->totalAmount = $data['total_amount'] ?? 0;
        
        // Calculate taxes
        if ($this->subTotal > 0) {
            $this->taxCalculation = TaxCalculationService::calculateTaxes(
                $this->subTotal,
                $this->discountAmount,
                restaurant()->id
            );
        }

        // Store in session for persistence
        session(['current_pos_order' => $data]);
    }

    // Method to clear order data
    public function clearOrder()
    {
        $this->orderNumber = null;
        $this->orderType = null;
        $this->tableNo = null;
        $this->cartItems = [];
        $this->subTotal = 0;
        $this->discountAmount = 0;
        $this->totalAmount = 0;
        $this->taxCalculation = null;
        
        session()->forget('current_pos_order');
    }
} 