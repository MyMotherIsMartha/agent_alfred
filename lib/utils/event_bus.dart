import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

/// Event 修改需要刷新的订单列表索引
class OrderInfoBus {
  String giftPackageNo;
  String price;
  OrderInfoBus(this.giftPackageNo, this.price);
}