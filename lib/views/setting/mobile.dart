import 'package:agent37_flutter/api/setting.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/models/user-auth.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/event_bus.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingMobilePage extends StatefulWidget {
  @override
  _SettingMobilePageState createState() => _SettingMobilePageState();
}

class _SettingMobilePageState extends State<SettingMobilePage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _mobileChangeController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  final TextEditingController _smsChangeController = TextEditingController();
  int currentStep = 1;
  String sms;
  String smsChange;
  String mobile;
  bool smsDisabled = false;
  Map formValidate1 = {'sms': false};
  Map formValidate2 = {
    'mobile': false,
    'sms': false
  };

  String _smsValidate(String value, Map formSource) {
    if (value == null || value.isEmpty) {
      setState(() {
        formSource['sms'] = false;
      });
      return '请输入验证码';
    } else if (value.length != 4) {
      setState(() {
        formSource['sms'] = false;
      });
      return '验证码错误';
    } else {
      setState(() {
        formSource['sms'] = true;
      });
      return null;
    }
  }

  Widget _stepone(context) {
    UserAuthModel userAuthInfo = Provider.of<UserProvide>(context).userAuthInfo;
    return Container(
      child: Column(
        children: <Widget>[
          G.spacing(20),
          Container(
              height: G.setWidth(100),
              color: hex('#fff'),
              child: VInput(
                value: G.mixMobile(userAuthInfo.mobile),
                controller: _mobileController,
                hintText: '',
                label: '原手机号',
                readOnly: true,
              )),
          Container(
            height: G.setWidth(100),
            color: hex('#fff'),
            child: VInput(
                controller: _smsController,
                hintText: '请输入验证码',
                label: '验证码',
                type: TextInputType.number,
                maxLength: 4,
                onChange: (value) {
                  _smsValidate(value, formValidate1);
                  sms = value;
                },
                suffix: VTimerBtn(
                  false,
                  SettingApi().applySmsCode,
                  color: '#0091F0',
                ),
                suffixWidth: 280),
          ),
          G.spacing(80),
          VButton(
            disabled: formValidate1.containsValue(false),
            width: 690,
            fn: () async {
              var result = await SettingApi().checkSmsCode(sms);
              if (result.data['code'] == 200) {
                eventBus.fire(TimerClearBus());
                FocusScope.of(context).requestFocus(FocusNode());
                setState(() {
                  currentStep = 2;
                });
              }
            },
            text: '下一步',
          )
        ],
      ),
    );
  }

  Widget _steptwo() {
    return Container(
      child: Column(
        children: <Widget>[
          G.spacing(20),
          Container(
              height: G.setWidth(100),
              color: hex('#fff'),
              child: VInput(
                type: TextInputType.number,
                inputFormatters: WhitelistingTextInputFormatter(RegExp("[0-9]")),
                // value: userAuthInfo.mobile,
                controller: _mobileChangeController,
                hintText: '请输入新手机号',
                label: '新手机号',
                maxLength: 11,
                onChange: (e) {
                  setState(() {
                    formValidate2['mobile'] = Validate.checkMobile(e) == null;
                  });
                  mobile = e;
                },
              )),
          Container(
            height: G.setWidth(100),
            color: hex('#fff'),
            child: VInput(
                controller: _smsChangeController,
                hintText: '请输入验证码',
                label: '验证码',
                type: TextInputType.number,
                maxLength: 4,
                onChange: (value) {
                  _smsValidate(value, formValidate2);
                  // setState(() {
                  //   smsDisabled = formValidate2['mobile'] != null;
                  // });
                  smsChange = value;
                },
                suffix: VTimerBtn(
                  !formValidate2['mobile'],
                  () => SettingApi().applyChangeSmsCode(mobile),
                  color: '#0091F0',
                ),
                suffixWidth: 280),
          ),
          G.spacing(80),
          VButton(
            disabled: formValidate2.containsValue(false),
            width: 690,
            fn: () async {
              Map data = {
                'mobile': mobile,
                'newMobile': mobile,
                'smsCode': smsChange
              };
              var result = await SettingApi().checkChangeSmsCode(data);
              if (result.data['code'] == 200) {
                UserProvide userProvide = Provider.of<UserProvide>(context);
                userProvide.updateUserAuth(isInit: false);
                G.toast('操作成功');
                G.removePref('startTime');
                FocusScope.of(context).requestFocus(FocusNode());
                G.router.pop(context);
              }
            },
            text: '确定',
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        title: Text('变更手机号'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: currentStep == 1
                  ? _stepone(context)
                  : _steptwo()
          // AnimatedSwitcher(
          //    duration: const Duration(milliseconds: 3000),
          //    transitionBuilder: (Widget child, Animation<double> animation) {
          //      //执行缩放动画
          //      return ScaleTransition(child: child, scale: animation);
          //    },
          //    child: currentStep == 1
          //         ? _stepone(context)
          //         : _steptwo()
          //  ),
          // currentStep == 1
          //  ? _stepone(context)
          //  : _steptwo()
      ),
    );
  }
}
