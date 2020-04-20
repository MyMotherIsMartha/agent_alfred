import 'package:agent37_flutter/api/login.dart';
import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/models/user-auth.dart';
import 'package:agent37_flutter/models/userinfo.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter/material.dart';

class UserProvide with ChangeNotifier{
  UserAuthModel userAuthInfo;
  UserinfoModel userinfo;
  bool getInfoFlag = true;

  getUserInfo() async {
    if (!getInfoFlag) return;
    print('get userinfo from provide');
    var result = await MemberApi().getUserinfo();
    if (result.data['code'] == 200) {
      getInfoFlag = false;
      print(result.data['data']);
      userinfo = userinfoModelFromJson(result.data['data']);
      notifyListeners();
    }
  }

  refreshUserinfo() {
    getInfoFlag = true;
    notifyListeners();
  }

  setUserInfo(data) async {
    var result = await LoginApi().setUserInfo(data);
    if (result.data['code'] == 200) {
      if (!userAuthInfo.isContactsPrefected) {
        // 获取新的认证信息 
        notifyListeners();
      }
      G.toast('更新成功');
      updateUserAuth();
    } else {
      G.toast('更新失败');
    }
  }

  updateUserAuth() async {
    var result = await LoginApi().getUserAuth();
    print(result.data.toString());
    if (result.data['code'] == 200) {
      print(result.data['data']);
      userAuthInfo = UserAuthModel.fromJson(result.data['data']);
      if (!userAuthInfo.isContactsPrefected) {
        G.router.navigateTo(G.currentContext, '/update-user', replace: true);
        notifyListeners();
        return;
      }
      if (userAuthInfo.giftPackageOrderStatus == null
      //  || userAuthInfo.giftPackageOrderStatus == 0
       || userAuthInfo.giftPackageOrderStatus == -1
       || userAuthInfo.giftPackageOrderStatus == -2
      ) {
        G.router.navigateTo(G.currentContext, '/create-account', replace: true);
        notifyListeners();
        return;
      } else {
        int status = userAuthInfo.voucherStatus;
        switch (status) {
          case 1:
          case 3:
            G.router.navigateTo(G.currentContext, '/order-result', replace: true);
            break;
          case 2:
            qualificationsStatus();
            break;
          default:
            G.router.navigateTo(G.currentContext, '/create-account', replace: true);
        }
      }
      // qualificationsStatus
    } else {
      G.toast('获取用户认证信息失败');
      G.router.navigateTo(G.currentContext, '/login', replace: true);
    }
    // print(info);
    // var result = await LoginApi().getUserAuth();
    // print(result);
    // UserAuthModel info = UserAuthModel.fromJson(infoStr);
    // userAuthInfo = info;
    // G.setPref('token', 'bearer ' + userAuthInfo.jwtToken);
    // if (!userAuthInfo.isPrefected) {
    //   G.router.navigateTo(context, '/update-user', replace: true);
    // }
    // notifyListeners();
  }

  qualificationsStatus() {
    int status = userAuthInfo.qualificationsStatus;
    switch (status) {
      case 0:
        G.router.navigateTo(G.currentContext, '/uploadEnterPrisePic', replace: true);
        break;
      case -2:
      case -3: 
      case 1:
      case 2:
      case 3:
      case -1:
        G.router.navigateTo(G.currentContext, '/resultPage?status=$status', replace: true);
        break;
      case 4:
        G.router.navigateTo(G.currentContext, '/index', replace: true);
        break;
      default:
        G.router.navigateTo(G.currentContext, '/uploadEnterPrisePic', replace: true);
    }
  }
}