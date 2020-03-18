import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';
import 'package:agent_alfred/application.dart';
import 'package:agent_alfred/components/border.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Map mobile = {"value": '', "verify": false};
  static Map code = {"value": '', "verify": false};

  void testFunc() {
    setState(() {
      mobile['value'] = "18892663025";
    });
  }

  /// 登录
  login() {
    print('login test');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        color: hex('#fff'),
        padding: EdgeInsets.only(left: 35, right: 35, top: 87),
        child: Column(
          
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: Application.setWidth(120),
              height: Application.setWidth(120),
              child: Image.asset(
                'lib/assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 96),
              width: Application.setWidth(186),
              height: Application.setWidth(50),
              child: Image.asset(
                'lib/assets/images/logo_text.png',
                fit: BoxFit.scaleDown,
              ),
            ),

            /// 输入邮箱
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              decoration:
                  BoxDecoration(border: borderBottom(), color: hex('#F8F8F8')),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    counterText: "",
                    // prefixIcon: iconmobile(color: hex('#666')),
                    border: InputBorder.none,
                    hintText: '请输入手机号',
                    hintStyle: TextStyle(
                      fontSize: 15,
                    )),
                onChanged: (e) {
                  const regExp = r"^1[3456789]\d{9}$";
                  setState(() {
                    mobile['value'] = e;
                    mobile['verify'] = RegExp(regExp).hasMatch(e);
                  });
                },
              ),
            ),

            /// 验证码
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  color: hex('#F8F8F8'),
                  border: borderBottom()),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          // prefixIcon: iconsafety(color: hex('#666')),
                          counterText: '',
                          border: InputBorder.none,
                          hintText: '请输入验证码',
                          hintStyle: TextStyle(
                            fontSize: 14,
                          )),
                      onChanged: (e) {
                        setState(() {
                          code['value'] = e;
                          code['verify'] = e.length == 4 ? true : false;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(left: Application.setWidth(40)),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: rgba(242, 242, 242, 1)))),
                  ),
                  // buildgetVerCode()
                ],
              ),
            ),
            Container(
                height: Application.setWidth(30),
                margin: EdgeInsets.only(top: Application.setHeight(20)),
                // child: _hintWidget()
                ),

            /// 确认
            Container(
              width: Application.setWidth(650),
              height: Application.setHeight(100),
              margin: EdgeInsets.only(top: Application.setHeight(60)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: mobile['verify'] == true && code['verify'] == true
                      ? LinearGradient(
                          colors: [Color(0xffF3C774), Color(0xffE2B55D)])
                      : LinearGradient(colors: [
                          rgba(243, 199, 116, .3),
                          rgba(226, 181, 93, .3)
                        ])),
              child: FlatButton(
                color: Colors.transparent,
                child: Text("登录",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Application.setSp(36),
                        fontWeight: FontWeight.w300)),
                onPressed: mobile['verify'] == true && code['verify'] == true
                    ? () => login()
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}