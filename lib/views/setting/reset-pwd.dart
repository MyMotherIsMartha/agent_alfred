import 'package:agent37_flutter/api/setting.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class SettingResetPwdPage extends StatefulWidget {
  @override
  _SettingResetPwdPageState createState() => _SettingResetPwdPageState();
}

class _SettingResetPwdPageState extends State<SettingResetPwdPage> {
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _newPwdController = TextEditingController();
  // TextEditingController _resetPwdController = TextEditingController();
  String password;
  String newPassword;
  // String resetPassword;
  bool _showPwd = false;
  bool _showNewPwd = false;
  // bool _showResetPwd = false;
  Map formValidate = {
    'pwd': false,
    'newPwd': false,
    // 'resetPwd': false,
  };
  bool btnCanClick = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        title: Text('重置登录密码'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            child: Column(
              children: <Widget>[
                G.spacing(20),
                Container(
                  height: G.setWidth(100),
                  color: hex('#fff'),
                  child: VInput(
                    maxLength: 15,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          _showPwd = !_showPwd;
                        });
                      },
                      child: _showPwd ? iconeye() : iconcloseeye(),
                    ),
                    
                    type: _showPwd ? TextInputType.text : TextInputType.visiblePassword,
                    controller: _pwdController,
                    hintText: '请输入原密码',
                    label: '原密码',
                    onChange: (e) {
                      setState(() {
                        password = e;
                        formValidate['pwd'] = !Validate.isNon(e) && e.length > 5;
                      });
                    },
                  )
                ),
                Container(
                  height: G.setWidth(100),
                  color: hex('#fff'),
                  child: VInput(
                    maxLength: 15,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          _showNewPwd = !_showNewPwd;
                        });
                      },
                      child: _showNewPwd ? iconeye() : iconcloseeye(),
                    ),
                    
                    type: _showNewPwd ? TextInputType.text : TextInputType.visiblePassword,
                    // type: TextInputType.text,
                    controller: _newPwdController,
                    hintText: '请输入新密码',
                    label: '新密码',
                    onChange: (e) {
                      setState(() {
                        formValidate['newPwd'] = !Validate.isNon(e) && e.length > 5;
                      });
                      newPassword = e;
                    },
                  )
                ),
                // Container(
                //   height: G.setWidth(100),
                //   color: hex('#fff'),
                //   child: VInput(
                //     maxLength: 16,
                //     suffix: InkWell(
                //       onTap: () {
                //         setState(() {
                //           _showResetPwd = !_showResetPwd;
                //         });
                //       },
                //       child: _showResetPwd ? iconeye() : iconcloseeye(),
                //     ),
                    
                //     type: _showResetPwd ? TextInputType.text : TextInputType.visiblePassword,
                //     controller: _resetPwdController,
                //     hintText: '请输入重复新密码',
                //     label: '重复密码',
                //     onChange: (e) {
                //       setState(() {
                //         formValidate['resetPwd'] = !Validate.isNon(e) && e.length > 5;
                //       });
                //       resetPassword = e;
                //     },
                //   )
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
                  alignment: Alignment.centerLeft,
                  height: G.setWidth(60),
                  child: Text('请输入6-15位登录密码，需同时包含英文和数字',
                      style:
                          TextStyle(fontSize: G.setSp(24), color: hex('#999'))),
                ),
                G.spacing(20),
                VButton(
                  disabled: formValidate.containsValue(false),
                  width: 690,
                  fn: () async {
                    // if (newPassword != resetPassword ) {
                    //   G.toast('两次密码输入不同');
                    //   return;
                    // }
                    if (!btnCanClick) {
                      return;
                    }
                    btnCanClick = false;
                    Future.delayed(Duration(seconds: 1), () {
                      btnCanClick = true;
                    });
                    Map data = {
                      "newPassword1": newPassword,
                      "newPassword2": newPassword,
                      "password": password
                    };
                    var result = await SettingApi().updatePassword(data);
                    print(result);
                    if (result.data['code'] == 200) {
                      G.toast('修改成功，请重新登录');
                      G.removePref('token');
                      G.navigateTo(context, '/login', replace: true);
                    }
                  },
                  text: '确定',
                )
              ],
            ),
          )),
    );
  }
}