import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';


class OrderApi{
  static String orderPrefix = '/orderApi';

  // 当前礼包订单信息
  getGiftPackageOrders() async {
    return await service().get('$orderPrefix/v1/giftPackageOrders/current');
  }

  // 阿里支付
  aliPay(data) async {
    return await service().post('$orderPrefix/v1/giftPackagePayments/aliPay', data: data);
  }

  // 微信支付
  wechatPay(data) async {
    return await service().post('$orderPrefix/v1/giftPackagePayments/weixinPay', data: data);
  }

  // 线下支付
  offlinePay(data) async {
    return await service().post('$orderPrefix/v1/giftPackagePayments/offlinePay', data: data);
  }

}