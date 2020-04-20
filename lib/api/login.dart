import 'package:agent37_flutter/utils/request.dart';


class LoginApi{
  static String serviceAuthApi = '/agentAuthApi';
  static String agentMemberApi = '/agentMemberApi';

  // 登录
  login(String mobile, {String pwd, String sms}) async {
    Map data = {
      'mobile': mobile,
    };
    if (pwd != null && pwd.isNotEmpty) {
      data['password'] = pwd;
    }
    if (sms != null && sms.isNotEmpty) {
      data['smsCode'] = sms;
    }
    return await service().post('$serviceAuthApi/login/mobile', data: data);
  }

  // 获取登录验证码
  getLoginSmsCode(mobile) async {
    return await service().post('$serviceAuthApi/v1/agentSmsSenders/login', data: {
      'mobile': mobile
    });
  }

  // 获取注册验证码
  getRegisterSmsCode(mobile) async {
    return await service().post('$serviceAuthApi/v1/agentSmsSenders/register', data: {
      'mobile': mobile
    });
  }

  // 注册
  register(data) async {
    return await service().post('$serviceAuthApi/register/mobile', data: data);
  }

  // 获取代理状态信息
  getUserInfo() async {
    return await service().get('$agentMemberApi/v1/agentContacts/current');
  }

  // 设置代理状态信息
  setUserInfo(data) async {
    return await service().post('$agentMemberApi/v1/agentContacts', data: data);
  }

  // 用户认证信息
  getUserAuth() async {
    return await service().get('$agentMemberApi/v1/agentMemberAccounts/current');
  }

  // 发送忘记密码验证码
  forgetSms(mobile) async {
    return await service().post('$serviceAuthApi/v1/agentSmsSenders/forgetPassword', data: {
      'mobile': mobile
    });
  }
}