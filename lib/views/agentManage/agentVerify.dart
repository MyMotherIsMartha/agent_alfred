import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class AgentVerify extends StatefulWidget {
  final String company;
  final String mobile;

  AgentVerify({this.company, this.mobile});

  @override
  _AgentVerifyState createState() => _AgentVerifyState();
}

class _AgentVerifyState extends State<AgentVerify> {
  final TextEditingController _smsController = TextEditingController();
  int smsCode;
  String mobile;
  
  Widget _verifySmsInput(bool disabled) {
    return VInput(
      type: TextInputType.number,
      controller: _smsController,
      suffixDivider: true,
      hintText: '请输入验证码',
      label: '验证码',
      suffixWidth: 180,
      // suffix: VTimerBtn(disabled, () async {return await LoginApi().getRegisterSmsCode(mobile);}),
      suffix: VTimerBtn(
        disabled, 
        () {},
        color: '#0091F0',
      ),
      onChange: (e) {
        // String hint = Validate.isNon(e) ? '请输入真实姓名' : null;
        setState(() {
          smsCode = e;
        });
      },
    );
  }

  void goNextPage() {
    var appTitle = FluroConvertUtils.fluroCnParamsEncode('验证完成');
    G.navigateTo(context, '/resultPage?status=11&title=$appTitle&haveExit=no');
  }

  @override
  Widget build(BuildContext context) {
    var company = FluroConvertUtils.fluroCnParamsDecode(widget.company);
    mobile = widget.mobile;

    return Scaffold(
      appBar: AppBar(
        title: Text('企业认证'),
        centerTitle: true
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
            child: VButton(text: '验证', fn: null)
          )
         ], 
        )
      ),
    );
  }
}