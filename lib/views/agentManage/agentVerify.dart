import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AgentVerify extends StatefulWidget {
  final String company;
  final String mobile;
  final String sharecode;

  AgentVerify({this.company, this.mobile, this.sharecode});

  @override
  _AgentVerifyState createState() => _AgentVerifyState();
}

class _AgentVerifyState extends State<AgentVerify> {
  final TextEditingController _smsController = TextEditingController();
  String smsCode = '';
  String mobile;
  String sharecode;

  void _verifyFunc() async {
    var params = {
      "shareCode": sharecode,
      "smsCode": smsCode
    };
    var result = await MemberApi().verifySubAgent(params);
    if (result.data['code'] == 200) {
      G.toast('验证成功');
      // G.router.pop(context);
      G.navigateTo(context, '/agentManage?tabIndex=1', replace: true, transition: TransitionType.inFromLeft);
    }
  }
  
  Widget _verifySmsInput(bool disabled) {
    return VInput(
      type: TextInputType.number,
      controller: _smsController,
      suffixDivider: true,
      hintText: '请输入验证码',
      label: '验证码',
      suffixWidth: 260,
      // maxLength: 4,
      // prefixIcon: iconsafety(),
      suffix: VTimerBtn(false, () async {return await MemberApi().getAgentVerifyCode(sharecode);}, color: '#0091F0'),
      maxLength: 4,
      // suffix: VTimerBtn(disabled, () async {return await LoginApi().getRegisterSmsCode(mobile);}),
      // suffix: VTimerBtn(false, () async {return await MemberApi().getAgentVerifyCode(sharecode);}, color: '#0091F0'),
      onChange: (e) {
        // String hint = Validate.isNon(e) ? '请输入真实姓名' : null;
        setState(() {
          smsCode = e;
        });
      },
    );
  }

  void goNextPage() {
    // var appTitle = FluroConvertUtils.fluroCnParamsEncode('验证完成');
    G.navigateTo(context, '/resultPage?status=11&haveExit=no');
  }

  @override
  Widget build(BuildContext context) {
    var company = FluroConvertUtils.fluroCnParamsDecode(widget.company);
    mobile = widget.mobile;
    sharecode = widget.sharecode;

    return Scaffold(
      appBar: AppBar(
        title: Text('代理商短信验证'),
        centerTitle: true,
        // leading: BackButton(
        //   onPressed: () {
        //     G.navigateTo(context, '/agentManage?tabIndex=1', replace: true, transition: TransitionType.inFromLeft);
        //   },
        // ),
      ),
      body: Container(
        color: hex('#F3F4F6'),
        margin: EdgeInsets.only(top: G.setWidth(20)),
        child: Column(
         children: <Widget>[
           Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              VField(
                label: '公司名称',
                fieldVal: company,
              ),
              VField(
                label: '手机号',
                fieldVal: mobile,
              ),
              _verifySmsInput(false),
              // RaisedButton(onPressed: () {
              //   goNextPage();
              // },
              // child: Text('go next'),
              // )
            ],)
          ),
          Container(
            margin: EdgeInsets.only(top: G.setWidth(80)),
            child: VButton(disabled: smsCode == '',text: '验证', fn: _verifyFunc)
          )
         ], 
        )
      ),
    );
  }
}