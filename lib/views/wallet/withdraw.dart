import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletWithdraw extends StatefulWidget {
  @override
  _WalletWithdrawState createState() => _WalletWithdrawState();
}

class _WalletWithdrawState extends State<WalletWithdraw> {

  Widget inputMoney() {
    return Container(
      padding: EdgeInsets.only(bottom: G.setWidth(5)),
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
            autofocus: true,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入提现金额',
                hintStyle: TextStyle(color: hex('#BFBFBF'), fontSize: G.setSp(30)),
                suffix: GestureDetector(
                  onTap: () {
                    print('tap all');
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
      body: Column(children: [
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
              Text('可提现金额：¥300.00'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline, color: Colors.white, size: G.setSp(36),),
                  G.spacingWidth(5),
                  Expanded(
                    child: Text(
                      '已过考核期代理每月15日结算上月预估服务费，15至20日为服务费的开票周期，25日把服务费入账至可提现金额', 
                      softWrap: true, 
                      style: TextStyle(color: Colors.white, fontSize: G.setSp(24)),
                    ),
                  )
                ]
              ),
            ],
          ),
        )
      ]),
    );
  }
}