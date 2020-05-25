import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'dart:io';

class NetErrorPage extends StatefulWidget {
  @override
  _NetErrorPageState createState() => _NetErrorPageState();
}

class _NetErrorPageState extends State<NetErrorPage> {
  bool haveClick = false;

  void checkNetStatus() async {
    if (!haveClick) {
      print('checkConnectivity');
      haveClick = true;
      ConnectivityResult result;
      // Platform messages may fail, so we use a try/catch PlatformException.
      result = await (Connectivity().checkConnectivity());
      Timer(new Duration(seconds: 1), () => {
        haveClick = false
      });
      
      if (result == ConnectivityResult.mobile) {
        print('mobile');
        // I am connected to a mobile network.
        Navigator.pop(context);
      } else if (result == ConnectivityResult.wifi) {
        print('wifi');
        // I am connected to a wifi network.
        Navigator.pop(context);
      } else {
        print('TEST');
        G.toast('网络依然不可用哦...', duration: 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: 
     Container(
      height: G.setWidth(1334),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(width: G.setWidth(400),image: AssetImage("lib/assets/images/common/net-error.png")),
          G.spacing(5),
          Text('网络貌似出了问题', style: TextStyle(
            color: hex('#85868B')
          )),
          G.spacing(28),
          InkWell(
            onTap: () {
              // fn();
              checkNetStatus();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(46), vertical: G.setWidth(16)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                border: Border.all(color: hex('#BFBFBF'), width: G.setWidth(1))
              ),
              child: Text('刷新试试', style: TextStyle(
                fontSize: G.setSp(26),
                color: hex('#85868B')
              )),
            ),
          )
        ],
      )
    ));
  }
}