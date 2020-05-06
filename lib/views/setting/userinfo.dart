import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingUserInfoPage extends StatelessWidget {
  // Future _getInfo(context) async {
  //   UserProvide userProvide = Provider.of<UserProvide>(context);
  //   await userProvide.refreshUserAuthinfo();
  //   return 'end';
  // }

  @override
  Widget build(BuildContext context) {
    String nickname = Provider.of<UserProvide>(context).userAuthInfo?.nickname;
    return Scaffold(
      backgroundColor: hex('#f3f4f6'),
      appBar: AppBar(
        title: Text('用户信息'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: G.setWidth(20)),
        child: Column(
          children: <Widget>[
            Container(
              height: G.setWidth(120),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
              decoration: BoxDecoration(
                  color: hex('#FFF'),
                  border: Border(bottom: BorderSide(color: hex('#f3f4f6')))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('头像',
                      style:
                          TextStyle(color: hex('#333'), fontSize: G.setSp(30))),
                  InkWell(
                    child: ClipOval(
                      child: Image.network(
                        'http://img.cixi518.com/ljh_logo.jpeg',
                        width: G.setWidth(80),
                        height: G.setWidth(80),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: G.setWidth(120),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
              decoration: BoxDecoration(
                  color: hex('#FFF'),
                  border: Border(bottom: BorderSide(color: hex('#f3f4f6')))),
              child: InkWell(
                  onTap: () {
                    G.navigateTo(context, '/setting/nickname');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('昵称',
                          style: TextStyle(
                              color: hex('#333'), fontSize: G.setSp(30))),
                      Row(
                        children: <Widget>[
                          // FutureBuilder(
                          //   future: _getInfo(context),
                          //   builder: (context, snapshot) {
                          //     String nickname =
                          //           Provider.of<UserProvide>(context).userAuthInfo.nickname;
                          //     if (snapshot.hasData && nickname != null) {

                          //       return Text(nickname ?? '',
                          //           style: TextStyle(
                          //               color: hex('#333'),
                          //               fontSize: G.setSp(30)));
                          //     } else {
                          //       return Container();
                          //     }
                          //   },
                          // ),
                          Text(nickname ?? '',
                              style: TextStyle(
                                  color: hex('#333'), fontSize: G.setSp(30))),
                          G.spacing(20, dir: 'x'),
                          iconarrow(color: hex('#999'), size: G.setSp(26))
                        ],
                      )
                      // InkWell(
                      //   child: ClipOval(
                      //     child: Image.network(
                      //       'http://img.cixi518.com/ljh_logo.jpeg',
                      //       width: G.setWidth(80),
                      //       height: G.setWidth(80),
                      //     ),
                      //   ),
                      //   onTap: () {},
                      // ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
