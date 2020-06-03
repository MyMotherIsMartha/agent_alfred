import 'package:agent37_flutter/api/llpay.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class BankMainPage extends StatefulWidget {
  @override
  _BankMainPageState createState() => _BankMainPageState();
}

class _BankMainPageState extends State<BankMainPage> {
  Map _bankInfo = {
    'bankName': '',
    'bankUserCodeEncrypt': ''
  };
  bool _hasBank = false;

  @override
  void initState() {
    // implement initState
    super.initState();
    _getUserBankInfo();
  }

  @override
  void deactivate() {
    super.deactivate();
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      print('test deactivate bank');
      _getUserBankInfo();
      // _refreshController.callRefresh();
    }
  }

  Future _getUserBankInfo() async{
    var result = await LLpayApi().getUserBankInfo();
    var resultData = result.data['data'];
    setState(() {
      _hasBank = resultData != null;
      if (_hasBank) {
        _bankInfo = resultData;
      }
    });
  }

  Widget noBankDisplay() {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VEmpty(hintText: '暂无任何银行卡，请添加～'),
          G.spacing(50),
          VButton(text: '添加银行卡', width: 300, fn: () {
            G.navigateTo(context, '/bankForm?status=0');
          })
        ]
      )
    );
  }

  Widget hasBankDisplay() {
    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      child: Column(
        children: [
          Container(
            width: G.setWidth(750),
            padding: EdgeInsets.all(G.setWidth(20)),
            child: Container(
              height: G.setWidth(360),
              padding: EdgeInsets.all(G.setWidth(30)),
              decoration: BoxDecoration(
                color: hex('#D54551'),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(
                children: <Widget>[
                  Column(children: [
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: G.setWidth(36),
                        backgroundColor: Colors.white,
                        child: Image(width: G.setWidth(50), height: G.setWidth(50),image: NetworkImage(_bankInfo['bankLogo'])),
                      ),
                      G.spacingWidth(20),
                      Text(_bankInfo['bankName'], style: TextStyle(color: Colors.white, fontSize: G.setSp(34)))
                    ]),
                    G.spacing(90),
                    Text(G.formatDigitPattern(_bankInfo['bankUserCodeEncrypt']), style: TextStyle(fontSize: G.setSp(40), color: Colors.white))
                  ]),
                  Positioned(
                    right: G.setWidth(0),
                    top: G.setWidth(0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: G.setWidth(5), horizontal: G.setWidth(15)),
                      decoration: BoxDecoration(
                        color: hex('#fff'),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text('企业', style: TextStyle(color: hex('#D54551'), fontSize: G.setSp(22)))
                    ),
                  )
                ],
              )
            )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                VButton(
                  width: 300,
                  height: 80,
                  fs: 30,
                  text: '编辑原卡', 
                  fn: () {
                    G.navigateTo(context, '/bankForm?status=1');
                  }),
                G.spacing(50),
                VButton(
                  width: 300, 
                  height: 80,
                  fs: 30,
                  textColor: '#6982FF',
                  text: '替换原卡',
                  rgbStart: [214,219,255],
                  rgbEnd: [214,219,255],
                  fn: () {
                    G.navigateTo(context, '/bankForm?status=0');
                  })
              ]
            )
          )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('after build');
    print(_bankInfo);

    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        // brightness: Brightness.dark,
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
          '银行卡管理',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
        // actions: <Widget>[
        //   FlatButton(
        //       onPressed: () {},
        //       child: Text('账单',
        //           style: TextStyle(color: hex('#000'), fontSize: G.setSp(32))))
        // ],
      ),
      body: _hasBank ? hasBankDisplay() : noBankDisplay()
    );
  }
}