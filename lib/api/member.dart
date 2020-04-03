import 'package:agent37_flutter/utils/request.dart';


class MemberApi{
  static String agentMemberApi = '/agentMemberApi';
  static String giftpackageApi = '/giftpackageApi';

  // 收货地址信息
  addressInfo() async {
    return await service().get('$agentMemberApi/v1/consigneeAddresses/info');
  }

  // 保存地址信息
  /* 
  "address": "string",
  "areaCode": 0,
  "city": "string",
  "consigneeName": "string",
  "district": "string",
  "mobile": "string",
  "province": "string"
   */
  updateAddress(data) async {
    return await service().post('$agentMemberApi/v1/consigneeAddresses', data: data);
  }

  // 礼包列表
  giftpackage() async {
    return await service().get('$giftpackageApi/v1/giftPackages');
  }
}