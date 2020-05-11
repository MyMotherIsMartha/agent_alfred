import 'dart:async';
import 'package:agent37_flutter/provide/common.dart';
import 'package:agent37_flutter/utils/event_bus.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/global.dart';

class VTimerBtn extends StatefulWidget {
  final bool disabled;
  final String color;
  final Function cb;
  VTimerBtn(this.disabled, this.cb, {this.color});
  
  @override
  _VTimerBtnState createState() => _VTimerBtnState();
}

class _VTimerBtnState extends State<VTimerBtn> {
  StreamSubscription timerSubscription;
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
      setState(() {
        countDownTime = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timerSubscription = eventBus.on<TimerClearBus>().listen((event) {
      setState(() {
        countDownTime = 0;
      });
      G.removePref('startTime');
      _timer?.cancel();
    });
    if (G.getPref('startTime') != null) {
      startTime = int.parse(G.getPref('startTime'));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    //取消订阅
    timerSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Opacity(
          opacity: widget.disabled ? .5 : 1,
          child: Text(countDownTime <= 0
            ? "获取验证码"
            : countDownTime < 10 ? '0$countDownTime' + 'S' : '$countDownTime' + 'S', style: TextStyle(
              fontSize: G.setSp(30),
              // color: widget.color != null ? hex(widget.color):  hex('#333'),
              color: hex('#6982FF'),
              height: 1.5,
              fontWeight: FontWeight.w500
            )),
        ),
        onTap: () async {
          if (countDownTime > 0) return;
          if (widget.disabled) return;
          G.showLoading(context);
          var result = await widget.cb();
          G.closeLoading();
          if (result.data['code'] == 200) {
            G.toast('验证码已发送');
            countDown();
          } else {
            print(result.data['code']);
          }
        },
      ),
      // padding: EdgeInsets.only(left: 10),
      // decoration: BoxDecoration(
      //     border: Border(left: BorderSide(color: Color(0xff999999), width: 1))),
    );
  }
}
