import 'package:agent37_flutter/api/llpay.dart';
import 'package:agent37_flutter/api/login.dart';
import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/models/enterpriseInfo.dart';
import 'package:agent37_flutter/models/user-auth.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class UserProvide with ChangeNotifier {
  UserAuthModel userAuthInfo;
  EnterpriseInfoModel enterpriseInfo;
  var bankCardInfo;
  // UserinfoModel userinfo;
  bool getInfoFlag = true;

  bool specialAccount = false;
  // getUserInfo() async {
  //   if (!getInfoFlag) return;
  //   print('get userinfo from provide');
  //   var result = await MemberApi().getUserinfo();
  //   if (result.data['code'] == 200) {
  //     getInfoFlag = false;
  //     print(result.data['data']);
  //     userinfo = userinfoModelFromJson(result.data['data']);
  //     notifyListeners();
  //   }
  // }
  updateEnterpriseinfo() async {
    if (G.getPref('token') == null) {
      return;
    }
    var result = await MemberApi().getEnterpriseInfo();
    if (result.data['code'] == 200) {
      enterpriseInfo = EnterpriseInfoModel.fromJson(result.data['data']);
    } else {
      // G.toast('获取用户企业信息失败');
    }
  }

  updateBankCardInfo() async {
    if (G.getPref('token') == null) {
      return;
    }
    var result = await LLpayApi().getUserBankInfo();
    if (result.data['code'] == 200) {
      bankCardInfo = result.data['data'];
    } else {
      // G.toast('获取用户银行卡信息失败');
    }
  }

  refreshUserAuthinfo() {
    getInfoFlag = true;
    notifyListeners();
  }

  changeSpecial(bool val) {
    specialAccount = val;
    notifyListeners();
  }

  setUserInfo(data) async {
    var result = await LoginApi().setUserInfo(data);
    if (result.data['code'] == 200) {
      if (!userAuthInfo.isContactsPrefected) {
        // 获取新的认证信息
        notifyListeners();
      }
      // G.toast('更新成功');
      updateUserAuth();
    } else {
      // G.toast('更新失败');
    }
  }

  updateUserAuth(
      {bool isInit = true,
      TransitionType transition: TransitionType.inFromRight}) async {
    if (G.getPref('token') == null) {
      G.navigateTo(G.currentContext, '/login', replace: true);
      return;
    }
    // if (!getInfoFlag) return;
    // getInfoFlag = false;
    var result = await LoginApi().getUserAuth();
    if (result.data['code'] == 200) {
      userAuthInfo = UserAuthModel.fromJson(result.data['data']);
      if (!isInit) {
        notifyListeners();
        return;
      }
      if (!userAuthInfo.isContactsPrefected) {
        G.navigateTo(G.currentContext, '/update-user');
        notifyListeners();
        return;
      }
      if (userAuthInfo.giftPackageOrderStatus == null ||
          userAuthInfo.giftPackageOrderStatus == -2 ||
          userAuthInfo.giftPackageOrderStatus == -1 ||
          userAuthInfo.giftPackageOrderStatus == 3 ||
          userAuthInfo.giftPackageOrderStatus == -3 ||
          userAuthInfo.giftPackageOrderStatus == 5) {
        G.navigateTo(G.currentContext, '/create-account', replace: true);
        notifyListeners();
        return;
      } else {
        if (userAuthInfo.giftPackageOrderStatus == 0 &&
            userAuthInfo.payType != 3) {
          G.navigateTo(G.currentContext, '/create-account', replace: true);
          // notifyListeners();
        } else {
          if (userAuthInfo.payType != 3) {
            qualificationsStatus();
          } else {
            int status = userAuthInfo.voucherStatus;
            switch (status) {
              case 1:
              case 0:
              case 3:
                G.navigateTo(G.currentContext, '/order-result',
                    replace: true, transition: transition);
                break;
              case 4:
                G.toast('订单已超时，请重新下单');
                G.navigateTo(G.currentContext, '/create-account',
                    replace: true);
                break;
              case 2:
                qualificationsStatus();
                break;
              // case 0: // 待验证状态，后台可能状态提供的有问题
              //   G.navigateTo(G.currentContext, '/create-account', replace: true);
              //   break;
              default:
                print('获取一下最新信息');
            }
          }
        }
      }
      // qualificationsStatus
    } else {
      G.toast('获取用户认证信息失败');
      G.navigateTo(G.currentContext, '/login', replace: true);
    }
    // print(info);
    // var result = await LoginApi().getUserAuth();
    // print(result);
    // UserAuthModel info = UserAuthModel.fromJson(infoStr);
    // userAuthInfo = info;
    // G.setPref('token', 'bearer ' + userAuthInfo.jwtToken);
    // if (!userAuthInfo.isPrefected) {
    //   G.navigateTo(context, '/update-user', replace: true);
    // }
    // notifyListeners();
  }

  qualificationsStatus() {
    if (!userAuthInfo.isContactsPrefected) {
      G.navigateTo(G.currentContext, '/uploadEnterPrisePic', replace: true);
      return;
    }
    int status = userAuthInfo.qualificationsStatus;
    switch (status) {
      case 0:
        G.navigateTo(G.currentContext, '/uploadEnterPrisePic', replace: true);
        break;
      case -2:
      case 2:
      case -3:
      case 1:
      case 3:
        G.navigateTo(G.currentContext, '/resultPage?status=$status',
            replace: true);
        break;
      case -1:
        G.navigateTo(G.currentContext,
            '/resultPage?status=$status&refuseReason=${userAuthInfo.auditRefuseReason}',
            replace: true);
        break;
      case 4:
        G.navigateTo(G.currentContext, '/index', replace: true);
        break;
      default:
        G.navigateTo(G.currentContext, '/uploadEnterPrisePic', replace: true);
    }
  }
}
