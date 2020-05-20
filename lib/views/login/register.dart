import 'package:agent37_flutter/components/v-avatar.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-circle-input.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
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
  FocusNode _smsFocus = FocusNode();

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
          physics: NeverScrollableScrollPhysics(),
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
                height: G.setHeight(800),
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
                            fontSize: G.setSp(36), color: hex('#333'), fontWeight: FontWeight.bold),
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
                            type: TextInputType.number,
                            inputFormatters: WhitelistingTextInputFormatter(RegExp("[0-9]")),
                            hintText: '请输入手机号',
                            maxLength: 11,
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
                        text: '同意协议并注册',
                        fn: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            errorMsg = null;
                          });
                          _formKey.currentState.validate();
                          if (errorMsg == null) {
                            if (Validate.isNon(invite)) {
                              registerApi();
                            } else {
                              var result = await LoginApi().checkInviteCode(invite);
                              if (result.data['code'] == 200) {
                                var name = result.data['data']['nickname'];
                                var avatar = result.data['data']['headSculptureUrl'];
                                int role = result.data['data']['role'];
                                checkInvite(context, name, avatar, role);
                              }
                            }
                            // Map data = {
                            //   'memberType': 1,
                            //   'mobile': mobile,
                            //   'smsCode': sms,
                            //   'parentShareCode': invite
                            // };
                            // var result = await LoginApi().register(data);
                            // print(result);
                            // if (result.data['code'] == 200) {
                            //   G.toast('注册成功，请完善个人信息');
                            //   String token = result.data['data']['jwtToken'];
                            //   G.setPref('token',  'bearer ' + token);
                            //   Provider.of<UserProvide>(context).updateUserAuth();
                            // }
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

  YYDialog checkInvite(BuildContext context, String name, String avatar, int role) {
   return YYDialog().build(context)
    ..width = G.setWidth(600)
    ..borderRadius = G.setWidth(20)
    ..text(
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setWidth(28)),
      alignment: Alignment.center,
      text: "邀请码来自",
      color: hex('#666'),
      fontSize: G.setSp(28),
    )
    ..widget(
      Container(
        height: G.setWidth(90),
        padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
        margin: EdgeInsets.only(bottom: G.setWidth(24)),
        child: Row(
          children: <Widget>[
            Validate.isNon(avatar)
            ? VAvatar(avatar, role, width: 80,)
            // Image.asset(
            //     '${G.imgBaseUrl}pic-icon/default_avatar.png',
            //     width: G.setWidth(80),
            //     height: G.setWidth(80),
            //   )
            : Image.network(
                avatar,
                width: G.setWidth(80),
                height: G.setWidth(80),
              ),
            G.spacing(20, dir: 'x'),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxWidth: G.setWidth(360),
                  ),
                  child: Text(
                    name??'未知', 
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: hex('#333'),
                      fontSize: G.setSp(30)
                    )),
                ),
                
                Text('邀请码：$invite', style: TextStyle(
                  color: hex('#666'),
                  fontSize: G.setSp(24)
                ),)
              ],
            )
          ],
        ),
      )
    )
    ..divider()
    ..widget(
      Container(
        height: G.setWidth(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                // YYDialog().dismiss();
                Navigator.pop(context);
              },
              child: Container(
                height: G.setWidth(100),
                width: G.setWidth(300),
                alignment: Alignment.center,
                child: Text('取消', textAlign: TextAlign.center, style: TextStyle(
                  color: hex('#85868A'),
                  fontSize: G.setSp(36)
                )),
              ),
            ),
            Container(
              height: G.setWidth(100),
              width: G.setWidth(1),
              color: hex('#E5E6E5'),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                registerApi();
              },
              child: Container(
                width: G.setWidth(299),
                height: G.setWidth(100),
                alignment: Alignment.center,
                child: Text('确定注册', textAlign: TextAlign.center, style: TextStyle(
                  color: hex('#0091F0'),
                  fontSize: G.setSp(36)
                )),
              ),
            )
          ],
        )
      )
    )
    // ..doubleButton(
    //   padding: EdgeInsets.symmetric(horizontal: 0),
    //   gravity: Gravity.center,
    //   withDivider: true,
    //   text1: "取消",
    //   color1: hex('#85868A'),
      
    //   fontSize1: G.setSp(36),
    //   onTap1: () {
    //     print("取消");
    //   },
    //   text2: "确定注册",
    //   color2: hex('#0091F0'),
    //   fontSize2: G.setSp(36),
    //   onTap2: () async {
    //     registerApi();
    //   },
    // )
    ..show();
}

  void registerApi() async {
    Map data = {
      'memberType': 1,
      'mobile': mobile,
      'smsCode': sms,
      'parentShareCode': invite
    };
    var result = await LoginApi().register(data);
    if (result.data['code'] == 200) {
      G.toast('注册成功，请完善个人信息');
      String token = result.data['data']['jwtToken'];
      G.setPref('token',  'bearer ' + token);
      Provider.of<UserProvide>(context).updateUserAuth();
    }
  }

  Widget _loginSmsInput(bool disabled) {
    return VCircleInput(
        controller: _smsController,
        focus: _smsFocus,
        onChange: (String e) {
          setState(() {
            sms = e;
            formValidate['sms'] = e.length == 4;
          });
        },
        hintText: '请输入验证码',
        prefixIcon: iconsafety(),
        type: TextInputType.number,
        suffix: VTimerBtn(disabled, () async {
          FocusScope.of(context).requestFocus(_smsFocus);  
          return await LoginApi().getRegisterSmsCode(mobile);
        }),
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
        type: TextInputType.number,
        hintText: '请输入邀请码（非必填）',
        prefixIcon: iconkey(),
        maxLength: 9,
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
              var bodyJson = {"url": EnvConfig.dev['web-address'] + '/#/userAgreement'};
              var linkTemp = FluroConvertUtils.object2string(bodyJson);
              G.navigateTo(context, Routes.webviewPage + '?url=' + linkTemp + '&title=userAgreement');
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
