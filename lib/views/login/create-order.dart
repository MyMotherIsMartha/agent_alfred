import 'dart:async';
import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:fluwx/fluwx.dart';
import 'package:tobias/tobias.dart';

class CreateOrderPage extends StatefulWidget {
  final String price;
  final String no;
  final String promotionNo;
  CreateOrderPage({this.price, this.no, this.promotionNo});
  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> with WidgetsBindingObserver{
  Timer _timer;
  int _countdownTime = 0;
  int _orderOverTime = 0;
  String payType = 'ali';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("--" + state.toString() + '大师法第三方士大夫发');
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      if (AppLifecycleState.resumed == state) {
        var orderResult = await OrderApi().orderQuery();
        print(orderResult);
        if (orderResult.data['data'] != null && orderResult.data['data'] == true) {
          G.closeLoading();
          G.toast('支付成功');
          G.navigateTo(context, '/uploadEnterPrisePic', replace: true);
        }
      }
    }
    
    // switch (state) {
    //   case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
    //     break;
    //   case AppLifecycleState.resumed:// 应用程序可见，前台
    //     break;
    //   case AppLifecycleState.paused: // 应用程序不可见，后台
    //     break;
    // }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
        appId: EnvConfig.dev()['wx-appid'],
        universalLink: "https://agent37app.woouo.com");
    // print(result);
    // var result = await FlutterAlipay.setIosUrlSchema('com.woouo.agent37.alipay');
    // print(result);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
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
    var result = await OrderApi().getGiftPackageOrders(
      giftPackageNo: widget.no,
      giftPackagePromotionNo: widget.promotionNo
    );
    setState(() {
      _orderOverTime = result.data['data']['orderOverime'];
    });
    G.setPref('orderOverTime', result.data['data']['orderOverime'].toString());
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
        G.removePref('orderOverTime');
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
    return '剩余支付时间：计算中……';
  }

  // void startCountdownTimer() {
  //   const oneSec = const Duration(seconds: 1);

  //   var callback = (timer) {
  //     return setState(() {
  //       if (_countdownTime < 1) {
  //         _timer.cancel();
  //       } else {
  //         _countdownTime = _countdownTime - 1;
  //       }
  //     });
  //   };

  //   _timer = Timer.periodic(oneSec, callback);
  // }

  void getOrderResult() {
    print('12341232');
    int count = 0;
    const period = const Duration(seconds: 1);
    Timer.periodic(period, (timer) async {
      G.showLoading(context);
      var orderResult = await OrderApi().orderQuery();
      var flag = orderResult.data['data'];
      if (flag != null && flag == true) {
        timer.cancel();
        timer = null;
        G.closeLoading();
        G.toast('支付成功');
        G.navigateTo(context, '/uploadEnterPrisePic', replace: true);
      } else {
        count++;
        if (count >= 5) {
          G.closeLoading();
          //取消定时器，避免无限回调
          timer.cancel();
          timer = null;
        }
      }
    });
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
                    if (result.data['code'] != 200) return;
                    String payInfo = result.data['data'];
                    try {
                      const evn = EnvConfig.env == 'uat' ? AliPayEvn.ONLINE : AliPayEvn.SANDBOX;
                      // 根据环境确定是什么模式  目前是沙箱
                      var res = await aliPay(payInfo, evn: evn);
                      if (res['resultStatus'] == "9000") {
                        // G.toast('支付成功');
                        // G.navigateTo(context, '/uploadEnterPrisePic', replace: true);
                        getOrderResult();
                      } else {
                         G.toast('支付宝支付失败');
                      }
                    } on Exception catch (e) {
                      print(e);
                      G.toast('支付宝支付失败');
                    }
                    
                    // isAliPayInstalled().then((data){
                    //   print("installed $data");
                    // });
                    // TODO::
                    // var result2 = await FlutterAlipay.pay(
                    //   payInfo,
                    // );
                    // var result2 = await SyFlutterAlipay.pay(
                    //   payInfo,
                    //   urlScheme: '', //前面配置的urlScheme
                    //   isSandbox: true //是否是沙箱环境，只对android有效
                    // );
                    // print(result2);
                    break;
                  case 'wechat':
                    G.showLoading(context);
                    var result = await OrderApi().wechatPay(data);
                    G.closeLoading();
                    if (result.data['code'] != 200) return;
                    var payInfo = result.data['data'];
                    if (result.data['data']['result_code'] == 'FAIL') {
                      G.toast(result.data['data']['err_code_des']);
                      return;
                    }
                    print(payInfo['appid']);
                    // print(payInfo['appid']);
                    weChatResponseEventHandler.listen((res) {
                      G.closeLoading();
                      if (res is WeChatPaymentResponse) {
                        int code = res.errCode;
                        switch (code) {
                          case -2:
                            G.toast('已取消支付');
                            break;
                          case 0:
                            getOrderResult();
                            // G.toast('支付成功');
                            // G.navigateTo(context, '/uploadEnterPrisePic', replace: true);
                            // Provider.of<UserProvide>(context).updateUserAuth();
                            break;
                          default:
                            G.toast('支付失败，请重试');
                        }
                          // do something here
                      }
                    });
                    
                    var result2 = await payWithWeChat(
                      appId: payInfo['appid'],
                      partnerId: payInfo['mch_id'],
                      prepayId: payInfo['prepay_id'],
                      packageValue: payInfo['_package'],
                      nonceStr: payInfo['nonce_str'],
                      timeStamp: int.parse(payInfo['timestamp']),
                      sign: payInfo['sign'],
                    );
                    print(result2);
                    print('result2');
                    if (!result2) {
                      G.closeLoading();
                    }
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
          setState(() {
            payType = type;
          });
          if (type == 'downline') {
            setState(() {
              payType = 'ali';
            });
            G.navigateTo(
                context,
                '/certificate?no=' + widget.no + '&from=order');
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
