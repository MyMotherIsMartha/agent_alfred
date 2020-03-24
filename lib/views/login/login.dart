import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: G.setWidth(1500),
          height: G.setHeight(2668),
          padding: EdgeInsets.only(top: G.setHeight(59)),
          decoration: BoxDecoration(
            color: Colors.red,
              image: DecorationImage(
                  image: AssetImage("lib/assets/images/login_bg.png"), fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              Text('登录', style: TextStyle(
                fontSize: G.setSp(72),
                color: hex('#FFF'),
                fontWeight: FontWeight.w500
              )),
              Container(height: G.setHeight(340)),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      InkWell(
                        child: Text('手机号登录'),
                      ),
                      Container(
                        height: G.setHeight(80),
                        width: G.setWidth(2),
                        color: hex('#CCC'),
                      ),
                      InkWell(
                        child: Text('手机号登录'),
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    print('新代理注册');
                  },
                  child: Row(
                    children: <Widget>[
                      Text('新代理注册'),
                      Icon(Icons.access_alarms)
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
