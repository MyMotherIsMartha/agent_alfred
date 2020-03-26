import 'package:agent37_flutter/utils/request.dart';


class LoginApi{
  static String sserviceAuthApi = '/agentAuthApi';
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
    var r = await service().post('$sserviceAuthApi/login/mobile', data: data);
    print(r);
    return r;
  }
}