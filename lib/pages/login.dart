import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:color_dart/color_dart.dart';
import 'package:agent_alfred_test/application.dart';
import 'package:agent_alfred_test/components/Icon.dart';
import 'package:agent_alfred_test/components/border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agent_alfred_test/utils/utils.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Map mobile = {"value": '', "verify": false};
  static Map code = {"value": '', "verify": false};

  final myController = TextEditingController();

  void testFunc() {
    setState(() {
      mobile['value'] = "18892663025";
    });
  }

  /// 登录
  void login() {
    Navigator.pushNamed(context, '/home');
  }

  final centerBorder = Container(
    width: .5,
    height: 24,
    color: Colors.black26
  );

  // class MobileInpt extends StatefulWidget {
  //   @override
  //   _MobileInptState createState() => _MobileInptState();
  // }
  
  // class _MobileInptState extends State<MobileInpt> {
  //   @override
  //   Widget build(BuildContext context) {
  //     return Container(
        
  //     );
  //   }
  // }

  Widget mobileInput() {
    return Container(
    height: 50,
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.symmetric(horizontal: 5),
    decoration:
       new BoxDecoration(color: hex('#F8F8F8'), borderRadius: new BorderRadius.circular((25.0)),),
    child: TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          counterText: "",
          // prefixIcon: iconmobile(color: hex('#666')),
          prefixIcon: new Icon(Icons.phone_android, color: hex('#434343')),
          border: InputBorder.none,
          hintText: '请输入手机号',
          hintStyle: TextStyle(
            fontSize: 15,
            color: hex('#BFBFBF')
          )),
      onChanged: (e) {
        const regExp = r"^1[3456789]\d{9}$";
        mobile['value'] = e;
        mobile['verify'] = RegExp(regExp).hasMatch(e);
      },
    ),
  );
  }

  Widget mobileBlock = Container(
    height: 50,
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.symmetric(horizontal: 5),
    decoration:
       new BoxDecoration(color: hex('#F8F8F8'), borderRadius: new BorderRadius.circular((25.0)),),
    child: TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          counterText: "",
          // prefixIcon: iconmobile(color: hex('#666')),
          prefixIcon: new Icon(Icons.phone_android, color: hex('#434343')),
          border: InputBorder.none,
          hintText: '请输入手机号',
          hintStyle: TextStyle(
            fontSize: 15,
            color: hex('#BFBFBF')
          )),
      onChanged: (e) {
        const regExp = r"^1[3456789]\d{9}$";
        mobile['value'] = e;
        mobile['verify'] = RegExp(regExp).hasMatch(e);
      },
    ),
  );

  final verifyBlock =  Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: 
        new BoxDecoration(color: hex('#F8F8F8'), borderRadius: new BorderRadius.circular((25.0)),),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: new Icon(Icons.verified_user, color: hex('#434343')),
                  counterText: '',
                  border: InputBorder.none,
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: hex('#BFBFBF')
                  )),
              onChanged: (e) {
                  code['value'] = e;
                  code['verify'] = e.length == 4 ? true : false;
              },
            ),
          ),
          Container(
            height: 25,
            margin: EdgeInsets.only(left: 40),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: rgba(242, 242, 242, 1)))),
          ),
          // buildgetVerCode()
        ],
      ),
    );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('登录'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [hex('#69A5FF'), hex('#685AFF')],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
        )),
        padding: EdgeInsets.only(left: 35, right: 35, top: 100),
        child: Column(
          
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5),
              width: Application.setWidth(180),
              height: Application.setHeight(180),
              child: Image.asset(
                'lib/assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 96),
              child: Text(
                '37度管家',
                style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                ),
              ),
              alignment: Alignment.center
            ),
            /// 输入手机
            Container(
              decoration: new BoxDecoration(
                color: Colors.white, // 底色
                borderRadius: new BorderRadius.circular((20.0)), // 圆角度
              ),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              
              child: SingleChildScrollView(child:Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: DefaultTextStyle(
                      //1.设置文本默认样式  
                      style: TextStyle(
                        fontSize: 18.0,
                        color: hex('#333')
                      ),
                      textAlign: TextAlign.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('手机号登录'),
                          // Text('丨'),
                          centerBorder,
                          Text('密码登录')
                        ],
                      )
                    )
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration:
                      new BoxDecoration(color: hex('#F8F8F8'), borderRadius: new BorderRadius.circular((25.0)),),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          counterText: "",
                          // prefixIcon: iconmobile(color: hex('#666')),
                          prefixIcon: new Icon(Icons.phone_android, color: hex('#434343')),
                          border: InputBorder.none,
                          hintText: '请输入手机号',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: hex('#BFBFBF')
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
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: 
                      new BoxDecoration(color: hex('#F8F8F8'), borderRadius: new BorderRadius.circular((25.0)),),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                prefixIcon: new Icon(Icons.verified_user, color: hex('#434343')),
                                counterText: '',
                                border: InputBorder.none,
                                hintText: '请输入验证码',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: hex('#BFBFBF')
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
                          margin: EdgeInsets.only(left: 40),
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(color: rgba(242, 242, 242, 1)))),
                        ),
                        // buildgetVerCode()
                      ],
                    ),
                  ),
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
              ))
            ),
            Container(
                height: Application.setWidth(30),
                margin: EdgeInsets.only(top: Application.setHeight(20)),
                // child: _hintWidget()
                ),
          ],
        ),
      ),
    );
  }
}