import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/models/userinfo.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  Widget _userMsg(UserinfoModel userinfo) {
    return ListTile(
      title: Text('用户信息',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#333'))),
      trailing: iconarrow(color: hex('#999')),
      onTap: () {},
    );
  }

  Widget _safe(UserinfoModel userinfo) {
    return ListTile(
      title: Text('账户安全',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#333'))),
      trailing: iconarrow(color: hex('#999')),
      onTap: () {},
    );
  }

  Widget _companyInfo(UserinfoModel userinfo) {
    return ListTile(
      title: Text('企业信息',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#333'))),
      trailing: Container(
        width: G.setWidth(220),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(userinfo.isPrefected != null && userinfo.isPrefected ? '完善信息' : '审核未通过',
                style: TextStyle(fontSize: G.setSp(30), color: hex('#999'))),
            G.spacing(15, dir: 'x'),
            iconarrow(color: hex('#999'))
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Widget _msgSwitch(UserinfoModel userinfo) {
    return ListTile(
      title: Text('新信息通知',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#333'))),
      trailing: Text('已开启',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#999'))),
      onTap: () {},
    );
  }

  Widget _clearCache(UserinfoModel userinfo) {
    return ListTile(
      title: Text('清除本地缓存',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#333'))),
      trailing: Text('17.99M',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#999'))),
      onTap: () {},
    );
  }

  Widget _versionInfo(UserinfoModel userinfo) {
    return ListTile(
      title: Text('版本号',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#333'))),
      trailing: Text('V1.1.0',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#999'))),
      onTap: () {},
    );
  }

  Future _getInfo(context) async {
    UserProvide userProvide = Provider.of<UserProvide>(context);
    await userProvide.getUserInfo();
    return 'end';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        elevation: 0,
      ),
      backgroundColor: hex('#F3F4F6'),
      body: FutureBuilder(
        future: _getInfo(context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: G.setHeight(1334),
              width: G.setWidth(750),
              child: VLoading(),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(top: G.setWidth(20)),
              child: Column(
                children: <Widget>[
                  Container(
                      height: G.setHeight(300),
                      color: hex('#FFF'),
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 1, // 分隔线宽度
                              height: 0,
                              color: hex('#EEEEEE'), // 分隔线颜色
                            );
                          },
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            UserinfoModel userinfo = Provider.of<UserProvide>(context).userinfo;
                            if (index == 0) {
                              return _userMsg(userinfo);
                            } else if (index == 1) {
                              return _safe(userinfo);
                            } else if (index == 2) {
                              return _companyInfo(userinfo);
                            } else {
                              return Container();
                            }
                            // return listTileList[index](userinfo);
                          })),
                  Container(
                    height: G.setWidth(60),
                    padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
                    child: Row(
                      children: <Widget>[
                        Text('要修改通知，您可以在系统设置中修改',
                            style: TextStyle(
                                fontSize: G.setSp(24), color: hex('#999'))),
                        G.spacing(10, dir: 'x'),
                        InkWell(
                          onTap: () {},
                          child: Text('设置',
                              style: TextStyle(
                                  fontSize: G.setSp(24),
                                  color: hex('#0091F0'))),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: G.setHeight(300),
                      color: hex('#FFF'),
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            if (index == 0) {
                              return Container(
                                height: G.setWidth(20),
                                color: hex('#f3f4f6'),
                              );
                            } else {
                              return Divider(
                                thickness: 1, // 分隔线宽度
                                height: 0,
                                color: hex('#EEEEEE'), // 分隔线颜色
                              );
                            }
                          },
                          // itemExtent: G.setWidth(100),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            UserinfoModel userinfo = Provider.of<UserProvide>(context).userinfo;
                            if (index == 0) {
                              return _msgSwitch(userinfo);
                            } else if (index == 1) {
                              return _clearCache(userinfo);
                            } else if (index == 2) {
                              return _versionInfo(userinfo);
                            } else {
                              return Container();
                            }
                          })),
                  G.spacing(20),
                  Container(
                    height: G.setWidth(100),
                    color: hex('#FFF'),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text('退出登录',
                          style: TextStyle(
                              fontSize: G.setSp(30), color: hex('#333'))),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
