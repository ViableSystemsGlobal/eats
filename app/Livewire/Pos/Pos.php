<?php

namespace App\Livewire\Pos;

use App\Models\Kot;
use App\Models\Tax;
use App\Models\User;
use App\Models\Order;
use App\Models\Table;
use App\Models\KotItem;
use App\Models\Printer;
use Livewire\Component;
use App\Models\KotPlace;
use App\Models\MenuItem;
use App\Models\OrderTax;
use App\Models\OrderItem;
use App\Models\OrderCharge;
use App\Scopes\BranchScope;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Livewire\Attributes\On;
use App\Models\ItemCategory;
use App\Models\ModifierOption;
use App\Traits\PrinterSetting;
use App\Events\NewOrderCreated;
use App\Models\KotCancelReason;
use Illuminate\Validation\Rule;
use App\Models\RestaurantCharge;
use App\Models\DeliveryExecutive;
use App\Models\MenuItemVariation;
use App\Models\ReceiptSetting;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Services\TaxCalculationService;

class Pos extends Component
{
    use LivewireAlert, PrinterSetting;

    protected $listeners = ['refreshPos' => '$refresh'];


    public $categoryList;
    public $search;
    public $filterCategories;
    public $menuItem;
    public $subTotal;
    public $total;
    public $orderNumber;
    public $kotNumber;
    public $tableNo;
    public $tableId;
    public $users;
    public $noOfPax = 1;
    public $selectWaiter;
    public $taxes;
    public $orderNote;
    public $orderName;
    public $showOrderNameModal = false;
    public $tableOrder;
    public $tableOrderID;
    public $orderType;
    public $kotList = [];
    public $showVariationModal = false;
    public $showKotNote = false;
    public $showTableModal = false;
    public $showErrorModal = true;
    public $showNewKotButton = false;
    public $orderDetail = false;
    public $orderItemList = [];
    public $orderItemVariation = [];
    public $orderItemQty = [];
    public $orderItemAmount = [];
    public $deliveryExecutives;
    public $selectDeliveryExecutive;
    public $orderID;
    public $discountType;
    public $discountValue;
    public $discountAmount;
    public $restaurantSetting;
    public $showDiscountModal = false;
    public $selectedModifierItem;
    public $modifiers;
    public $showModifiersModal = false;
    public $itemModifiersSelected = [];
    public $orderItemModifiersPrice = [];
    public $extraCharges;
    public $discountedTotal;
    public $tipAmount = 0;
    public $orderStatus;
    public $printerSettings;
    public $deliveryFee = 0;
    public $itemNotes = [];
    public $orderPlaces;
    public $cancelReasons;
    public $confirmDeleteModal = false;
    public $cancelReason;
    public $cancelReasonText;
    public $taxFormat;
    public $restaurantId;



    public function mount()
    {
        $this->printerSettings = $this->getPrinterSettingProperty();
        $this->total = 0;
        $this->subTotal = 0;
        $this->categoryList = ItemCategory::all();
        
        // Get tax format from receipt settings
        $receiptSetting = ReceiptSetting::where('restaurant_id', restaurant()->id)->first();
        $this->taxFormat = $receiptSetting->tax_format ?? 'current';

        $this->users = User::withoutGlobalScope(BranchScope::class)
            ->where(function ($q) {
                return $q->where('branch_id', branch()->id)
                    ->orWhereNull('branch_id');
            })
            ->where('restaurant_id', restaurant()->id)
            ->get();

        // Store restaurant ID to avoid repeated database queries
        $this->restaurantId = restaurant()->id;
        
        // Get cached taxes to avoid repeated database queries
        $this->taxes = TaxCalculationService::getCachedTaxes($this->restaurantId);
        $this->orderNumber = Order::generateOrderNumber(branch());
        $this->selectWaiter = user()->id;
        $this->orderType = 'dine_in';
        $this->orderName = null; // Initialize order name
        $this->orderNote = null; // Initialize order note

        $this->deliveryExecutives = DeliveryExecutive::where('status', 'available')->get();
        if ($this->tableOrderID) {
            $this->tableId = $this->tableOrderID;
            $this->tableOrder = Table::find($this->tableOrderID);
            $this->tableNo = $this->tableOrder->table_code;
            $this->orderID = $this->tableOrder->activeOrder ? $this->tableOrder->activeOrder->id : null;

            if ($this->tableOrder->activeOrder) {

                $this->orderNumber = $this->tableOrder->activeOrder->order_number;
                $this->orderName = $this->tableOrder->activeOrder->name;
                $this->tipAmount = $this->tableOrder->activeOrder->tip_amount;
                $this->deliveryFee = $this->tableOrder->activeOrder->delivery_fee;
                $this->showTableOrder();

                if ($this->orderDetail) {
                    $this->showOrderDetail();
                }
            } elseif ($this->orderDetail) {
                return $this->redirect(route('pos.index'), navigate: true);
            }
        }

        if ($this->orderID) {
            $order = Order::find($this->orderID);
            if ($order->status === 'canceled') {
                return $this->redirect(route('pos.index'), navigate: true);
            }
            $this->orderNumber = $order->order_number;
            $this->orderName = $order->name;
            $this->noOfPax = $order->number_of_pax;
            $this->selectWaiter = $order->waiter_id ?? null;
            $this->tableNo = $order->table->table_code ?? null;
            $this->tableId = $order->table->id ?? null;
            $this->discountAmount = $order->discount_amount;
            $this->discountValue = $order->discount_type === 'percent' ? rtrim(rtrim($order->discount_value, '0'), '.') : $order->discount_value;
            $this->discountType = $order->discount_type;
            $this->tipAmount = $order->tip_amount;
            $this->deliveryFee = $order->delivery_fee;
            $this->orderStatus = $order->order_status;

            // Always set orderDetail when orderID is provided to enable adding items
            // Check the original value before overwriting it
            $originalOrderDetail = $this->orderDetail;
            $shouldLoadItems = ($originalOrderDetail === 'true' || $originalOrderDetail === true || $originalOrderDetail instanceof Order);
            
            // Always set orderDetail to the Order object to enable editing
            $this->orderDetail = $order;
            $this->orderType = $this->orderDetail->order_type;
            $this->selectDeliveryExecutive = $order->delivery_executive_id;
            
            // Always load existing items to show both old and new items
            // This allows users to see existing KOT items alongside newly added items
            $this->setupOrderItems();
        }

        $this->UpdatedOrderType($this->orderType);

        if ($this->orderID) {
            $this->extraCharges = ($order->status === 'kot' && !$this->orderDetail) ? [] : $order->extraCharges;
        }
        $this->cancelReasons = KotCancelReason::where('cancel_order', true)->get();
    }

    public function UpdatedOrderType($value)
    {

        $mainExtraCharges = RestaurantCharge::whereJsonContains('order_types', $value)
            ->where('is_enabled', true)
            ->get();

        // Handle new orders or table orders without active orders
        if ((!$this->orderID && !$this->tableOrderID) || ($this->tableOrderID && !$this->tableOrder->activeOrder)) {
            $this->extraCharges = $mainExtraCharges;
            $this->orderStatus = 'preparing';
            $this->calculateTotal();
            return;
        }

        $order = $this->tableOrderID ? $this->tableOrder->activeOrder : Order::find($this->orderID);

        // Early return if no valid order or order is paid
        if (!$order || $order->status === 'paid') {
            return;
        }

        // Keep existing charges if order type is unchanged, otherwise set new ones
        $this->extraCharges = $order->order_type === $value ? $order->extraCharges : $mainExtraCharges;

        $this->orderStatus = $order->order_status;
        $this->calculateTotal();
    }

    public function updatedOrderStatus($value)
    {
        if ((!$this->orderID && !$this->tableOrderID) || !$this->orderDetail instanceof Order || is_null($value)) {

            return;
        }
        $this->orderDetail->update(['order_status' => $value]);

        if ($value->value === 'confirmed') {
            $this->orderDetail->kot->each(function ($kot) {
                $kot->update(['status' => 'in_kitchen']);
            });
        }
    }

    public function showTableOrder()
    {
        $this->selectWaiter = $this->tableOrder->activeOrder->waiter_id;
        $this->noOfPax = $this->tableOrder->activeOrder->number_of_pax;
    }

    public function showOrderDetail()
    {
        $this->orderDetail = $this->tableOrder->activeOrder;
        $this->orderType = $this->orderDetail->order_type;
        $this->setupOrderItems();
    }

    public function showPayment($id)
    {
        $order = Order::find($id);

        $this->dispatch('showPaymentModal', id: $order->id);
    }

    public function setupOrderItems()
    {
        if ($this->orderDetail) {
            foreach ($this->orderDetail->kot as $kot) {
                $this->kotList['kot_' . $kot->id] = $kot;

                foreach ($kot->items as $item) {
                    $this->orderItemList['"kot_' . $kot->id . '_' . $item->id . '"'] = $item->menuItem;
                    $this->orderItemQty['"kot_' . $kot->id . '_' . $item->id . '"'] = $item->quantity;
                    $this->orderItemModifiersPrice['"kot_' . $kot->id . '_' . $item->id . '"'] = $item->modifierOptions->sum('price');
                    $this->itemModifiersSelected['"kot_' . $kot->id . '_' . $item->id . '"'] = $item->modifierOptions->pluck('id')->toArray();
                    $basePrice = $item->menuItemVariation ? $item->menuItemVariation->price : $item->menuItem->price;
                    $this->orderItemAmount['"kot_' . $kot->id . '_' . $item->id . '"'] = $this->orderItemQty['"kot_' . $kot->id . '_' . $item->id . '"'] * ($basePrice + ($this->orderItemModifiersPrice['"kot_' . $kot->id . '_' . $item->id . '"'] ?? 0));

                    if ($item->menuItemVariation) {
                        $this->orderItemVariation['"kot_' . $kot->id . '_' . $item->id . '"'] = $item->menuItemVariation;
                    }

                    if ($item->note) {
                        $this->itemNotes['"kot_' . $kot->id . '_' . $item->id . '"'] = $item->note;
                    }
                }
            }
            $this->calculateTotal();
        }
    }

    public function addCartItems($id, $variationCount, $modifierCount)
    {
        if (($this->orderID && !user_can('Update Order')) || (!$this->orderID && !user_can('Create Order'))) {
            return;
        }

        // Allow adding items to orders regardless of status (kot, billed, paid)
        // Items will be handled appropriately in saveOrder method

        $this->dispatch('play_beep');
        $this->menuItem = MenuItem::find($id);

        // Initialize item note if it doesn't exist
        if (!isset($this->itemNotes[$id])) {
            $this->itemNotes[$id] = '';
        }

        if ($variationCount > 0) {
            $this->showVariationModal = true;
        } elseif ($modifierCount > 0) {
            $this->selectedModifierItem = $id;
            $this->showModifiersModal = true;
        } else {
            // For items without variations, use the menu item ID as the key (with quotes for consistency)
            $key = '"' . $id . '"';
            $this->syncCart($key);
        }
    }

    #[On('setTable')]
    public function setTable(Table $table)
    {
        if ($this->tableId) {
            Table::where('id', $this->tableId)->update([
                'available_status' => 'available'
            ]);
        }

        $this->tableNo = $table->table_code;
        $this->tableId = $table->id;

        if ($this->orderID) {
            Order::where('id', $this->orderID)->update(['table_id' => $table->id]);

            if ($this->orderDetail->date_time->format('d-m-Y') == now()->format('d-m-Y')) {
                Table::where('id', $this->tableId)->update([
                    'available_status' => 'running'
                ]);
            }

            $this->orderDetail->fresh();
        }

        $this->showTableModal = false;
    }

    #[On('setPosVariation')]
    public function setPosVariation($variationId)
    {
        $this->showVariationModal = false;
        $menuItemVariation = MenuItemVariation::find($variationId);
        $modifiersAvailable = $menuItemVariation->menuItem->modifiers->count();
        if ($modifiersAvailable) {
            $this->selectedModifierItem = $menuItemVariation->menu_item_id . '_' . $variationId;
            $this->showModifiersModal = true;
        } else {
            $key = '"' . $menuItemVariation->menu_item_id . '_' . $variationId . '"';
            $this->orderItemVariation[$key] = $menuItemVariation;
            $this->syncCart($key);
        }
    }

    public function syncCart($id)
    {
        // Ensure id is a string for consistency
        $id = (string) $id;
        
        if (!isset($this->orderItemList[$id])) {
            $this->orderItemList[$id] = $this->menuItem;
            $this->orderItemQty[$id] = $this->orderItemQty[$id] ?? 1;
            $basePrice = isset($this->orderItemVariation[$id]) ? $this->orderItemVariation[$id]->price : $this->orderItemList[$id]->price;
            $this->orderItemAmount[$id] = $this->orderItemQty[$id] * ($basePrice + ($this->orderItemModifiersPrice[$id] ?? 0));
            $this->calculateTotal();
        } else {
            $this->addQty($id);
        }
    }

    public function deleteCartItems($id)
    {
        unset($this->orderItemList[$id]);
        unset($this->orderItemQty[$id]);
        unset($this->orderItemAmount[$id]);
        unset($this->orderItemVariation[$id]);
        unset($this->itemModifiersSelected[$id]);
        unset($this->itemNotes[$id]);
        unset($this->orderItemModifiersPrice[$id]);
        $this->calculateTotal();
    }

    public function deleteOrderItems($id)
    {
        OrderItem::destroy($id);

        if ($this->orderDetail) {
            $this->total = 0;
            $this->subTotal = 0;

            foreach ($this->orderDetail->items as $value) {
                $this->subTotal = ($this->subTotal + $value->amount);
                $this->total = ($this->total + $value->amount);
            }

            // Use the new tax calculation service
            $taxCalculation = TaxCalculationService::calculateTaxes(
                $this->subTotal, 
                0, // No discount in this context
                $this->restaurantId,
                $this->taxes
            );
            $this->total += $taxCalculation['totalTaxAmount'];

            foreach ($this->extraCharges ?? [] as $value) {
                $this->total += $value->getAmount($this->subTotal);
            }


            Order::where('id', $this->orderDetail->id)->update([
                'sub_total' => $this->subTotal,
                'total' => $this->total
            ]);
        }

        $this->dispatch('refreshPos');
    }

    public function addQty($id)
    {
        if (($this->orderID && !user_can('Update Order')) || (!$this->orderID && !user_can('Create Order'))) {
            return;
        }

        $this->orderItemQty[$id] = isset($this->orderItemQty[$id]) ? ($this->orderItemQty[$id] + 1) : 1;
        $basePrice = $this->orderItemVariation[$id]->price ?? $this->orderItemList[$id]->price;
        $this->orderItemAmount[$id] = $this->orderItemQty[$id] * ($basePrice + ($this->orderItemModifiersPrice[$id] ?? 0));
        $this->calculateTotal();
    }

    public function subQty($id)
    {
        if (($this->orderID && !user_can('Update Order')) || (!$this->orderID && !user_can('Create Order'))) {
            return;
        }

        $this->orderItemQty[$id] = (isset($this->orderItemQty[$id]) && $this->orderItemQty[$id] > 1) ? ($this->orderItemQty[$id] - 1) : 1;
        $basePrice = $this->orderItemVariation[$id]->price ?? $this->orderItemList[$id]->price;
        $this->orderItemAmount[$id] = $this->orderItemQty[$id] * ($basePrice + ($this->orderItemModifiersPrice[$id] ?? 0));
        $this->calculateTotal();
    }

    public function calculateTotal()
    {
        $this->total = 0;
        $this->subTotal = 0;

        if (is_array($this->orderItemAmount)) {
            foreach ($this->orderItemAmount as $key => $value) {
                $modifierTotal = 0;
                $this->subTotal += $value + $modifierTotal;
                $this->total += $value + $modifierTotal;
            }
        }

        $this->discountedTotal = $this->total;

        if ($this->discountValue > 0 && $this->discountType) {
            if ($this->discountType === 'percent') {
                $this->discountAmount = round(($this->subTotal * $this->discountValue) / 100, 2);
            } elseif ($this->discountType === 'fixed') {
                $this->discountAmount = min($this->discountValue, $this->subTotal);
            }

            $this->total -= $this->discountAmount;
        }

        $this->discountedTotal = $this->total;

        // Use the new tax calculation service for correct tax calculation
        $taxFormat = restaurant()->receiptSetting->tax_format ?? 'current';
        $taxCalculation = TaxCalculationService::getTaxCalculation(
            $this->subTotal, 
            $this->discountAmount ?? 0, 
            $this->restaurantId,
            $taxFormat,
            $this->taxes
        );
        
        if ($taxFormat === 'reverse') {
            // In reverse format, the total is the base amount (no additional tax)
            $this->total = $taxCalculation['baseAmount'];
        } else {
            // In current format, add tax to the total
            $this->total += $taxCalculation['totalTaxAmount'];
        }

        if (!empty($this->orderItemAmount) && $this->extraCharges) {
            foreach ($this->extraCharges ?? [] as $charge) {
                $this->total += $charge->getAmount($this->discountedTotal);
            }
        }

        if ($this->tipAmount > 0) {
            $this->total += $this->tipAmount;
        }

        if ($this->deliveryFee > 0) {
            $this->total += $this->deliveryFee;
        }

        // Sync data with customer display
        $this->syncCustomerDisplay();
    }

    public function syncCustomerDisplay()
    {
        // Prepare order data for customer display
        $orderData = [
            'order_number' => $this->orderNumber,
            'order_type' => $this->orderType,
            'table_no' => $this->tableNo,
            'cart_items' => $this->orderItemList,
            'sub_total' => $this->subTotal,
            'discount_amount' => $this->discountAmount ?? 0,
            'total_amount' => $this->total,
        ];

        // Store in session for customer display to access
        session(['current_pos_order' => $orderData]);
    }

    public function addDiscounts()
    {
        $this->validate([
            'discountValue' => 'required|numeric|min:0',
            'discountType' => 'required|in:fixed,percent',
        ]);

        if ($this->discountType === 'percent' && $this->discountValue > 100) {
            $this->alert('error', __('messages.discountPercentError'), [
                'toast' => true,
                'position' => 'top-end',
                'showCancelButton' => false,
                'cancelButtonText' => __('app.close')
            ]);
            return;
        }

        $order = $this->tableOrderID ? $this->tableOrder->activeOrder : $this->orderDetail;

        if ($order) {
            $order->update([
                'discount_type' => $this->discountType,
                'discount_value' => $this->discountValue,
                'discount_amount' => $this->discountAmount,
                'total' => $this->total,
            ]);
        }

        $this->calculateTotal();

        $this->showDiscountModal = false;
    }

    public function removeCurrentDiscount()
    {
        $order = $this->tableOrderID ? $this->tableOrder->activeOrder : $this->orderDetail;

        if ($order) {
            $order->update([
                'discount_type' => null,
                'discount_value' => null,
                'discount_amount' => null,
            ]);
        }

        $this->discountType = null;
        $this->discountValue = null;
        $this->discountAmount = null;
        $this->calculateTotal();
    }

    public function removeExtraCharge($chargeId, $orderType)
    {
        $order = $this->tableOrderID ? $this->tableOrder->activeOrder : $this->orderDetail;

        if ($order) {
            $extraCharge = $this->extraCharges->firstWhere('id', $chargeId);
            if ($extraCharge) {
                $order->extraCharges()->detach($chargeId);
                $this->total -= $extraCharge->getAmount($this->discountedTotal);
                $order->update(['total' => $this->total]);
            }
        }

        $this->extraCharges = $this->extraCharges->filter(function ($charge) use ($chargeId) {
            return $charge->id != $chargeId;
        });

        $this->calculateTotal();
    }

    public function saveOrder($action, $secondAction = null, $thirdAction = null)
    {
        $this->showErrorModal = true;

        $rules = [
            // 'noOfPax' => 'required_if:orderType,dine_in|numeric',
            // 'tableNo' => 'required_if:orderType,dine_in',
            'selectDeliveryExecutive' => Rule::requiredIf($action !== 'cancel' && $this->orderType === 'delivery'),
            'orderItemList' => 'required',
        ];

        if (!$this->orderID && !$this->tableOrderID) {
            $rules['selectWaiter'] = 'required_if:orderType,dine_in';
        }

        $messages = [
            'noOfPax.required_if' => __('messages.enterPax'),
            'tableNo.required_if' => __('messages.setTableNo'),
            'selectWaiter.required_if' => __('messages.selectWaiter'),
            'orderItemList.required' => __('messages.orderItemRequired'),
        ];

        $this->validate($rules, $messages);

        switch ($action) {
            case 'bill':
                $successMessage = __('messages.billedSuccess');
                $status = 'billed';
                $tableStatus = 'running';
                break;

            case 'kot':
                $successMessage = __('messages.kotGenerated');
                $status = 'kot';
                $tableStatus = 'running';
                break;


            case 'cancel':
                $successMessage = __('messages.orderCanceled');
                $status = 'canceled';
                $tableStatus = 'available';
                break;
        }

        // Initialize variables for KOT tracking (needed for both new and existing orders)
        $existingKotItems = [];
        $isUpdatingKotOrder = false;
        $order = null;

        if ((!$this->tableOrderID && !$this->orderID) || ($this->tableOrderID && !$this->tableOrder->activeOrder)) {
            $order = Order::create([
                'order_number' => $this->orderNumber,
                'name' => $this->orderName,
                'date_time' => now(),
                'table_id' => $this->tableId,
                'number_of_pax' => $this->noOfPax,
                'discount_type' => $this->discountType,
                'discount_value' => $this->discountValue,
                'discount_amount' => $this->discountAmount,
                'waiter_id' => $this->selectWaiter,
                'sub_total' => $this->subTotal,
                'total' => $this->total,
                'order_type' => $this->orderType,
                'delivery_executive_id' => ($this->orderType == 'delivery' ? $this->selectDeliveryExecutive : null),
                'status' => $status,
                'order_status' => $this->orderStatus ?? 'preparing',
                'placed_via' => 'pos',
            ]);

            if (!empty($this->extraCharges)) {
                $chargesData = collect($this->extraCharges)
                    ->map(fn($charge) => [
                        'charge_id' => $charge->id,
                    ])->toArray();

                $order->charges()->createMany($chargesData);
            }
            
            // Refresh order to ensure all relationships are loaded
            $order->refresh();
        } else {

            if ($this->orderID) {
                $this->orderDetail = Order::find($this->orderID);
            }

            $order = ($this->tableOrderID ? $this->tableOrder->activeOrder : $this->orderDetail);
            
            // Track existing items for KOT incremental creation
            $isUpdatingKotOrder = ($order->status === 'kot' && $status === 'kot');
            
            if ($isUpdatingKotOrder) {
                // Collect all existing KOT items to identify new ones
                foreach ($order->kot as $kot) {
                    foreach ($kot->items as $kotItem) {
                        $itemKey = $kotItem->menu_item_id . '_' . ($kotItem->menu_item_variation_id ?? '0');
                        $modifierIds = $kotItem->modifierOptions->pluck('id')->sort()->implode(',');
                        $itemKey .= '_' . ($modifierIds ?: 'nomod');
                        
                        if (!isset($existingKotItems[$itemKey])) {
                            $existingKotItems[$itemKey] = 0;
                        }
                        $existingKotItems[$itemKey] += $kotItem->quantity;
                    }
                }
            }

            // Track modification
            $wasModified = ($order->sub_total != $this->subTotal || $order->total != $this->total || 
                           $order->status != $status || $order->name != $this->orderName);
            
            $updateData = [
                'date_time' => now(),
                'name' => $this->orderName,
                'order_type' => $this->orderType,
                'number_of_pax' => $this->noOfPax,
                'waiter_id' => $this->selectWaiter,
                'table_id' => $this->tableId ?? $order->table_id,
                'sub_total' => $this->subTotal,
                'total' => $this->total,
                'status' => $status,
                'order_status' => $this->orderStatus ?? 'preparing'
            ];
            
            if ($wasModified) {
                $updateData['last_modified_at'] = now();
                $updateData['last_modified_by'] = auth()->id();
                $updateData['modification_count'] = $order->modification_count + 1;
            }

            Order::where('id', $order->id)->update($updateData);

            // For billed/paid orders, update items directly
            // For KOT orders, we'll handle items in the KOT creation section
            if ($order->status !== 'kot' || $status !== 'kot') {
                $order->items()->delete();
                $order->taxes()->delete();
            }
        }

        if ($status == 'canceled') {
            $order->delete();

            Table::where('id', $this->tableId)->update([
                'available_status' => $tableStatus
            ]);
            return $this->redirect(route('pos.index'), navigate: true);
        }

        // Handle KOT creation and totals calculation

        if ($status == 'kot') {
            // For updating existing KOT orders: Only create KOTs for new items (incremental approach)
            $newItemsForKot = [];
            
            if ($isUpdatingKotOrder && !empty($existingKotItems)) {
                // Identify new items that don't exist in current KOTs
                foreach ($this->orderItemList as $key => $item) {
                    // Get menu item - either from variation or directly from orderItemList
                    $menuItem = $item;
                    if (isset($this->orderItemVariation[$key])) {
                        $variation = $this->orderItemVariation[$key];
                        // Load menuItem relationship if not already loaded
                        if (!$variation->relationLoaded('menuItem')) {
                            $variation->load('menuItem');
                        }
                        $menuItem = $variation->menuItem ?? $item;
                    }
                    
                    $variationId = isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key]->id : null;
                    $modifierIds = collect($this->itemModifiersSelected[$key] ?? [])->sort()->implode(',');
                    
                    $itemKey = $menuItem->id . '_' . ($variationId ?? '0');
                    $itemKey .= '_' . ($modifierIds ?: 'nomod');
                    $newQuantity = $this->orderItemQty[$key] ?? 1;
                    
                    // Check if this item exists in existing KOTs
                    $existingQuantity = $existingKotItems[$itemKey] ?? 0;
                    
                    // If new quantity is greater than existing, create KOT for the difference
                    if ($newQuantity > $existingQuantity) {
                        $newItemsForKot[$key] = [
                            'menu_item' => $menuItem,
                            'variation' => isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key] : null,
                            'quantity' => $newQuantity - $existingQuantity,
                            'modifiers' => $this->itemModifiersSelected[$key] ?? [],
                            'note' => $this->itemNotes[$key] ?? null,
                        ];
                    }
                }
            } else {
                // New order or converting from another status: Create KOTs for all items
                foreach ($this->orderItemList as $key => $item) {
                    // Get menu item - either from variation or directly from orderItemList
                    $menuItem = $item;
                    if (isset($this->orderItemVariation[$key])) {
                        $variation = $this->orderItemVariation[$key];
                        // Load menuItem relationship if not already loaded
                        if (!$variation->relationLoaded('menuItem')) {
                            $variation->load('menuItem');
                        }
                        $menuItem = $variation->menuItem ?? $item;
                    }
                    
                    $newItemsForKot[$key] = [
                        'menu_item' => $menuItem,
                        'variation' => isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key] : null,
                        'quantity' => $this->orderItemQty[$key] ?? 1,
                        'modifiers' => $this->itemModifiersSelected[$key] ?? [],
                        'note' => $this->itemNotes[$key] ?? null,
                    ];
                }
            }
            
            // Only create KOTs if there are new items
            if (!empty($newItemsForKot)) {
                if (in_array('Kitchen', restaurant_modules()) && in_array('kitchen', custom_module_plugins())) {
                    // Group new items by kot_place_id
                    $groupedItems = [];

                    foreach ($newItemsForKot as $key => $itemData) {
                        $menuItem = $itemData['menu_item'];
                        $kotPlaceId = $menuItem->kot_place_id ?? null;

                        if (!$kotPlaceId) {
                            continue;
                        }

                        $groupedItems[$kotPlaceId][] = [
                            'menu_item_id' => $menuItem->id,
                            'variation_id' => isset($itemData['variation']) && $itemData['variation'] ? $itemData['variation']->id : null,
                            'quantity' => $itemData['quantity'],
                            'modifiers' => $itemData['modifiers'],
                            'note' => $itemData['note'],
                        ];
                    }

                    foreach ($groupedItems as $kotPlaceId => $items) {
                        $kot = Kot::create([
                            'kot_number' => Kot::generateKotNumber($order->branch),
                            'order_id' => $order->id,
                            'kitchen_place_id' => $kotPlaceId,
                            'note' => $isUpdatingKotOrder ? __('modules.order.newItemsAdded') : $this->orderNote,
                        ]);

                        foreach ($items as $item) {
                            $kotItem = KotItem::create([
                                'kot_id' => $kot->id,
                                'menu_item_id' => $item['menu_item_id'],
                                'menu_item_variation_id' => $item['variation_id'],
                                'quantity' => $item['quantity'],
                                'note' => $item['note'],
                            ]);
                            $kotItem->modifierOptions()->sync($item['modifiers']);
                        }
                    }
                } else {
                    // No kitchen module: single KOT for all new items
                    $kot = Kot::create([
                        'kot_number' => Kot::generateKotNumber($order->branch) + 1,
                        'order_id' => $order->id,
                        'note' => $isUpdatingKotOrder ? __('modules.order.newItemsAdded') : $this->orderNote
                    ]);

                    foreach ($newItemsForKot as $key => $itemData) {
                        $menuItem = $itemData['menu_item'];
                        $kotItem = KotItem::create([
                            'kot_id' => $kot->id,
                            'menu_item_id' => $menuItem->id,
                            'menu_item_variation_id' => (isset($itemData['variation']) && $itemData['variation']) ? $itemData['variation']->id : null,
                            'quantity' => $itemData['quantity'],
                            'note' => $itemData['note'],
                        ]);
                        $kotItem->modifierOptions()->sync($itemData['modifiers']);
                    }
                }
            }
            
            // Create/update order items for KOT orders (needed for billing and totals)
            // For KOT orders, order items should reflect all current items (from KOTs + new items)
            if ($isUpdatingKotOrder || !$this->orderID) {
                // Delete existing order items and recreate from current orderItemList
                $order->items()->delete();
                $order->taxes()->delete();
                
                // Create order items from all current items in the cart
                foreach ($this->orderItemList as $key => $value) {
                    $orderItem = OrderItem::create([
                        'order_id' => $order->id,
                        'menu_item_id' => (isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key]->menu_item_id : $this->orderItemList[$key]->id),
                        'menu_item_variation_id' => (isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key]->id : null),
                        'quantity' => $this->orderItemQty[$key],
                        'price' => (isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key]->price : $value->price),
                        'amount' => $this->orderItemAmount[$key],
                        'note' => $this->itemNotes[$key] ?? null,
                    ]);
                    $this->itemModifiersSelected[$key] = $this->itemModifiersSelected[$key] ?? [];
                    $orderItem->modifierOptions()->sync($this->itemModifiersSelected[$key]);
                }
                
                // Create order taxes
                foreach ($this->taxes as $key => $value) {
                    OrderTax::firstOrCreate([
                        'order_id' => $order->id,
                        'tax_id' => $value->id
                    ]);
                }
            }

            // Recalculate totals after KOT creation if editing an existing order
            // Use order items (which now reflect all current items) for calculation
            if ($this->orderID) {
                $this->total = 0;
                $this->subTotal = 0;

                // Recalculate from order items (which include all items from KOTs)
                $order->refresh();
                foreach ($order->items as $item) {
                    $this->subTotal += $item->amount;
                    $this->total += $item->amount;
                }

                // Discount calculation
                $this->discountAmount = 0;

                if ($order->discount_type === 'percent') {
                    $this->discountAmount = round(($this->subTotal * $order->discount_value) / 100, 2);
                } elseif ($order->discount_type === 'fixed') {
                    $this->discountAmount = min($order->discount_value, $this->subTotal);
                }
                $this->discountedTotal = $this->total - $this->discountAmount;
                
                // Taxes - Use the new tax calculation service
                $taxCalculation = TaxCalculationService::calculateTaxes(
                    $this->subTotal, 
                    $this->discountAmount, 
                    $this->restaurantId,
                    $this->taxes
                );
                $this->total += $taxCalculation['totalTaxAmount'];

                // Extra charges
                foreach ($order->extraCharges ?? [] as $charge) {
                    $this->total += $charge->getAmount($this->discountedTotal);
                }

                // Tip and delivery
                if ($this->tipAmount > 0) {
                    $this->total += $this->tipAmount;
                }

                if ($this->deliveryFee > 0) {
                    $this->total += $this->deliveryFee;
                }

                $this->total -= $this->discountAmount;
                Order::where('id', $order->id)->update([
                    'sub_total' => $this->subTotal,
                    'total' => $this->total,
                    'discount_amount' => $this->discountAmount,
                ]);
            }

            if ($secondAction == 'bill' && $thirdAction == 'payment') {
                // Order items and taxes are already created above in the KOT section
                // Now recalculate totals from order items (same as billed section)
                $order->load('charges');
                
                $validCharges = collect($this->extraCharges ?? [])
                    ->filter(fn($charge) => in_array($this->orderType, $charge->order_types));

                $currentChargeIds = $order->charges->pluck('charge_id');
                $validChargeIds = $validCharges->pluck('id');

                // Remove invalid charges and add new valid charges
                $order->charges()->whereNotIn('charge_id', $validChargeIds)->delete();

                $validChargeIds->diff($currentChargeIds)->each(
                    fn($chargeId) =>
                    OrderCharge::create(['order_id' => $order->id, 'charge_id' => $chargeId])
                );

                $this->total = 0;
                $this->subTotal = 0;

                foreach ($order->load('items')->items as $value) {
                    $this->subTotal = ($this->subTotal + $value->amount);
                    $this->total = ($this->total + $value->amount);
                }

                $this->discountedTotal = $this->total;

                if ($order->discount_type === 'percent') {
                    $this->discountAmount = round(($this->subTotal * $order->discount_value) / 100, 2);
                } elseif ($order->discount_type === 'fixed') {
                    $this->discountAmount = min($order->discount_value, $this->subTotal);
                }

                $this->discountedTotal = $this->total - $this->discountAmount;

                // Use the new tax calculation service
                $taxFormat = restaurant()->receiptSetting->tax_format ?? 'current';
                $taxCalculation = TaxCalculationService::getTaxCalculation(
                    $this->subTotal, 
                    $this->discountAmount, 
                    $this->restaurantId,
                    $taxFormat,
                    $this->taxes
                );
                
                if ($taxFormat === 'reverse') {
                    // In reverse format, the total is the base amount (no additional tax)
                    $this->total = $taxCalculation['baseAmount'];
                } else {
                    // In current format, add tax to the total
                    $this->total += $taxCalculation['totalTaxAmount'];
                }

                foreach ($this->extraCharges ?? [] as $value) {
                    $this->total += $value->getAmount($this->discountedTotal);
                }

                if ($this->tipAmount > 0) {
                    $this->total += $this->tipAmount;
                }

                if ($this->deliveryFee > 0) {
                    $this->total += $this->deliveryFee;
                }

                $this->total -= $this->discountAmount;

                // Update order status to billed with recalculated totals
                $order->update([
                    'status' => 'billed',
                    'sub_total' => $this->subTotal,
                    'total' => $this->total,
                    'discount_amount' => $this->discountAmount,
                ]);

                // Refresh order to get updated status
                $order->refresh();
                
                // Dispatch NewOrderCreated event for inventory tracking
                if ($order->placed_via == null || $order->placed_via == 'pos') {
                    NewOrderCreated::dispatch($order);
                }

                // Print KOT first
                $this->printKot($order);
                
                // Then show the payment modal
                $this->dispatch('showPaymentModal', id: $order->id);
                
                // Don't redirect, let the payment modal show
                return;
            }
        }

        if ($status == 'billed') {
            // Calculate payment adjustment for billed orders
            $oldTotal = $order->total ?? 0;
            $amountPaid = $order->amount_paid ?? 0;
            $paymentAdjustment = $this->total - $oldTotal;
            
            // Track if this was a modification
            $wasModified = ($oldTotal != $this->total);

            foreach ($this->orderItemList as $key => $value) {
                $orderItem = OrderItem::create([
                    'order_id' => $order->id,
                    'menu_item_id' => (isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key]->menu_item_id : $this->orderItemList[$key]->id),
                    'menu_item_variation_id' => (isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key]->id : null),
                    'quantity' => $this->orderItemQty[$key],
                    'price' => (isset($this->orderItemVariation[$key]) ? $this->orderItemVariation[$key]->price : $value->price),
                    'amount' => $this->orderItemAmount[$key],
                    'note' => $this->itemNotes[$key] ?? null,
                ]);

                $this->itemModifiersSelected[$key] = $this->itemModifiersSelected[$key] ?? [];
                $orderItem->modifierOptions()->sync($this->itemModifiersSelected[$key]);
            }

            foreach ($this->taxes as $key => $value) {
                OrderTax::create([
                    'order_id' => $order->id,
                    'tax_id' => $value->id
                ]);
            }
            $order->load('charges');

            $validCharges = collect($this->extraCharges ?? [])
                ->filter(fn($charge) => in_array($this->orderType, $charge->order_types));

            $currentChargeIds = $order->charges->pluck('charge_id');
            $validChargeIds = $validCharges->pluck('id');

            // Remove invalid charges and add new valid charges
            $order->charges()->whereNotIn('charge_id', $validChargeIds)->delete();

            $validChargeIds->diff($currentChargeIds)->each(
                fn($chargeId) =>
                OrderCharge::create(['order_id' => $order->id, 'charge_id' => $chargeId])
            );

            $this->total = 0;
            $this->subTotal = 0;

            foreach ($order->load('items')->items as $value) {
                $this->subTotal = ($this->subTotal + $value->amount);
                $this->total = ($this->total + $value->amount);
            }

            $this->discountedTotal = $this->total;

            if ($order->discount_type === 'percent') {
                $this->discountAmount = round(($this->subTotal * $order->discount_value) / 100, 2);
            } elseif ($order->discount_type === 'fixed') {
                $this->discountAmount = min($order->discount_value, $this->subTotal);
            }

            $this->discountedTotal = $this->total - $this->discountAmount;

            // Use the new tax calculation service
            $taxFormat = restaurant()->receiptSetting->tax_format ?? 'current';
            $taxCalculation = TaxCalculationService::getTaxCalculation(
                $this->subTotal, 
                $this->discountAmount, 
                $this->restaurantId,
                $taxFormat,
                $this->taxes
            );
            
            if ($taxFormat === 'reverse') {
                // In reverse format, the total is the base amount (no additional tax)
                $this->total = $taxCalculation['baseAmount'];
            } else {
                // In current format, add tax to the total
                $this->total += $taxCalculation['totalTaxAmount'];
            }

            foreach ($this->extraCharges ?? [] as $value) {
                $this->total += $value->getAmount($this->discountedTotal);
            }

            if ($this->tipAmount > 0) {
                $this->total += $this->tipAmount;
            }

            if ($this->deliveryFee > 0) {
                $this->total += $this->deliveryFee;
            }

            $this->total -= $this->discountAmount;

            Order::where('id', $order->id)->update([
                'sub_total' => $this->subTotal,
                'total' => $this->total,
                'discount_amount' => $this->discountAmount,
            ]);

            // Show payment adjustment message if order was modified
            if ($wasModified && $paymentAdjustment != 0) {
                if ($paymentAdjustment > 0) {
                    $this->alert('info', __('modules.order.additionalPaymentRequired', ['amount' => currency_format(abs($paymentAdjustment), restaurant()->currency_id)]), [
                        'toast' => true,
                        'position' => 'top-end',
                    ]);
                } else {
                    $this->alert('info', __('modules.order.refundDue', ['amount' => currency_format(abs($paymentAdjustment), restaurant()->currency_id)]), [
                        'toast' => true,
                        'position' => 'top-end',
                    ]);
                }
            }

            if ($order->placed_via == null || $order->placed_via == 'pos') {
                NewOrderCreated::dispatch($order);
            }


            $this->resetPos();
        }

        Table::where('id', $this->tableId)->update([
            'available_status' => $tableStatus
        ]);

        $this->dispatch('posOrderSuccess');

        $this->alert('success', $successMessage, [
            'toast' => true,
            'position' => 'top-end',
            'showCancelButton' => false,
            'cancelButtonText' => __('app.close')
        ]);

        if ($status == 'kot') {
            // Skip redirect if we're also billing and showing payment (handled above)
            if ($secondAction == 'bill' && $thirdAction == 'payment') {
                return; // Already handled above
            }
            
            if ($secondAction == 'print') {
                // Check if the 'kitchen' package is enabled
                $this->printKot($order);
            }

            if ($this->orderID) {
                return $this->redirect(route('pos.kot', $order->id) . '?showOrderDetail=true', navigate: true);
            }

            $this->dispatch('resetPos');
            // return $this->redirect(route('kots.index'), navigate: true);
        }

        if ($status == 'billed') {
            // return $this->redirect(route('orders.index'), navigate: true);
            switch ($secondAction) {

                case 'payment':
                    $this->dispatch('showPaymentModal', id: $order->id);
                    break;
                case 'print':

                    $orderPlaces = \App\Models\MultipleOrder::with('printerSetting')->get();

                    foreach ($orderPlaces as $orderPlace) {
                        $printerSetting = $orderPlace->printerSetting;
                    }

                    try {

                        switch ($printerSetting?->printing_choice) {
                            case 'directPrint':
                                $this->handleOrderPrint($order->id);
                                break;
                            default:
                                $url = route('orders.print', $order->id);
                                $this->dispatch('print_location', $url);
                                break;
                        }
                    } catch (\Throwable $e) {
                        $this->alert('error', __('messages.printerNotConnected') . ' ' . $e->getMessage(), [
                            'toast' => true,
                            'position' => 'top-end',
                            'showCancelButton' => false,
                            'cancelButtonText' => __('app.close')
                        ]);
                    }
            }

            if (!in_array($secondAction, ['payment', 'print'])) {
                $this->dispatch('showOrderDetail', id: $order->id);
            }
        }

        // Handle default case outside the switch block

    }

    public function printOrder($order)
    {

        $orderPlaces = \App\Models\MultipleOrder::with('printerSetting')->get();

        foreach ($orderPlaces as $orderPlace) {
            $printerSetting = $orderPlace->printerSetting;
        }

        try {
            switch ($printerSetting?->printing_choice) {

                case 'directPrint':
                    $this->handleOrderPrint($order);
                    break;
                default:
                    $url = route('orders.print', $order);
                    $this->dispatch('print_location', $url);
                    break;
            }
        } catch (\Throwable $e) {
            $this->alert('error', __('messages.printerNotConnected') . ' ' . $e->getMessage(), [
                'toast' => true,
                'position' => 'top-end',
                'showCancelButton' => false,
                'cancelButtonText' => __('app.close')
            ]);
        }
    }

    public function printKot($order)
    {
        // Check if the 'kitchen' package is enabled
        if (in_array('Kitchen', restaurant_modules()) && in_array('kitchen', custom_module_plugins())) {
            // Get all KOTs for this order (created above)
            $kots = $order->kot()->with('items')->get();

            foreach ($kots as $kot) {
                $kotPlaceItems = [];

                foreach ($kot->items as $kotItem) {
                    if ($kotItem->menuItem && $kotItem->menuItem->kot_place_id) {
                        $kotPlaceId = $kotItem->menuItem->kot_place_id;

                        if (!isset($kotPlaceItems[$kotPlaceId])) {
                            $kotPlaceItems[$kotPlaceId] = [];
                        }

                        $kotPlaceItems[$kotPlaceId][] = $kotItem;
                    }
                }

                // Get the kot places and their printer settings
                $kotPlaceIds = array_keys($kotPlaceItems);
                $kotPlaces = KotPlace::with('printerSetting')->whereIn('id', $kotPlaceIds)->get();

                foreach ($kotPlaces as $kotPlace) {
                    $printerSetting = $kotPlace->printerSetting;

                    if ($printerSetting && $printerSetting->is_active == 0) {
                        $printerSetting = Printer::where('is_default', true)->first();
                    }

                    // If no printer is set, fallback to print URL dispatch
                    if (!$printerSetting) {
                        $url = route('kot.print', [$kot->id, $kotPlace?->id]);
                        $this->dispatch('print_location', $url);
                        continue;
                    }

                    try {
                        switch ($printerSetting->printing_choice) {
                            case 'directPrint':
                                $this->handleKotPrint($kot->id, $kotPlace->id);
                                break;
                            default:
                                $url = route('kot.print', [$kot->id, $kotPlace?->id]);
                                $this->dispatch('print_location', $url);
                                break;
                        }
                    } catch (\Throwable $e) {
                        $this->alert('error', __('messages.printerNotConnected') . ' ' . $e->getMessage(), [
                            'toast' => true,
                            'position' => 'top-end',
                            'showCancelButton' => false,
                            'cancelButtonText' => __('app.close')
                        ]);
                    }
                }
            }
        } else {
            $kotPlace = KotPlace::where('is_default', 1)->first();
            $printerSetting = $kotPlace->printerSetting;

            // Get the KOT for this order
            $kot = $order->kot()->first();

            // If no printer is set, fallback to print URL dispatch
            if (!$printerSetting) {
                $url = route('kot.print', [$kot->id, $kotPlace?->id]);
                $this->dispatch('print_location', $url);
            }

            try {
                switch ($printerSetting->printing_choice) {
                    case 'directPrint':
                        $this->handleKotPrint($kot->id, $kotPlace->id);
                        break;

                    default:
                        $url = route('kot.print', [$kot->id]);
                        $this->dispatch('print_location', $url);
                        break;
                }
            } catch (\Throwable $e) {
                $this->alert('error', __('messages.printerNotConnected') . ' ' . $e->getMessage(), [
                    'toast' => true,
                    'position' => 'top-end',
                    'showCancelButton' => false,
                    'cancelButtonText' => __('app.close')
                ]);
            }
        }
    }

    #[On('resetPos')]
    public function resetPos()
    {
        $this->search = null;
        $this->filterCategories = null;
        $this->menuItem = null;
        $this->subTotal = 0;
        $this->total = 0;
        $this->orderNumber = Order::generateOrderNumber(branch());
        $this->discountedTotal = 0;
        $this->tipAmount = 0;
        $this->deliveryFee = 0;
        $this->tableNo = null;
        $this->tableId = null;
        $this->noOfPax = null;
        $this->selectWaiter = user()->id;
        $this->orderItemList = [];
        $this->orderItemVariation = [];
        $this->orderItemQty = [];
        $this->orderItemAmount = [];
        $this->orderType = 'dine_in';
        $this->discountType = null;
        $this->discountValue = null;
        $this->showDiscountModal = false;
        $this->selectedModifierItem = null;
        $this->modifiers = null;
        $this->itemModifiersSelected = [];
        $this->discountAmount = null;
        $this->orderStatus;
        $this->showNewKotButton = false;
        $this->itemNotes = []; // Reset item notes
        $this->orderName = null; // Reset order name
        $this->orderNote = null; // Reset order note
    }

    public function showAddDiscount()
    {
        $orderDetail = Order::find($this->orderID);
        $this->discountType = $orderDetail->discount_type ?? $this->discountType ?? 'fixed';
        $this->discountValue = $orderDetail->discount_value ?? $this->discountValue ?? null;
        $this->showDiscountModal = true;
    }

    #[On('closeModifiersModal')]
    public function closeModifiersModal()
    {
        $this->selectedModifierItem = null;
        $this->showModifiersModal = false;
    }

    #[On('setPosModifier')]
    public function setPosModifier($modifierIds)
    {
        $this->showModifiersModal = false;

        $sortNumber = Str::of(implode('', Arr::flatten($modifierIds)))
            ->split(1)->sort()->implode('');

        $keyId = $this->selectedModifierItem . '-' . $sortNumber;
        if (isset(explode('_', $this->selectedModifierItem)[1])) {
            $menuItemVariation = MenuItemVariation::find(explode('_', $this->selectedModifierItem)[1]);
            $this->orderItemVariation[$keyId] = $menuItemVariation;
            $this->selectedModifierItem = explode('_', $this->selectedModifierItem)[0];
            $this->orderItemAmount[$keyId] = 1 * ($this->orderItemVariation[$keyId]->price ?? $this->orderItemList[$keyId]->price);
        }

        $this->itemModifiersSelected[$keyId] = Arr::flatten($modifierIds);
        $this->orderItemQty[$this->selectedModifierItem] = isset($this->orderItemQty[$this->selectedModifierItem]) ? ($this->orderItemQty[$this->selectedModifierItem] + 1) : 1;

        $modifierTotal = collect($this->itemModifiersSelected[$keyId])
            ->sum(fn($modifierId) => $this->getModifierOptionsProperty()[$modifierId]->price);

        $this->orderItemModifiersPrice[$keyId] = (1 * (isset($this->itemModifiersSelected[$keyId]) ? $modifierTotal : 0));

        $this->syncCart($keyId);
    }

    public function getModifierOptionsProperty()
    {
        return ModifierOption::whereIn('id', collect($this->itemModifiersSelected)->flatten()->all())->get()->keyBy('id');
    }

    public function saveDeliveryExecutive()
    {
        $this->orderDetail->update(['delivery_executive_id' => $this->selectDeliveryExecutive]);
        $this->orderDetail->refresh();
        $this->alert('success', __('messages.deliveryExecutiveAssigned'), [
            'toast' => true,
            'position' => 'top-end',
            'showCancelButton' => false,
            'cancelButtonText' => __('app.close')
        ]);
    }

    public function cancelOrder()
    {
        if (!$this->cancelReason) {
            $this->alert('error', __('Please select a cancellation reason.'), [
                'toast' => true,
                'position' => 'top-end',
                'showCancelButton' => false,
                'cancelButtonText' => __('app.close'),
            ]);
            return;
        }

        if ($this->orderID) {
            $order = Order::find($this->orderID);

            if ($order) {

                $order->update([
                    'status' => 'canceled',
                    'order_status' => 'cancelled',
                    'cancel_reason_id' => $this->cancelReason,
                    'cancel_reason_text' => $this->cancelReasonText ?? null,
                ]);

                Table::where('id', $order->table_id)->update([
                    'available_status' => 'available',
                ]);

                $this->alert('success', __('messages.orderCanceled'), [
                    'toast' => true,
                    'position' => 'top-end',
                    'showCancelButton' => false,
                    'cancelButtonText' => __('app.close'),
                ]);

                $this->confirmDeleteModal = false;
                $this->cancelReason = null;
                $this->cancelReasonText = null;

                return $this->redirect(route('pos.index'), navigate: true);
            }
        }
    }

    public function updatedSelectWaiter($value)
    {
        if ($this->orderID) {
            $order = Order::find($this->orderID);

            if ($order) {
                if ($value) {
                    $order->update(['waiter_id' => $value]);
                    $this->alert('success', __('messages.waiterUpdated'), [
                        'toast' => true,
                        'position' => 'top-end',
                        'showCancelButton' => false,
                        'cancelButtonText' => __('app.close'),
                    ]);
                } else {
                    $this->selectWaiter = $order->waiter_id;
                }
            }
        }
    }

    public function closeErrorModal()
    {
        $this->showErrorModal = false;
        $this->showNewKotButton = false;
    }

    public function render()
    {

        $query = MenuItem::with(['variations', 'modifierGroups'])->withCount('variations', 'modifierGroups');

        if (!empty($this->filterCategories)) {
            $query = $query->where('item_category_id', $this->filterCategories);
        }

        if (!empty($this->search)) {
            $query->where(function ($q) {
                $q->where('item_name', 'like', '%' . $this->search . '%')
                    ->orWhereHas('translations', function ($q) {
                        $q->where('item_name', 'like', '%' . $this->search . '%');
                    });
            });
        }

        $query = $query->get();

        return view('livewire.pos.pos', [
            'menuItems' => $query
        ]);
    }

    // Update item notes and save to database if applicable
    public function updateItemNote($itemId, $note)
    {
        $this->itemNotes[$itemId] = $note;

        if (!$this->orderDetail) {
            return;
        }

        // Extract the KOT ID and item ID from the itemId string
        $parts = explode('_', str_replace('"', '', $itemId));

        if (count($parts) < 3 || $parts[0] !== 'kot') {
            return;
        }

        KotItem::where('kot_id', $parts[1])
            ->where('id', $parts[2])
            ->update(['note' => $note]);
    }
}
