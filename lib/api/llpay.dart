import 'package:agent37_flutter/utils/request.dart';

//  企业营业执照上传
class LLpayApi{
  static String serviceAccountApi = '/llpay';

  //  获取银行列表
  getFindBankList() async {
    var r = await service().post('$serviceAccountApi/v1/bank/bind/findBankList');
    return r;
  }

  //  绑定银行卡信息(如果有绑定则先解绑)
  bindBankCard(data) async {
    var r = await service().post('$serviceAccountApi/v1/bank/bind/bindBank', data: data);
    print(r);
    return r;
  }

  //  根据token获取用户绑定的银行卡信息
  getUserBankInfo() async {
    var r = await service().post('$serviceAccountApi/v1/bank/bind/getBankInfoByAccountId');
    print(r);
    return r;
  }
}