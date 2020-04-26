import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class WalletWithdraw extends StatefulWidget {
  @override
  _WalletWithdrawState createState() => _WalletWithdrawState();
}

class _WalletWithdrawState extends State<WalletWithdraw> {
  final FocusNode _nodeText = FocusNode();
  final _moneyCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              setState(() {
                _moneyCtrl.value = G.setTextEdit(e);
              });
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
                    _moneyCtrl.value = G.setTextEdit('300');
                  },
                  child: Text('全部', style: TextStyle(fontSize: G.setSp(30), color: hex('#424242'), fontWeight: FontWeight.w500))
                )
            )
          ),
        )
      ],)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
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
            print('test');
            showDialog(
              context: context,
              builder: (ctx) {
                return CupertinoAlertDialog(
                  title: Text('请先完善企业信息'),
                  // content:Text('我是content'),
                  actions:<Widget>[
                    
                    CupertinoDialogAction(
                      child: Text('取消', style: TextStyle(color: hex('#85868A')),),
                      onPressed: (){
                        print('yes...');
                        Navigator.of(context).pop();
                      },
                    ),
                
                    CupertinoDialogAction(
                      child: Text('确定'),
                      onPressed: (){
                        print('no...');
                        Navigator.of(context).pop();
                      },
                    )
                  ]
                );
              },
            );
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(G.setWidth(30)),
            margin: EdgeInsets.only(top: G.setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: <Widget>[
                  Image(width: G.setWidth(40), image: AssetImage('lib/assets/images/wallet/card.png')),
                  G.spacingWidth(5),
                  Text('中国工商银行储蓄卡(2573)', style: TextStyle(fontSize: G.setSp(28), fontWeight: FontWeight.w600),),
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
              Text('可提现金额：¥300.00', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline, color: hex('#999999'), size: G.setSp(36),),
                  G.spacingWidth(5),
                  Expanded(
                    child: Text(
                      '提现金额不可少于50元；',
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
                      '服务费按照每笔2元，单笔超过10000元按照1%收取服务费',
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
          child: VButton(text: '提现', fn: null, disabled: Validate.isNon(_moneyCtrl.value.text))
        )
      ]),
    )
    );
  }
}