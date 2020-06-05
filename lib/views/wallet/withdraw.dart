import 'package:agent37_flutter/api/finance.dart';
import 'package:agent37_flutter/api/system.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:agent37_flutter/views/wallet/components/authCode.dart';
import 'package:color_dart/hex_color.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:provider/provider.dart';

class WalletWithdraw extends StatefulWidget {
  @override
  _WalletWithdrawState createState() => _WalletWithdrawState();
}

class _WalletWithdrawState extends State<WalletWithdraw> {
  final FocusNode _nodeText = FocusNode();
  final _moneyCtrl = TextEditingController();
  bool haveValidate = false;

  double withdrawalBalance = 0;

  bool showFee = false;
  dynamic currentFee = 0.0;
  String hintText = '';

  dynamic lessMoney = 0.0;
  dynamic serviceFee = 0.0;
  dynamic overMoney = 0.0;
  dynamic percentFee = 0.0;

  @override
  void initState() {
    super.initState();
    _getAccountInfo();
    _getSystemSetting();
  }

  _getAccountInfo() async {
    var result = await FinanceApi().getAccountInfo();
    var resultData = result.data['data'];
    setState(() {
      withdrawalBalance = resultData['withdrawalBalance'];
      hintText = '可提现金额：¥${withdrawalBalance.toStringAsFixed(2)}';
    });
    print(resultData.toString());
  }

  Future _getSystemSetting() async {
    var result = await SystemApi().getSystemSettings();
    var resultData = result.data['data'];
    print(resultData);
    setState(() {
      lessMoney = resultData['singleWithdrawServiceCharge'];
      serviceFee = resultData['singleWithdrawServiceCharge'];
      overMoney = resultData['singleWithdrawExcessAmount'];
      percentFee = resultData['singleWithdrawExcessAmountFee'];
    });
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _nodeText,
        )
      ]);
  }

  Widget inputMoney() {
    return Container(
      padding: EdgeInsets.only(bottom: G.setWidth(5)),
      margin: EdgeInsets.only(bottom: G.setWidth(10)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: hex('#E5E6E5'), width:  G.setWidth(1)))
      ),
      child: Row(
        children: <Widget>[
        Text('¥ ', style: TextStyle(fontSize: G.setSp(60), color: hex('#434343'), fontWeight: FontWeight.w600)),
        Expanded(
          child: TextFormField(
            style: TextStyle(color: hex('#333'), fontSize: G.setSp(50)),
            onTap: () {
              print('object');
            },
            controller: _moneyCtrl,
            onChanged: (e) {
              print(_moneyCtrl.value.text);
              var regx = RegExp(r"^(([1-9]{1}\d*)|(0{1}))(\.\d{1,2})?$");
              if (regx.hasMatch(e)) {
                setState(() {
                  // _moneyCtrl.value = G.setTextEdit(e);
                  showFee = true;
                  double withdrawMoney = double.parse(e);
                  if (withdrawMoney > withdrawalBalance) {
                    hintText = '超出可提现金额';
                  } else if (withdrawMoney < lessMoney) {
                    hintText = '提现金额不能少于${lessMoney.toStringAsFixed(0)}元';
                  } else {
                    if (withdrawMoney >= overMoney) {
                      currentFee = withdrawMoney * percentFee / 100;
                    } else {
                      currentFee = serviceFee;
                    }
                    hintText = '服务费¥${currentFee.toStringAsFixed(2)}';
                  }
                  
                });
              } else {
                setState(() {
                  hintText = '可提现金额：¥${withdrawalBalance.toStringAsFixed(2)}';
                });
              }
              
            },
            // autofocus: true,
            focusNode: _nodeText,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入提现金额',
                hintStyle: TextStyle(color: hex('#BFBFBF'), fontSize: G.setSp(30)),
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      _moneyCtrl.value = G.setTextEdit(withdrawalBalance.toStringAsFixed(2));
                    });
                  },
                  child: Text('全部', style: TextStyle(fontSize: G.setSp(30), color: hex('#424242'), fontWeight: FontWeight.w500))
                )
            )
          ),
        )
      ],)
    );
  }

  
  String getBankTitle(bankCardInfo) {
    var codeLength = bankCardInfo['bankUserCode'].length;
    return '${bankCardInfo['bankUserName']}(${bankCardInfo['bankUserCode'].substring(codeLength - 4, codeLength)})';
  }

  _showAuthCodeWindow() {
    print(Provider.of<UserProvide>(context).userAuthInfo.mobile);
    var mobile = Provider.of<UserProvide>(context).userAuthInfo.mobile;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('提现确认',
                style: TextStyle(fontSize: G.setSp(30), fontWeight: FontWeight.w600, color: hex('#424242'))
              ),
              IconButton(
                icon: iconclose(),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]),
            G.spacing(15),
            Text('提现确认：本次提现需要短信验证码，校验码已发送至您手机${G.hideMobile(mobile)}',
              style: TextStyle(fontSize: G.setSp(24), color: hex('#666666'))
            ),
          ]),
          titlePadding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
          contentPadding: EdgeInsets.all(G.setWidth(40)),
          backgroundColor: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          children: <Widget>[
            CodeInputTextField(
              codeLength: 4,
              autoFocus: true,
              textInputAction: TextInputAction.go,
              getSmsCode: () async {
                var result = await FinanceApi().getWithDrawalApplyCode();
              },
              onSubmit: (code) async {
                print('submit code:$code');
                if (!haveValidate) {
                  haveValidate = true;
                  var params = {
                    'withDrawalAmount':  _moneyCtrl.value.text,
                    'smsCode': code
                  };
                  print(params);
                  var result = await FinanceApi().withDrawalApply(params);
                  print(result.data['data']);
                  if (result.data['code'] == 200) {
                    G.toast('提现成功');
                    _getAccountInfo();
                    _moneyCtrl.value = G.setTextEdit('');
                  }
                  Future.delayed(Duration(seconds: 2), () {
                    haveValidate = false;
                  });
                  Navigator.pop(context);
                }
              },
            )
          ],
        );
      });
  }

  void withdrawFunc() async {
    
    var regx = RegExp(r"^(([1-9]{1}\d*)|(0{1}))(\.\d{1,2})?$");
    var inputMoney = _moneyCtrl.value.text;
    if (!regx.hasMatch(_moneyCtrl.value.text)) {
      G.toast('请输入正确的提现金额');
      return;
    }
    double withdrawMoney = double.parse(inputMoney);
    if (withdrawMoney < lessMoney) {
      G.toast('提现金额不能少于${lessMoney.toStringAsFixed(0)}元');
      return;
    }
    if (withdrawMoney > withdrawalBalance) {
      G.toast('超出可提现金额');
      return;
    }
    _showAuthCodeWindow();
    // var params = {
    //   'withDrawalAmount':  _moneyCtrl.value.text
    // };
    // print(params);
    // var result = await FinanceApi().withDrawalApply(params);
    // print(result.data['data']);
    // if (result.data['code'] == 200) {
    //   G.toast('提现成功');
    //   _getAccountInfo();
    //   _moneyCtrl.value = G.setTextEdit('');
    // }
  }

  @override
  Widget build(BuildContext context) {
    var bankCardInfo = Provider.of<UserProvide>(context).bankCardInfo;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        leading: BackButton(
          onPressed: () {
            G.navigateTo(context, '/walletMain',
                replace: true, transition: TransitionType.inFromLeft);
          },
        ),
        title: Text(
          '提现',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        )
      ),
      body: KeyboardActions(
       config: _buildConfig(context),
        child: Column(children: [
        InkWell(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (ctx) {
            //     return CupertinoAlertDialog(
            //       title: Text('请先完善企业信息'),
            //       // content:Text('我是content'),
            //       actions:<Widget>[
                    
            //         CupertinoDialogAction(
            //           child: Text('取消', style: TextStyle(color: hex('#85868A')),),
            //           onPressed: (){
            //             print('yes...');
            //             Navigator.of(context).pop();
            //           },
            //         ),
                
            //         CupertinoDialogAction(
            //           child: Text('确定'),
            //           onPressed: (){
            //             print('no...');
            //             Navigator.of(context).pop();
            //           },
            //         )
            //       ]
            //     );
            //   },
            // );
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(G.setWidth(30)),
            margin: EdgeInsets.only(top: G.setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: <Widget>[
                  Image(width: G.setWidth(40), image: NetworkImage(bankCardInfo['bankLogo'])),
                  G.spacingWidth(5),
                  Text(getBankTitle(bankCardInfo), style: TextStyle(fontSize: G.setSp(28), fontWeight: FontWeight.w600),),
                  G.spacingWidth(5),
                  Image(width: G.setWidth(60), image: AssetImage('lib/assets/images/wallet/enterprise-tag.png')),
                ]),
                // Icon(Icons.keyboard_arrow_right, color: hex('#999999'))
              ]
            ),
          )
        ),
        Container(
          margin: EdgeInsets.only(top: G.setWidth(20)),
          padding: EdgeInsets.symmetric(vertical: G.setWidth(20), horizontal: G.setWidth(30)),
          constraints: BoxConstraints(
            minWidth: double.infinity
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('提现金额', style: TextStyle(fontSize: G.setSp(30), color: hex('#333'), fontWeight: FontWeight.w600),),
              G.spacing(24),
              inputMoney(),
              Text(
                hintText, 
                style: TextStyle(color: hex('#666'), fontSize: G.setSp(28))),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline, color: hex('#999999'), size: G.setSp(36),),
                  G.spacingWidth(5),
                  Expanded(
                    child: Text(
                      '提现金额不可少于${lessMoney.toStringAsFixed(0)}元；',
                      style: TextStyle(color: hex('#999999'), fontSize: G.setSp(24)),
                    ),
                  )
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline, color: hex('#fff'), size: G.setSp(36),),
                  G.spacingWidth(5),
                  Expanded(
                    child: Text(
                      '服务费按照每笔${lessMoney.toStringAsFixed(0)}元，单笔超过${overMoney.toStringAsFixed(0)}元按照${percentFee.toStringAsFixed(1)}%收取服务费',
                      style: TextStyle(color: hex('#999999'), fontSize: G.setSp(24)),
                    ),
                  )
                ]
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: G.setWidth(80)),
          child: VButton(
            text: '提现', 
            disabled: Validate.isNon(_moneyCtrl.value.text), 
            fn: withdrawFunc
          )
        )
      ]),
    )
    );
  }
}