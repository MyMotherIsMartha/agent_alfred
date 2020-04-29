import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';

class FinanceApi{
  static String ordertApi = '/orderApi';
  static String agentFinanceApi = '/agentFinanceApi';


  // 分页查询商品销售订单
  /* 
  beginPayDate 开始支付时间
  endPayDate 结束时间
  settleStatus 结算状态 1:待结算; 2：已结算; 3:已关闭
   */
  fetchProduct(pageNo, settleStatus, {DateTime beginPayDate, DateTime endPayDate}) async {
    return await service().get('$ordertApi/v1/appOrderItems/purchaseOrderCommissions', queryParameters: {
      'pageSize': 10,
      'pageNo': pageNo,
      'settleStatus': settleStatus,
      'beginPayDate': G.formatTime(beginPayDate.millisecondsSinceEpoch, type: 'date' ),
      'endPayDate': G.formatTime(endPayDate.millisecondsSinceEpoch, type: 'date'),
    });
  }

  // 分页查询会员订单
  /* 
  beginPayDate 开始支付时间
  endPayDate 结束时间
  settleStatus 结算状态 1:待结算; 2：已结算; 3:已关闭
   */
  fetchMemberOrder(pageNo, settleStatus, {DateTime beginPayDate, DateTime endPayDate}) async {
    return await service().get('$ordertApi/v1/appMemberOrders/memberOrderCommissions', queryParameters: {
      'pageSize': 10,
      'pageNo': pageNo,
      'settleStatus': settleStatus,
      'beginPayDate': G.formatTime(beginPayDate.millisecondsSinceEpoch, type: 'date' ),
      'endPayDate': G.formatTime(endPayDate.millisecondsSinceEpoch, type: 'date'),
    });
  }

  // 分页查询会员订单
  /* 
  beginPayDate 开始支付时间
  endPayDate 结束时间
  settleStatus 结算状态 1:待结算; 2：已结算; 3:已关闭
   */
  fetchPackageOrder(pageNo, settleStatus, {DateTime beginPayDate, DateTime endPayDate}) async {
    return await service().get('$ordertApi/v1/giftPackageOrders/giftPackageOrderCommissions', queryParameters: {
      'pageSize': 10,
      'pageNo': pageNo,
      'settleStatus': settleStatus,
      'beginPayDate': G.formatTime(beginPayDate.millisecondsSinceEpoch, type: 'date' ),
      'endPayDate': G.formatTime(endPayDate.millisecondsSinceEpoch, type: 'date'),
    });
  }


  // 不对接连连支付提现申请
  withDrawalApply(params) async {
    return await service().post('$agentFinanceApi/v1/agentTradeOrders/withDrawalApply', data: params);
  }
  // 分页查询历史记录
  getPaymentHistory(params) async {
    return await service().get('$agentFinanceApi/v1/paymentAccountHistorys/page', queryParameters: params);
  }
  // 查询当前支付账户信息
  getAccountInfo() async {
    return await service().get('$agentFinanceApi/v1/paymentAccounts');
  }
}