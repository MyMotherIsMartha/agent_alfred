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

  // 查询指定礼包
  giftpackageDetail(no) async {
    return await service().get('$giftpackageApi/v1/giftPackages/$no');
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


  // 首页消息总数
  getMessageCount() async {
    return await service().get('/agentMessageApi/v1/appMemberMessage/getUnreadMessageCount');
  }

  // 当前代理资格任务
  checkOrderRecords() async {
    return await service().get('$agentMemberApi/v1/checkOrderRecords');
  }

  // 申请考核延迟审核
  applyCheckDelayAudit() async {
    return await service().put('$agentMemberApi/v1/checkOrderRecords/applyCheckDelayAudit');
  }

  // 申请资质延迟审核
  applyQualificationsDelayAudit() async {
    return await service().put('$agentMemberApi//v1/agentMemberAccounts/applyQualificationsDelayAudit');
  }

  // 查询当前代理服务费
  serviceCharges() async {
    return await service().get('$agentMemberApi/v1/agentMemberServiceCharges/current');
  }

  // ----代理商管理接口----
  //  当前代理商下级代理统计信息
  getAgentStatistics() async {
    return await service().get('$agentMemberApi/v1/checkOrderRecords/statistics');
  }
  // 下级代理商
  getAgentChildren(params) async {
    var r = await service().get('$agentMemberApi//v1/agentMemberAccounts/childs',
    queryParameters: params);
    return r;
  }
  // 发送验证下级代理短信验证码
  getAgentVerifyCode(code) async {
    var r = await service().get('$agentMemberApi/v1/smsCodeSenders/sendVerifySubAgentSmsCode/$code');
    return r;
  }
  // 短信验证下级代理
  verifySubAgent(data) async {
      var r = await service().post('$agentMemberApi/v1/agentMemberAccounts/verifySubAgent', data: data);
      return r;
    }
  }