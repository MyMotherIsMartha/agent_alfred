import 'package:agent37_flutter/api/login.dart';
import 'package:agent37_flutter/models/user-auth.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter/material.dart';

class UserProvide with ChangeNotifier{
  UserAuthModel userAuthInfo;

  getUserInfo() async {
    var result = await LoginApi().getUserInfo();
    if (result.data['data'] != null) {

    }
  }

  setUserInfo(data) async {
    var result = await LoginApi().setUserInfo(data);
    if (result.data['code'] == 200) {
      if (!userAuthInfo.isPrefected) {
        // 获取新的认证信息 
        notifyListeners();
      }
      G.toast('更新成功');
    } else {
      G.toast('更新失败');
    }
  }

  updateUserAuth() async {
    var result = await LoginApi().getUserAuth();
    if (result.data['code'] == 200) {
      userAuthInfo = UserAuthModel.fromJson(result.data['data']);
      if (!userAuthInfo.isContactsPrefected) {
        G.router.navigateTo(G.currentContext, '/update-user', replace: true);
        notifyListeners();
        return;
      }
      if (userAuthInfo.giftPackageOrderStatus == null
       || userAuthInfo.giftPackageOrderStatus == 0
       || userAuthInfo.giftPackageOrderStatus == -1
       || userAuthInfo.giftPackageOrderStatus == -2
      ) {
        G.router.navigateTo(G.currentContext, '/create-account');
        notifyListeners();
        return;
      }
    } else {
      G.toast('获取用户认证信息失败');
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
}