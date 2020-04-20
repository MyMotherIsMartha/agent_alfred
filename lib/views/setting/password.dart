import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/api/setting.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPwdPage extends StatefulWidget {
  @override
  _SettingPwdPageState createState() => _SettingPwdPageState();
}

class _SettingPwdPageState extends State<SettingPwdPage> {
  TextEditingController _pwdController = TextEditingController();
  String password;
  bool _showPwd = false;
  Map formValidate = {
    'pwd': false
  };

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        title: Text('设置登录密码'),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
                  alignment: Alignment.centerLeft,
                  height: G.setWidth(60),
                  child: Text('请输入1-16位，可由中英文、数字组成',
                      style:
                          TextStyle(fontSize: G.setSp(24), color: hex('#999'))),
                ),
                Container(
                  height: G.setWidth(100),
                  color: hex('#fff'),
                  child: VInput(
                    maxLength: 16,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          _showPwd = !_showPwd;
                        });
                      },
                      child: _showPwd ? iconeye() : iconcloseeye(),
                    ),
                    
                    type: _showPwd ? TextInputType.text : TextInputType.visiblePassword,
                    value: '',
                    controller: _pwdController,
                    hintText: '请设置登录密码',
                    label: '登录密码',
                    onChange: (e) {
                      setState(() {
                        password = e;
                        formValidate['pwd'] = !Validate.isNon(e) && e.length > 5;
                      });
                    },
                  )
                ),
                G.spacing(80),
                VButton(
                  disabled: formValidate.containsValue(false),
                  width: 690,
                  fn: () async {
                    var result = await SettingApi().setPassword(password);
                    print(result);
                    if (result.data['code'] == 200) {
                      UserProvide userProvide = Provider.of<UserProvide>(context);
                      userProvide.updateUserAuth(isInit: false);
                      G.toast('操作成功');
                      FocusScope.of(context).requestFocus(FocusNode());
                      G.router.pop(context);
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
