import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/models/user-auth.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingSafePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserAuthModel userAuthInfo = Provider.of<UserProvide>(context).userAuthInfo;
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        title: Text('账户安全'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: G.setWidth(100),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
              decoration: BoxDecoration(
                  color: hex('#FFF'),
                  border: Border(top: BorderSide(color: hex('#f3f4f6')))),
              child: InkWell(
                  onTap: () {
                    if (userAuthInfo.isSettingPassword) {
                      G.navigateTo(context, '/setting/resetpwd');
                    } else {
                      G.navigateTo(context, '/setting/pwd');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('登录密码',
                          style: TextStyle(
                              color: hex('#333'), fontSize: G.setSp(30))),
                      Row(
                        children: <Widget>[
                          !userAuthInfo.isSettingPassword
                              ? Text('未设置',
                                  style: TextStyle(
                                      color: hex('#999'),
                                      fontSize: G.setSp(30)))
                              : Container(),
                          G.spacing(20, dir: 'x'),
                          iconarrow(color: hex('#999'), size: G.setSp(26))
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              height: G.setWidth(100),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
              decoration: BoxDecoration(
                  color: hex('#FFF'),
                  border: Border(top: BorderSide(color: hex('#f3f4f6')))),
              child: InkWell(
                  onTap: () {
                    G.navigateTo(context, '/setting/mobile');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('手机号',
                          style: TextStyle(
                              color: hex('#333'), fontSize: G.setSp(30))),
                      Row(
                        children: <Widget>[
                          Text(userAuthInfo.mobile,
                              style: TextStyle(
                                  color: hex('#999'), fontSize: G.setSp(30))),
                          G.spacing(20, dir: 'x'),
                          iconarrow(color: hex('#999'), size: G.setSp(26))
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
