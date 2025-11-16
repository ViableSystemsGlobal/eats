<a @if(!pusherSettings()->is_enabled_pusher_broadcast) wire:poll.15s @endif href="{{ route('orders.index') }}?status=unserved" wire:navigate
    class="hidden lg:inline-flex items-center px-3 py-1.5 text-sm font-medium text-center text-gray-600 bg-white border-skin-base border rounded-md focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-gray-800 dark:text-gray-300">
    @lang('modules.order.unservedOrdersToday')
    <span
        class="inline-flex items-center justify-center px-2 py-0.5 ms-2 text-xs font-semibold text-white bg-red-500 rounded-md">
        {{ $count }}
    </span>
</a>

@push('scripts')
    @if(pusherSettings()->is_enabled_pusher_broadcast)
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const channel = PUSHER.subscribe('today-orders');
                channel.bind('today-orders.updated', function(data) {
                    @this.call('refreshOrders');
                    console.log('✅ Pusher received data for unserved orders!. Refreshing...');
                });
                PUSHER.connection.bind('connected', () => {
                    console.log('✅ Pusher connected for Unserved Orders!');
                });
                channel.bind('pusher:subscription_succeeded', () => {
                    console.log('✅ Subscribed to today-orders channel for unserved orders!');
                });
            });
        </script>
    @endif
@endpush 