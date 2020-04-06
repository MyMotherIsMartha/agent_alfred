import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-circle-input.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api/login.dart';
import '../../components/Icon.dart';
import '../../utils/global.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String loginType = 'sms';
  final _formKey = GlobalKey<FormState>();
  String errorMsg;
  bool pwdVisible = false;
  String mobile = '';
  String sms = '';
  String invite = '';
  Map formValidate = {'mobile': false, 'sms': false};
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  final TextEditingController _inviteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    G.setContext(context);
    // print('1234214');
    // print(MediaQuery.of(context).padding.top);
    // print(G.statusHeight);
    return Scaffold(
        body: SingleChildScrollView(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: G.setWidth(750),
          height: G.setHeight(1334),
          padding: EdgeInsets.only(top: G.statusHeight),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/images/login_bg.png"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: G.setWidth(750),
                child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text('注册',
                      style: TextStyle(
                          fontSize: G.setSp(36),
                          color: hex('#FFF'),
                          fontWeight: FontWeight.w500)),
                  Positioned(
                    left: G.setWidth(10),
                    child: IconButton(
                      onPressed: () {
                        G.router.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: G.setSp(44),color: hex('#fff'),),
                    ),
                  )
                ],
              ),
              ),
              Container(height: G.setHeight(171)),
              Container(
                height: G.setHeight(790),
                width: G.setWidth(690),
                padding: EdgeInsets.fromLTRB(
                    G.setWidth(50), G.setHeight(70), G.setWidth(50), 0),
                decoration: BoxDecoration(
                  color: hex('#FFF'),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  /* 
                                prefixIcon: Icon(
                                  Icons.account_box,
                                  size: 28.0,
                                ), */
                  children: <Widget>[
                    Container(
                      child: Text(
                        '注册账号',
                        style: TextStyle(
                            fontSize: G.setSp(36), color: hex('#333')),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: G.setWidth(25)),
                      margin: EdgeInsets.only(top: G.setHeight(30)),
                      alignment: Alignment.centerLeft,
                      height: G.setHeight(30),
                      child: errorMsg != null
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.error,
                                  color: hex('#f33'),
                                  size: G.setSp(28),
                                ),
                                Container(width: G.setWidth(8)),
                                Text(errorMsg,
                                    style: TextStyle(
                                        color: hex('#f33'),
                                        height: 1,
                                        fontSize: G.setSp(24)))
                              ],
                            )
                          : null,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: G.setHeight(10), bottom: G.setHeight(50)),
                      child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          VCircleInput(
                            controller: _mobileController,
                            prefixIcon: iconmobile(),
                            type: TextInputType.phone,
                            hintText: '请输入手机号',
                            // maxLength: 11,
                            validator: (value) {
                              if (errorMsg == null || errorMsg.isEmpty) {
                                String eStr = Validate.checkMobile(value);
                                if (eStr != null) {
                                  setState(() {
                                      errorMsg = eStr;
                                    });
                                }
                              }
                              return null;
                            },
                            onChange: (e) {
                              const regExp = r"^1[3456789]\d{9}$";
                              setState(() {
                                formValidate['mobile'] =
                                    RegExp(regExp).hasMatch(e);
                                mobile = e;
                              });
                            },
                          ),
                          G.spacing(30),
                          _loginSmsInput(!formValidate['mobile']),
                          G.spacing(30),
                          _loginInviteInput()
                        ]),
                      ),
                    ),
                    VButton(
                        text: '登录',
                        fn: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            errorMsg = null;
                          });
                          _formKey.currentState.validate();
                          print(errorMsg);
                          if (errorMsg == null) {
                            Map data = {
                              'memberType': 1,
                              'mobile': mobile,
                              'smsCode': sms,
                              'parentShareCode': invite
                            };
                            var result = await LoginApi().register(data);
                            print(result);
                            if (result.data['code'] == 200) {
                              G.toast('注册成功');
                              String token = result.data['data']['jwtToken'];
                              G.setPref('token',  'bearer ' + token);
                              Provider.of<UserProvide>(context).updateUserAuth();
                            }
                          }
                        },
                        disabled: formValidate.containsValue(false)),
                    _agreement()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _loginSmsInput(bool disabled) {
    return VCircleInput(
        
        controller: _smsController,
        onChange: (String e) {
          setState(() {
            sms = e;
            formValidate['sms'] = e.length == 4;
          });
        },
        hintText: '请输入验证码',
        prefixIcon: iconsafety(),
        type: TextInputType.number,
        suffix: VTimerBtn(disabled, () async {return await LoginApi().getRegisterSmsCode(mobile);}),
        maxLength: 4,
        validator: (value) {
          if (errorMsg == null || errorMsg.isEmpty) {
            if (value == null || value.isEmpty) {
              setState(() {
                errorMsg = '请输入验证码';
              });
            } else {
              if (value.length != 4) {
                setState(() {
                  errorMsg = '验证码错误';
                });
              }
            }
          }
          return null;
        });
  }

  Widget _loginInviteInput() {
    return VCircleInput(
        controller: _inviteController,
        hintText: '请输入邀请码（非必填）',
        prefixIcon: iconkey(),
        onChange: (e) {
          setState(() {
            invite = e;
          });
        },
        );
        
  }

  Widget _agreement() {
    return Container(
        child: FlatButton(
            onPressed: () {
              print('新代理注册');
            },
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: '我已阅读接受',
                style: TextStyle(fontSize: G.setSp(26), color: hex('#999')),
              ),
              TextSpan(
                  text: '《代理协议》',
                  style: TextStyle(fontSize: G.setSp(26), color: hex('#333'))),
              TextSpan(
                text: '，并同意注册',
                style: TextStyle(fontSize: G.setSp(26), color: hex('#999')),
              ),
            ]))));
  }
}
