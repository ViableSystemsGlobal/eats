{{-- Customer Display - Read Only Order Details --}}
<div class="min-h-screen bg-white dark:bg-gray-900 p-6">
    {{-- Header --}}
    <div class="text-center mb-8">
        <h1 class="text-3xl font-bold text-gray-900 dark:text-white">{{ restaurant()->name }}</h1>
        <p class="text-gray-600 dark:text-gray-400 mt-2">Order Details</p>
    </div>

    {{-- Order Information --}}
    @if(isset($orderNumber) && $orderNumber)
    <div class="max-w-2xl mx-auto">
        {{-- Order Header --}}
        <div class="bg-gray-50 dark:bg-gray-800 rounded-lg p-6 mb-6">
            <div class="flex justify-between items-center">
                <div>
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Order #{{ $orderNumber }}</h2>
                    <p class="text-gray-600 dark:text-gray-400 mt-1">{{ now()->format('F d, Y g:i A') }}</p>
                </div>
                <div class="text-right">
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium
                        @if($orderType == 'dine_in') bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200
                        @elseif($orderType == 'delivery') bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200
                        @else bg-orange-100 text-orange-800 dark:bg-orange-900 dark:text-orange-200
                        @endif">
                        @lang('modules.order.' . $orderType)
                    </span>
                </div>
            </div>

            {{-- Table Info for Dine-in --}}
            @if($orderType == 'dine_in' && isset($tableNo) && $tableNo)
            <div class="mt-4 flex items-center gap-2 text-gray-700 dark:text-gray-300">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 44.999 44.999">
                    <path d="m42.558 23.378 2.406-10.92a1.512 1.512 0 0 0-2.954-.652l-2.145 9.733h-9.647a1.512 1.512 0 0 0 0 3.026h.573l-3.258 7.713a1.51 1.51 0 0 0 1.393 2.102c.59 0 1.15-.348 1.394-.925l2.974-7.038 4.717.001 2.971 7.037a1.512 1.512 0 1 0 2.787-1.177l-3.257-7.713h.573a1.51 1.51 0 0 0 1.473-1.187m-28.35 1.186h.573a1.512 1.512 0 0 0 0-3.026H5.134L2.99 11.806a1.511 1.511 0 1 0-2.954.652l2.406 10.92a1.51 1.51 0 0 0 1.477 1.187h.573L1.234 32.28a1.51 1.51 0 0 0 .805 1.98 1.515 1.515 0 0 0 1.982-.805l2.971-7.037 4.717-.001 2.972 7.038a1.514 1.514 0 0 0 1.982.805 1.51 1.51 0 0 0 .805-1.98z"/>
                    <path d="M24.862 31.353h-.852V18.308h8.13a1.513 1.513 0 1 0 0-3.025H12.856a1.514 1.514 0 0 0 0 3.025h8.13v13.045h-.852a1.514 1.514 0 0 0 0 3.027h4.728a1.513 1.513 0 1 0 0-3.027"/>
                </svg>
                <span class="font-medium">Table {{ $tableNo }}</span>
            </div>
            @endif
        </div>

        {{-- Order Items --}}
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-sm border border-gray-200 dark:border-gray-700">
            <div class="px-6 py-4 border-b border-gray-200 dark:border-gray-700">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Your Order</h3>
            </div>
            
            <div class="divide-y divide-gray-200 dark:divide-gray-700">
                @if(isset($cartItems) && count($cartItems) > 0)
                    @foreach($cartItems as $item)
                    <div class="px-6 py-4">
                        <div class="flex justify-between items-start">
                            <div class="flex-1">
                                <div class="flex items-center gap-3">
                                    <span class="text-lg font-medium text-gray-900 dark:text-white">{{ $item['quantity'] }}x</span>
                                    <div>
                                        <h4 class="font-medium text-gray-900 dark:text-white">{{ $item['item_name'] }}</h4>
                                        @if(isset($item['variations']) && count($item['variations']) > 0)
                                            <div class="text-sm text-gray-600 dark:text-gray-400 mt-1">
                                                @foreach($item['variations'] as $variation)
                                                    <span class="inline-block bg-gray-100 dark:bg-gray-700 px-2 py-1 rounded text-xs mr-1 mb-1">
                                                        {{ $variation['variation_name'] }}
                                                    </span>
                                                @endforeach
                                            </div>
                                        @endif
                                        @if(isset($item['modifiers']) && count($item['modifiers']) > 0)
                                            <div class="text-sm text-gray-600 dark:text-gray-400 mt-1">
                                                @foreach($item['modifiers'] as $modifier)
                                                    <span class="inline-block bg-gray-100 dark:bg-gray-700 px-2 py-1 rounded text-xs mr-1 mb-1">
                                                        {{ $modifier['modifier_name'] }}
                                                    </span>
                                                @endforeach
                                            </div>
                                        @endif
                                        @if(isset($item['note']) && $item['note'])
                                            <div class="text-sm text-gray-600 dark:text-gray-400 mt-1 italic">
                                                "{{ $item['note'] }}"
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <span class="font-medium text-gray-900 dark:text-white">
                                    {{ currency_format($item['total_price'], restaurant()->currency_id) }}
                                </span>
                            </div>
                        </div>
                    </div>
                    @endforeach
                @else
                    <div class="px-6 py-8 text-center">
                        <div class="text-gray-500 dark:text-gray-400">
                            <svg class="mx-auto h-12 w-12 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                            </svg>
                            <p class="text-lg font-medium">No items in order yet</p>
                            <p class="text-sm">Items will appear here as they are added</p>
                        </div>
                    </div>
                @endif
            </div>

            {{-- Order Summary --}}
            @if(isset($cartItems) && count($cartItems) > 0)
            <div class="px-6 py-4 bg-gray-50 dark:bg-gray-700 rounded-b-lg">
                <div class="space-y-2">
                    {{-- Subtotal --}}
                    <div class="flex justify-between text-sm">
                        <span class="text-gray-600 dark:text-gray-400">Subtotal</span>
                        <span class="font-medium">{{ currency_format($subTotal ?? 0, restaurant()->currency_id) }}</span>
                    </div>

                    {{-- Discount --}}
                    @if(isset($discountAmount) && $discountAmount > 0)
                    <div class="flex justify-between text-sm">
                        <span class="text-gray-600 dark:text-gray-400">Discount</span>
                        <span class="font-medium text-green-600">-{{ currency_format($discountAmount, restaurant()->currency_id) }}</span>
                    </div>
                    @endif

                    {{-- Tax Breakdown --}}
                    @if(isset($taxCalculation))
                        @foreach($taxCalculation['levies'] as $levy)
                        <div class="flex justify-between text-sm">
                            <span class="text-gray-600 dark:text-gray-400">{{ $levy['tax']->tax_name }} ({{ $levy['tax']->tax_percent }}%)</span>
                            <span class="font-medium">{{ currency_format($levy['amount'], restaurant()->currency_id) }}</span>
                        </div>
                        @endforeach

                        @if(isset($taxCalculation['taxFormat']) && $taxCalculation['taxFormat'] === 'reverse')
                            {{-- Reverse Format: Don't show subtotal after levies --}}
                        @else
                            @if(isset($taxCalculation['subtotalAfterLevies']))
                            <div class="flex justify-between text-sm font-semibold">
                                <span class="text-gray-700 dark:text-gray-300">Subtotal after levies</span>
                                <span class="font-bold">{{ currency_format($taxCalculation['subtotalAfterLevies'], restaurant()->currency_id) }}</span>
                            </div>
                            @endif
                        @endif

                        @if($taxCalculation['vat'])
                        <div class="flex justify-between text-sm">
                            <span class="text-gray-600 dark:text-gray-400">{{ $taxCalculation['vat']['tax']->tax_name }} ({{ $taxCalculation['vat']['tax']->tax_percent }}%)</span>
                            <span class="font-medium">{{ currency_format($taxCalculation['vat']['amount'], restaurant()->currency_id) }}</span>
                        </div>
                        @endif
                    @endif

                    {{-- Total --}}
                    <div class="flex justify-between text-lg font-bold border-t border-gray-200 dark:border-gray-600 pt-2 mt-2">
                        <span class="text-gray-900 dark:text-white">Total</span>
                        <span class="text-gray-900 dark:text-white">{{ currency_format($totalAmount ?? 0, restaurant()->currency_id) }}</span>
                    </div>
                </div>
            </div>
            @endif
        </div>

        {{-- Footer --}}
        <div class="text-center mt-8 text-gray-500 dark:text-gray-400 text-sm">
            <p>Thank you for your order!</p>
            <p class="mt-1">Please wait while we prepare your food</p>
        </div>
    </div>
    @else
    {{-- No Order State --}}
    <div class="max-w-2xl mx-auto text-center">
        <div class="bg-gray-50 dark:bg-gray-800 rounded-lg p-12">
            <svg class="mx-auto h-16 w-16 text-gray-400 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-2">No Active Order</h3>
            <p class="text-gray-600 dark:text-gray-400">Order details will appear here when an order is being processed</p>
        </div>
    </div>
    @endif
</div>

{{-- Auto-refresh script for real-time updates --}}
<script>
    // Auto-refresh every 5 seconds to get latest order details
    setInterval(function() {
        window.location.reload();
    }, 5000);
</script> 