import 'dart:async';

import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class CreateOrderPage extends StatefulWidget {
  final String price;
  CreateOrderPage({this.price});
  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  Timer _timer;
  int _countdownTime;
  int _orderOverTime;

  @override
  void initState() {
    super.initState();
    _getOrderInfo();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: G.setHeight(1334),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [hex('#69A5FF'), hex('#685AFF')],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      brightness: Brightness.dark,
                      iconTheme: IconThemeData(color: hex('#fff')),
                    ),
                    _orderInfo(),
                    // child: FutureBuilder(
                    //   future: _getOrderInfo(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return _orderInfo();
                    //     } else {
                    //       return VLoading();
                    //     }
                    //   },
                    // ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: _payContent(),
                )
              ],
            )));
  }

  void _getOrderInfo() async {
    var result = await OrderApi().getGiftPackageOrders();
    setState(() {
      _orderOverTime = result.data['data']['orderOverime'];
    });
    // print(result.data['data']);
    // print(_orderOverTime);
    countDown();
    // return result.data['data'];
  }

  Widget _orderInfo() {
    return Container(
      height: G.setHeight(272),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('￥${widget.price}',
              style: TextStyle(fontSize: G.setSp(60), color: hex('#fff'))),
          G.spacing(10),
          Text(_clock(_countdownTime),
              style: TextStyle(fontSize: G.setSp(30), color: hex('#fff')))
        ],
      ),
    );
  }

  countDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      int nowTime = (DateTime.now().millisecondsSinceEpoch / 1000).round();
      int result = (_orderOverTime / 1000).round() - nowTime;
      print(result);
      if (result < 0) {
        _timer?.cancel();
      }
      setState(() {
        _countdownTime = result;
      });
    });
  }

  String _clock(int timeUnix) {
    if (timeUnix != null) {
      int hour = (timeUnix / 3600).floor();
      int min = timeUnix % 3600 ~/ 60;
      int sec = timeUnix % 60;
      return '剩余支付时间：${hour}时${min}分${sec}秒';
    }
    return '';
  }

  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);

    var callback = (timer) {
      return setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
        } else {
          _countdownTime = _countdownTime - 1;
        }
      });
    };

    _timer = Timer.periodic(oneSec, callback);
  }

  Widget _payContent() {
    return Container(
      width: G.setWidth(750),
      height: G.setHeight(934),
      decoration: BoxDecoration(
          color: hex('#fff'),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
    );
  }
}
