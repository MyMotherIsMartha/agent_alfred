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

  // 搜索佣金订单
  searchOrder(String searchKey, int pageNo) async {
    return await service().get('$orderPrefix/v1/giftPackageOrders/searchOrderCommissions', queryParameters: {
      'pageSize': 10,
      'pageNo': pageNo,
      'searchKey': searchKey
    });
  }
  //  分页查询app会员信息
  getAppMemberInfos(data) async {
    return await service().get('$orderPrefix/v1/appMemberInfos/page', queryParameters: data);
  }
  //  统计会员总数
  getAppMemberAmount() async {
    return await service().get('$orderPrefix/v1/appMemberInfos/statisticsMemberNum');
  }
  //  会员服务费详细
  getAppMemberDetail(id) async {
    return await service().get('$orderPrefix/v1/appMemberInfos/$id');
  }
  //  分页查询app会员信息
  getAppMemberCommissions(data) async {
    return await service().get('$orderPrefix/v1/appOrderItems/pageForPurchaseOrderCommission', queryParameters: data);
  }

  // ------------- 发票相关接口 ---------------
  //  服务费结款详细
  getMakeMoneyById(id) async {
    return await service().get('$orderPrefix/v1/statisticsMakeMoneyRecords/${id}');
  }
  //  当前结算服务费列表
  getMakeMoneyList(params) async {
    return await service().get('$orderPrefix/v1/statisticsMakeMoneyRecords/settlementStatisticsOrders', queryParameters: params);
  }
  //  上传服务费发票
  uploadInvoice(data) async {
    return await service().put('$orderPrefix/v1/statisticsMakeMoneyRecords/uploadInvoice', data: data);
  }
}