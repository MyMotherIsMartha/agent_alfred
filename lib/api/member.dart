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

  // ----会员企业接口-----
  //  当前企业信息
  getEnterpriseInfo() async {
    return await service().get('$agentMemberApi/v1/agentEnterpriseInfos');
  }
  
  getPerfectInfo() async {
    return await service().get('$agentMemberApi/v1/agentEnterpriseInfos/prefect');
  }
  //  更新企业信息
  updateEnterpriseInfo(params) async {
    var r = await service().put('$agentMemberApi/v1/agentEnterpriseInfos',
    data: params);
    return r;
  }
  //  完善企业信息
  perfectEnterpriseInfo(params) async {
    var r = await service().put('$agentMemberApi/v1/agentEnterpriseInfos/prefect',
    data: params);
    return r;
  }

  // 获取用户信息
  getUserinfo() async {
    return await service().get('$agentMemberApi/v1/agentMemberInfos/personalInfo');
  }

  // 首页数据
  getHomeInfo() async {
    return await service().get('$agentMemberApi/v1/index');
  }
}