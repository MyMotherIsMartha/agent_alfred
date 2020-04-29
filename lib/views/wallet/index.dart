import 'package:agent37_flutter/api/finance.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agent37_flutter/provide/user.dart';

class WalletMain extends StatefulWidget {
  @override
  _WalletMainState createState() => _WalletMainState();
}

class _WalletMainState extends State<WalletMain> {
  double withdrawalBalance = 0.0;

  _getAccountInfo() async {
    var result = await FinanceApi().getAccountInfo();
    var resultData = result.data['data'];
    setState(() {
      withdrawalBalance = resultData['withdrawalBalance'];
    });
    print(resultData.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('test initState wallet');
    _getAccountInfo();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      print('test deactivate wallet');
      _getAccountInfo();
      // _refreshController.callRefresh();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // Provider.of<UserProvide>(context).updateBankCardInfo();
    var bankCardInfo = Provider.of<UserProvide>(context).bankCardInfo;

    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        title: Text(
          '我的钱包',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                G.router.navigateTo(context, '/walletMain/billHistory');
              },
              child: Text('账单',
                  style: TextStyle(color: hex('#000'), fontSize: G.setSp(32))))
        ],
      ),
      body: Column(children: [
        Container(
          width: G.setWidth(750),
          height: G.setWidth(350),
          padding: EdgeInsets.symmetric(vertical: G.setWidth(50), horizontal: G.setWidth(30)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/wallet/wallet-bg.png"),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text('可提现金额', style: TextStyle(color: Colors.white60),),
            G.spacing(10),
            Text(withdrawalBalance.toStringAsFixed(2), style: TextStyle(color: Colors.white, fontSize: G.setSp(70)),),
            G.spacing(10),
            FlatButton(
              onPressed: () {
                if (bankCardInfo == null) {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return CupertinoAlertDialog(
                        title: Text('请先完成银行卡绑定'),
                        // content:Text('我是content'),
                        actions:<Widget>[
                          
                          CupertinoDialogAction(
                            child: Text('取消', style: TextStyle(color: hex('#85868A')),),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          ),
                      
                          CupertinoDialogAction(
                            child: Text('确定'),
                            onPressed: (){
                              Navigator.of(context).pop();
                              G.router.navigateTo(context, '/bankMain');
                            },
                          )
                        ]
                      );
                    },
                  );
                } else {
                  G.router.navigateTo(context, '/walletMain/withdraw');
                }
                
              },
              color: Colors.white,
              shape: StadiumBorder(),
              // textColor: hex('#6982FF'),
              child: Text('提现', style: TextStyle(
                  fontSize: G.setSp(30),
                  color: hex('#6982FF')
                ),
              )
            )
          ],)
        ),
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
        InkWell(
          onTap: () {
            G.router.navigateTo(context, '/invoiceList');
          },
          child:
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
            )
        ),
        InkWell(
          onTap: () {
            print('test');
            G.router.navigateTo(context, '/bankMain');
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