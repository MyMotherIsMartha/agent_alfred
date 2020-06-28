import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';

//  企业营业执照上传
class DicApi{
  static String serviceAccountApi = '/dic';
  static String marketingApi = '/agentMarketingApi';
  getOccupations() async {
    var r = await service().get('$serviceAccountApi/v1/occupations');
    return r;
  }

  // getTradeList() async {
  //   var r = await service().post('$marketingApi/v1/api/trade/findAllTradeList');
  //   return r;
  // }

  getTradeList() async {
    var params = {
      "companyRegister": 1,
      "pageNo": 1,
      "pageSize": 100
    };
    var r = await service().post('$marketingApi/v1/api/trade/findTradeList', data: params);
    return r;
  }
}