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
        iconTheme: IconThemeData(color: hex('#fff')),
        title: Text(
          '我的钱包',
          style: TextStyle(color: hex('#fff'), fontSize: G.setSp(36)),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text('账单',
                  style: TextStyle(color: hex('#fff'), fontSize: G.setSp(32))))
        ],
      ),
    );
  }
}