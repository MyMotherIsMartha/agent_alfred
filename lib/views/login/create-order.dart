import 'dart:async';
import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:fluwx/fluwx.dart';

class CreateOrderPage extends StatefulWidget {
  final String price;
  final String no;
  final String promotionNo;
  CreateOrderPage({this.price, this.no, this.promotionNo});
  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  Timer _timer;
  int _countdownTime = 0;
  int _orderOverTime = 0;
  String payType = 'ali';

  @override
  void initState() {
    super.initState();
    // orderInfoSubscription = eventBus.on<OrderInfoBus>().listen((event) {
    //   print(event.price);
    //   setState(() {
    //     price = event.price;
    //     giftPackageNo = event.giftPackageNo;
    //   });
    // });
    
    _register();
    _getOrderInfo();
  }

  _register() async {
    // bool result = await SyFlutterWechat.register('wx8d911664a4bc3963');
    
    registerWxApi(
        appId: EnvConfig.dev['wx-appid'],
        universalLink: "https://your.univerallink.com/link/");
    // print(result);
    var result = await FlutterAlipay.setIosUrlSchema('com.woouo.agent37.alipay');
    print(result);
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer?.cancel();
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
    countDown();
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
      if (result < 0) {
        _timer?.cancel();
        G.navigateTo(context, '/create-account', replace: true);
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
      return '剩余支付时间：$hour时$min分$sec秒';
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
      padding: EdgeInsets.all(G.setWidth(50)),
      decoration: BoxDecoration(
          color: hex('#fff'),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('选择支付方式',
                  style: TextStyle(fontSize: G.setSp(30), color: hex('#666'))),
              G.spacing(20),
              _payTypeItem('ali'),
              _payTypeItem('wechat'),
              _payTypeItem('downline'),
            ],
          ),
          Positioned(
            bottom: G.setHeight(50),
            child: VButton(
              width: 650,
              fn: () async {
                if (Validate.isNon(payType)) {
                  G.toast('请选择支付方式');
                  return;
                }
                Map data = {
                  'giftPackageNo': widget.no,
                  'giftPackagePromotionNo': widget.promotionNo
                };
                switch (payType) {
                  case 'ali':
                    var result = await OrderApi().aliPay(data);
                    print(result);
                    if (result.data['code'] != 200) return;
                    String payInfo = result.data['data'];
                    print(payInfo);
                    var result2 = await FlutterAlipay.pay(
                      payInfo,
                    );
                    // var result2 = await SyFlutterAlipay.pay(
                    //   payInfo,
                    //   urlScheme: '', //前面配置的urlScheme
                    //   isSandbox: true //是否是沙箱环境，只对android有效
                    // );
                    print(result2);
                    break;
                  case 'wechat':
                    var result = await OrderApi().wechatPay(data);
                    print(result);
                    if (result.data['code'] != 200) return;
                    var payInfo = result.data['data'];
                    print(payInfo['appid']);
                    // print(payInfo['appid']);
                    var result2 = await payWithWeChat(
                      appId: payInfo['appid'],
                      partnerId: payInfo['mch_id'],
                      prepayId: payInfo['prepay_id'],
                      packageValue: payInfo['_package'],
                      nonceStr: payInfo['nonce_str'],
                      timeStamp: int.parse(payInfo['timestamp']),
                      sign: payInfo['sign'],
                    );
                    print('result22222');
                    print(result2);
                    // SyPayResult payResult = await SyFlutterWechat.pay(
                    //   SyPayInfo.fromJson(payInfo));
                    // print('payResult');
                    // print(payResult);
                    break;
                  default:
                }

                // var result2 = await SyFlutterAlipay.pay(
                //     payInfo,
                //     // urlScheme: '你的ios urlScheme', //前面配置的urlScheme
                //     isSandbox: true //是否是沙箱环境，只对android有效
                // );
              },
              text: '确认支付',
            ),
          )
        ],
      ),
    );
  }

  Widget _payTypeItem(String type) {
    String icon;
    String title;
    switch (type) {
      case 'ali':
        icon = 'lib/assets/images/ali-pay_icon.png';
        title = '支付宝支付';
        break;
      case 'wechat':
        icon = 'lib/assets/images/wechat-pay_icon.png';
        title = '微信支付';
        break;
      case 'downline':
        icon = 'lib/assets/images/downline-pay_icon.png';
        title = '线下支付';
        break;
      default:
    }
    return InkWell(
        onTap: () {
          print(type);
          setState(() {
            payType = type;
          });
          if (type == 'downline') {
            G.navigateTo(
                context,
                '/certificate?no=' +
                    widget.no +
                    '&time=' +
                    _countdownTime.toString());
          }
        },
        child: Container(
          height: G.setHeight(120),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Image.asset(icon,
                        width: G.setWidth(60), height: G.setHeight(60)),
                    Container(
                      width: G.setWidth(30),
                    ),
                    Text(title,
                        style: TextStyle(
                            fontSize: G.setSp(32), color: hex('#333'))),
                  ],
                ),
              ),
              Container(
                height: G.setHeight(100),
                width: G.setWidth(100),
                alignment: Alignment.center,
                child: type == 'downline'
                    ? iconarrow()
                    : Icon(
                        payType == type
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        size: G.setSp(50),
                        color: payType == type ? hex('#333') : hex('#999'),
                      ),
              )
            ],
          ),
        ));
  }
}
