import 'dart:async';

import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/models/gift-packages.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/login/components/gift-item.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class CertificatePage extends StatefulWidget {
  final String no;
  final String time;
  CertificatePage({this.no, this.time});
  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  GiftPackagesModel curGift;
  Timer _timer;
  int _countdownTime;
  @override
  void initState() {
    super.initState();
    setState(() {
      _countdownTime = int.parse(widget.time);
    });
    startCountdownTimer();
    // _getGiftList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        title: Text('线下凭证上传'),
        centerTitle: true,
      ),
      body: Container(
        // padding: G.setWidth(20),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: _getGiftList(),
              builder: (context, shapshot) {
                if (shapshot.hasData && curGift != null) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
                    child: GiftItem(item: curGift),
                  );
                } else {
                  return VLoading();
                }
              },
            ),
            Text(_clock(_countdownTime))
          ],
        ),
      ),
    );
  }

  Future _getGiftList() async {
    var result = await MemberApi().giftpackage();
    if (result.data['code'] == 200 && result.data['data'] != null) {
      result.data['data'].forEach((item) {
        GiftPackagesModel gift = GiftPackagesModel.fromJson(item);
        if (gift.giftPackageNo == widget.no && curGift == null) {
          setState(() {
            curGift = gift;
          });
        }
      });
      return 'end';
    }
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

  String _clock(int restTime) {
    if (restTime != null) {
      int hour = (restTime / 3600).floor();
      int min = restTime % 3600 ~/ 60;
      int sec = restTime % 60;
      return '剩余支付时间：${hour}时${min}分${sec}秒';
    }
    return '';
  }
}
