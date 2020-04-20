import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-circle-input.dart';
import 'package:agent37_flutter/components/v-hint.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api/login.dart';
import '../../components/Icon.dart';
import '../../utils/global.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginType = 'sms';
  final _formKey = GlobalKey<FormState>();
  String errorMsg;
  bool pwdVisible = false;
  String mobile = '';
  String sms = '';
  String pwd = '';
  Map formValidate = {
    'mobile': false,
    'sms': false,
    'pwd': false
  };
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
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
              Text('登录',
                  style: TextStyle(
                      fontSize: G.setSp(36),
                      color: hex('#FFF'),
                      fontWeight: FontWeight.w500)),
              Container(height: G.setHeight(171)),
              Container(
                height: G.setHeight(650),
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _loginTypeTab('sms'),
                          Container(
                            height: G.setHeight(40),
                            width: G.setWidth(1),
                            color: hex('#CCC'),
                          ),
                          _loginTypeTab('pwd')
                        ]),
                    G.spacing(30),
                    VHint(errorMsg),
                    Container(
                      margin: EdgeInsets.only(
                          top: G.setHeight(10), bottom: G.setHeight(50)),
                      child: Form(
                        key: _formKey,
                        // autovalidate: _formKey.currentState.validate(),
                        child: Column(children: <Widget>[
                          VCircleInput(
                            controller: _mobileController,
                            prefixIcon: iconmobile(),
                            type: TextInputType.phone,
                            hintText: '请输入手机号',
                            maxLength: 11,
                            validator: (value) {
                              if (errorMsg == null || errorMsg.isEmpty) {
                                  setState(() {
                                    errorMsg = Validate.checkMobile(value)??'';
                                    // errorMsg = '请输入手机号';
                                  });
                                // if (value == null || value.isEmpty) {
                                //   setState(() {
                                //     errorMsg = '请输入手机号';
                                //   });
                                // } else {
                                //   const regExp = r"^1[3456789]\d{9}$";
                                //   if (!RegExp(regExp).hasMatch(value)) {
                                //     setState(() {
                                //       errorMsg = '手机号格式错误';
                                //     });
                                //   }
                                // }
                              }
                              return null;
                            },
                            onChange: (e) {
                              const regExp = r"^1[3456789]\d{9}$";
                              setState(() {
                                formValidate['mobile'] = RegExp(regExp).hasMatch(e);
                                mobile = e;
                              });
                            },
                          ),
                          Container(height: G.setHeight(30)),
                          _loginSmsInput(!formValidate['mobile']),
                          _loginPwdInput()
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
                        if (Validate.isNon(errorMsg)) {
                          var result = await LoginApi().login(mobile, sms: sms, pwd: pwd);
                          if (result.data['code'] == 200) {
                            String token = result.data['data']['jwtToken'];
                            G.setPref('token', 'bearer ' + token);
                            G.setContext(context);
                            Provider.of<UserProvide>(context).updateUserAuth();
                          }
                        }
                      },
                      disabled: !(formValidate['mobile'] ? loginType == 'sms' ? formValidate['sms'] :  formValidate['pwd'] : false)
                    )
                  ],
                ),
              ),
              Container(
                  child: FlatButton(
                onPressed: () {
                  G.router.navigateTo(context, '/register');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('新代理注册',
                        style: TextStyle(
                            fontSize: G.setSp(30),
                            color: Colors.white,
                            height: 1)),
                    Icon(Icons.keyboard_arrow_right,
                        color: Colors.white, size: G.setSp(44))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    ));
  }

  Widget _loginTypeTab(String type) {
    String text = type == 'sms' ? '手机号登录' : '密码登录';
    return InkWell(
      onTap: () {
        setState(() {
          loginType = type;
          errorMsg = null;
          sms = null;
          pwd = null;
        });
      },
      child: Text(
        text,
        style: TextStyle(
            fontSize: G.setSp(36),
            color: type == loginType ? hex('#333') : hex('#BFBFBF')),
      ),
    );
  }

  Widget _loginSmsInput(bool disabled) {
    return Offstage(
        offstage: loginType != 'sms',
        child: VCircleInput(
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
            suffix: VTimerBtn(disabled, () async {return await LoginApi().getLoginSmsCode(mobile);}),
            maxLength: 4,
            validator: (value) {
              if (loginType != 'sms') return null;
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
            }));
  }

  Widget _loginPwdInput() {
    return Offstage(
        offstage: loginType != 'pwd',
        child: VCircleInput(
            controller: _pwdController,
            onChange: (e) {
              setState(() {
                formValidate['pwd'] = e.length > 0;
                pwd = e;
              });
            },
            hintText: '请输入密码',
            prefixIcon: iconpwd(),
            suffix: _forgetPwd(),
            type:
                pwdVisible ? TextInputType.text : TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  pwdVisible = !pwdVisible;
                });
              },
              icon: pwdVisible ? iconeye() : iconcloseeye(),
            ),
            validator: (value) {
              if (loginType != 'pwd') return null;
              if (errorMsg == null || errorMsg.isEmpty) {
                if (value == null || value.isEmpty) {
                  setState(() {
                    errorMsg = '请输入密码';
                  });
                }
              }
              return null;
            }));
  }

  Widget _forgetPwd() {
    return InkWell(
      onTap: () {
        G.router.navigateTo(context, '/forget');
      },
      child: Text('忘记密码',
          style: TextStyle(fontSize: G.setSp(30), color: hex('#434343'))),
    );
  }
}
