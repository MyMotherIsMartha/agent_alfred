import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';

class LoginApi{
  static String serviceAccountApi = '/agentMemberApi';
  login() async {
    var r = await service().get('$serviceAccountApi/v1/appMemberMessage/getUnreadMessageCount');
    print(r);
    return r;
  }
}