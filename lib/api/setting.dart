import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';

class SettingApi{
  static String agentMemberApi = '/agentMemberApi';
  
  // 更新头像与昵称
  /* 
    headSculptureUrl
    nickname
   */
  updateNameAndAvatar(data) async {
    return await service().put('$agentMemberApi/v1/agentMemberAccounts/updateAgentMemberAccount', data: data);
  }

  // 设置密码
  setPassword(password) async {
    return await service().put('$agentMemberApi/v1/agentMemberAccounts/setPassword', data: {
      'password1': password,
      'password2': password,
    });
  }

  // 发送用于原手机验证的验证码
  applySmsCode() async {
    return await service().get('$agentMemberApi/v1/smsCodeSenders/changeMobileApplySmsCode');
  }

  // 原手机验证
  /* 
    'smsCode': smsCode
   */
  checkSmsCode(smsCode) async {
    return await service().put('$agentMemberApi/v1/agentMemberAccounts/validChangeMobileApplySmsCode', data: {
      'smsCode': smsCode
    });
  }

  // 发送用于新手机验证的验证码
  applyChangeSmsCode(mobile) async {
    return await service().get('$agentMemberApi/v1/smsCodeSenders/changeMobileVerifySmsCode', queryParameters: {
      'mobile': mobile
    });
  }

  // 新手机验证
  /* 
    'mobile': mobile,
    'newMobile': mobile,
    'smsCode': smsCode
   */
  checkChangeSmsCode(data) async {
    return await service().put('$agentMemberApi/v1/agentMemberAccounts/changeMobileVerify', data: data);
  }
}