import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

/// Event 修改需要刷新的订单列表索引
class RefreshOrderEvent {
  List<int> refreshOrder;
  RefreshOrderEvent(this.refreshOrder);
}