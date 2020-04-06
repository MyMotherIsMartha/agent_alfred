import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';


class OrderApi{
  static String orderPrefix = '/orderApi';

  // 当前礼包订单信息
  getGiftPackageOrders() async {
    return await service().get('$orderPrefix/v1/giftPackageOrders/current');
  }

}