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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        title: Text(
          '提现',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        )
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(G.setWidth(10)),
          width: G.setWidth(750),
          color: hex('#CABEA6'),
          child: Row(
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
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(G.setWidth(30)),
          margin: EdgeInsets.only(top: G.setWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: <Widget>[
                Image(width: G.setWidth(40), image: AssetImage('lib/assets/images/wallet/invoice.png')),
                Text(' 服务费发票')
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text('¥29999.00待入账', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28), height: 1.2),),
                Icon(Icons.keyboard_arrow_right, color: hex('#999999'))
              ])
            ]
          ),
        ),
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
                  Text(' 银行卡管理')
                ]),
                Icon(Icons.keyboard_arrow_right, color: hex('#999999'))
              ]
            ),
          )
        )
      ]),
    );
  }
}