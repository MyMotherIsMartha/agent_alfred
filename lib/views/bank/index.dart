import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';

class BankMainPage extends StatefulWidget {
  @override
  _BankMainPageState createState() => _BankMainPageState();
}

class _BankMainPageState extends State<BankMainPage> {
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
      body: Container(
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
              G.router.navigateTo(context, '/bankForm');
            })
          ]
        )
      )
    );
  }
}