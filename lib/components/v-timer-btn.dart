import 'dart:async';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class VTimerBtn extends StatefulWidget {
  final bool disabled;
  VTimerBtn(this.disabled);
  @override
  _VTimerBtnState createState() => _VTimerBtnState();
}

class _VTimerBtnState extends State<VTimerBtn> {
  /// 开始倒计时 时间
  int startTime;

  /// 当前倒计时 时间
  int countDownTime = 0;

  /// 总倒计时时长
  final int speed = 60;

  Timer _timer;

  countDown() {
    startTime = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    G.setPref('startTime', startTime.toString());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      int nowTime = (DateTime.now().millisecondsSinceEpoch / 1000).round();
      int result = speed - (nowTime - startTime);
      if (result < 0) {
        G.removePref('startTime');
        _timer?.cancel();
      }
      print('result: $result');
      setState(() {
        countDownTime = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print(G.getPref('startTime') != null);
    if (G.getPref('startTime') != null) {
      startTime = int.parse(G.getPref('startTime'));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Text(countDownTime <= 0
            ? "获取验证码"
            : countDownTime < 10 ? '0$countDownTime' + 'S' : '$countDownTime' + 'S', style: TextStyle(
              fontSize: G.setSp(30),
              color: !widget.disabled ? hex('#999') : hex('#333'),
              height: 1.5
            )),
        onTap: () {
          if (countDownTime > 0) return;
          if (!widget.disabled) return;
          countDown();
        },
      ),
      // padding: EdgeInsets.only(left: 10),
      // decoration: BoxDecoration(
      //     border: Border(left: BorderSide(color: Color(0xff999999), width: 1))),
    );
  }
}
