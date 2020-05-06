import 'package:agent37_flutter/api/login.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-hint.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPage extends StatefulWidget {
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final _formKey = GlobalKey<FormState>();
  String mobile;
  String sms;
  String pwd;
  String errorMsg = '';
  bool smsDisabled = true;
  bool pwdVisible = false;
  Map<String, bool> formValidate = {
    'mobile': false,
    'sms': false,
    'pwd': false
  };

  final mobileController = TextEditingController();
  final smsController = TextEditingController();
  final pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('忘记密码'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: hex('#F3F4F6'),
            child: Column(
              children: <Widget>[
                G.spacing(20),
                Container(
                  color: hex('#FFF'),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        VInput(
                          controller: mobileController,
                          hintText: '请输入您的登录手机号',
                          label: '手机号',
                          maxLength: 11,
                          type: TextInputType.phone,
                          // validator: (value) {
                          //   if (Validate.isNon(errorMsg)) {
                          //     setState(() {
                          //       errorMsg = Validate.checkMobile(value);
                          //     });
                          //   }
                          //   print(errorMsg);
                          // },
                          onChange: (e) {
                            setState(() {
                              smsDisabled = Validate.checkMobile(e) != null;
                              formValidate['mobile'] =
                                  Validate.checkMobile(e) == null;
                            });
                            mobile = e;
                          },
                        ),
                        VInput(
                          controller: smsController,
                          hintText: '请输入验证码',
                          label: '验证码',
                          maxLength: 4,
                          // validator: (value) {
                          //   if (Validate.isNon(errorMsg)) {
                          //     setState(() {
                          //       errorMsg = _smsValidate(value);
                          //     });
                          //   }
                          // },
                          onChange: (value) {
                            _smsValidate(value);
                            sms = value;
                          },
                          suffixWidth: 270,
                          suffix: VTimerBtn(
                            smsDisabled,
                            () => LoginApi().forgetSms(mobile),
                            color: '#0091F0',
                          ),
                        ),
                        VInput(
                          controller: pwdController,
                          hintText: '6-15字符，可输入数字和大小写英文',
                          label: '新密码',
                          maxLength: 16,
                          type: pwdVisible
                              ? TextInputType.text
                              : TextInputType.visiblePassword,
                          
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                pwdVisible = !pwdVisible;
                              });
                            },
                            icon: pwdVisible ? iconeye() : iconcloseeye(),
                          ),
                          // validator: (value) {
                          //   if (Validate.isNon(errorMsg)) {
                          //     setState(() {
                          //       errorMsg = _pwdValidate(value);
                          //     });
                          //   }
                          // },
                          onChange: (value) {
                            _pwdValidate(value);
                            pwd = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                G.spacing(20),
                Validate.isNon(errorMsg)
                    ? G.spacing(G.setHeight(50))
                    : VHint(errorMsg),
                G.spacing(40),
                VButton(
                  width: 690,
                  text: '确认',
                  disabled: formValidate.containsValue(false),
                  fn: () async {
                    Map data = {
                      'mobile': mobile,
                      'newPassword': pwd,
                      'smsCode': sms
                    };
                    var result = await LoginApi().forgetPwd(data);
                    print(result);
                    if (result.data['code'] == 200) {
                      G.toast('修改密码成功');
                      G.navigateTo(context, '/login', replace: true);
                    }
                    // setState(() {
                    //   errorMsg = null;
                    // });
                    // Validate returns true if the form is valid, otherwise false.
                    // if (_formKey.currentState.validate()) {
                    //   Map data = {
                    //     'mobile': mobile,
                    //     // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
                    //   };

                    //   print(1234);
                    //   print(data);
                      // FormData formData = FormData.fromMap(data);
                      // var result = await UserApi().createAddress(data);
                      // if (result.data['code'] == 200) {
                      //   G.toast('操作成功');
                      //   Provider.of<UserinfoProvide>(context).toggleRefreshAddress();
                      //   G.router.pop(context);
                      // } else {
                      //   G.toast(result.data['message']);
                      // }
                      // print(result);
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      // Scaffold.of(context).showSnackBar(
                      //     SnackBar(content: Text('Processing Data')));
                    // }
                  },
                )
              ],
            ),
          ),
        ));
  }

  String _smsValidate(String value) {
    if (value == null || value.isEmpty) {
      _setValidate('sms', false);
      return '请输入验证码';
    } else if (value.length != 4) {
      _setValidate('sms', false);
      return '验证码错误';
    } else {
      _setValidate('sms', true);
      return null;
    }
  }

  String _pwdValidate(String value) {
    if (value == null || value.isEmpty) {
      _setValidate('pwd', false);
      return '请输入密码';
    } else if (value.length < 6 || value.length > 16) {
      _setValidate('pwd', false);
      return '密码长度在6-16位之间';
    } else {
      _setValidate('pwd', true);
      return null;
    }
  }

  void _setValidate(String key, bool value) {
    setState(() {
      formValidate[key] = value;
    });
  }
}
