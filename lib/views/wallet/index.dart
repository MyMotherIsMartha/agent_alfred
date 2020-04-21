import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';

class WalletMain extends StatefulWidget {
  @override
  _WalletMainState createState() => _WalletMainState();
}

class _WalletMainState extends State<WalletMain> {
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
          '我的钱包',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text('账单',
                  style: TextStyle(color: hex('#000'), fontSize: G.setSp(32))))
        ],
      ),
      body: Column(children: [
        Container(
          width: G.setWidth(750),
          height: G.setWidth(350),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/wallet/wallet-bg.png"),
              fit: BoxFit.cover,
            )
          ),
          child: Column(children: <Widget>[
            Text('可提现金额'),
            Text('1999999999999'),
            VButton(text: '提现', fn: null)
          ],)
        )
      ]),
    );
  }
}