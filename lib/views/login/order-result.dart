import 'dart:async';

import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/models/user-auth.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:provider/provider.dart';

class OrderResultPage extends StatefulWidget {
  @override
  _OrderResultPageState createState() => _OrderResultPageState();
}

class _OrderResultPageState extends State<OrderResultPage> {
  UserAuthModel userinfoAuth;
  String giftPackageNo;

  Map<String, dynamic> statusMap = {
    //  支付成功
    'paySuccess': {
      'title': '凭证上传成功',
      'pic': 'lib/assets/images/order-result/upload-success.png',
      'subtitle': '支付凭证上传成功',
      'desc': '待财务审核凭证，请耐心等待',
      'btn': '刷新',
      'fn': () {
        Provider.of<UserProvide>(G.currentContext).updateUserAuth();
      },
    },
    'uploadSuccess': {
      'title': '凭证上传成功',
      'pic': 'lib/assets/images/order-result/upload-success.png',
      'subtitle': '支付凭证上传成功',
      'desc': '待财务审核凭证，请耐心等待',
      'btn': '刷新',
      'fn': () {
        Provider.of<UserProvide>(G.currentContext).updateUserAuth(transition: TransitionType.fadeIn);
      },
    },
    'verifySuccess': {
      'title': '审核通过',
      'pic': 'lib/assets/images/order-result/verify-success.png',
      'subtitle': '审核通过',
      'desc': '请尽快填写企业信息，逾期将影响审核进度和礼包发放',
      'btn': '填写企业信息',
      'fn': () {
        G.navigateTo(G.currentContext, '/uploadEnterPrisePic');
      },
    },
    'verifyFail': {
      'title': '审核未通过',
      'pic': 'lib/assets/images/order-result/verify-fail.png',
      'subtitle': '审核未通过',
      'desc': '你的支付凭证未通过，请在x小时内完成上传。',
      'btn': '重传支付凭证',
      'fn': (String no) {
        G.navigateTo(
                G.currentContext,
                '/certificate?no=' + no + '&from=order');
      },
    },
    'verifyOvertime': {
      'title': '审核超时',
      'pic': 'lib/assets/images/order-result/verify-fail.png',
      'subtitle': '审核未通过',
      'desc': '你的支付凭证未通过，请在x小时内完成上传。',
      'btn': '重传支付凭证',
      'fn': () {
        G.navigateTo(G.currentContext, '/create-account');
      },
    },
  };

  void goCer() {
    G.navigateTo(
                G.currentContext,
                '/certificate?no=' + giftPackageNo + '&from=order');
  }
  
  void _getOrderInfo() async {
    var result = await OrderApi().getGiftPackageOrders();
    var orderOverHours = result.data['data']['overtimePeriodHours'];
    setState(() {
      statusMap['verifyFail']['desc'] = '你的支付凭证未通过，请在$orderOverHours小时内完成上传。';
      giftPackageNo = result.data['data']['giftPackageNo'];
    });
  }

  Widget statusWidget(String type) {
    Map status = statusMap[type];
    List<String> refund;
    String reason;
    String remark;
    if (type == 'verifyFail') {
      refund = (userinfoAuth.voucherRefuseReason??'').split('##');
      print(refund);
      print('拒绝');
      reason = refund[1];
      remark = refund[0];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: G.setWidth(350),
          height: G.setWidth(350),
          margin: EdgeInsets.only(top: G.setHeight(100)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(status['pic']),
              fit: BoxFit.contain,
            ),
          ),
        ),
        G.spacing(G.setHeight(50)),
        Text(status['subtitle'],
            style: TextStyle(
                color: hex('#000'),
                fontWeight: FontWeight.w500,
                fontSize: G.setSp(32))),
        G.spacing(G.setHeight(10)),
        Text(
          status['desc'],
          style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),
        ),
        type == 'verifyFail'
            ? verifyFailMsg()
            // Text('拒绝原因：' + reason??'',
            //     style: TextStyle(
            //         color: hex('#666'),
            //         fontSize: G.setSp(28)))
            : Container(),
        G.spacing(G.setHeight(120)),
        VButton(
          width: 400,
          text: status['btn'],
          fn: () {
            if (type == 'verifyFail') {
              print(giftPackageNo);
              // G.navigateTo(G.currentContext, '/create-account');
              // G.navigateTo(
              //   G.currentContext,
              //   '/certificate?no=' + giftPackageNo + '&from=order');
              status['fn'](giftPackageNo);
            } else {
              print('审核不是失败');
              status['fn']();
            }
          },
        )
      ],
    );
  }

  Widget verifyFailMsg() {
    String str = userinfoAuth.voucherRefuseReason??'';
    List<String> strList = str.split('##');
    return Container(
      child: Column(
        children: <Widget>[
          // Text(strList[1]??'',
          //       style: TextStyle(
          //           color: hex('#666'),
          //           fontSize: G.setSp(28))),
          Text('拒绝原因：' + strList[1]??'',
                style: TextStyle(
                    color: hex('#666'),
                    fontSize: G.setSp(28))),
          G.spacing(10),
          Container(
            constraints: BoxConstraints(
              maxHeight: G.setWidth(610)
            ),
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(20), vertical: G.setWidth(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: hex('#f3f4f6')
            ),
            child: Text('备注：' + strList[0], style: TextStyle(
              fontSize: G.setSp(24),
              color: hex('#666')
            ), ),
          )
          
        ],
      ),
    );
  }

  Widget getCurrentWidget(int status) {
    List<String> statusMap = ['uploadSuccess', 'uploadSuccess', 'verifySuccess', 'verifyFail', 'verifyOvertime'];
    return statusWidget(statusMap[status]);
  }

  String _getTitle(BuildContext context) {
    int status = userinfoAuth.voucherStatus;
    String title;
    switch (status) {
      case 0:
        title = '等待凭证上传';
        break;
      case 2:
        title = '凭证审核通过';
        break;
      case 1:
        title = '凭证上传成功';
        break;
      case 3:
        title = '审核未通过';
        break;
      case 4:
        title = '审核超时';
        break;
      default:
    }
    return title;
  }

  @override
  void initState() {
    super.initState();
    userinfoAuth = Provider.of<UserProvide>(context, listen: false).userAuthInfo;
    _getOrderInfo();
  }

  @override
  Widget build(BuildContext context) {
    G.setContext(context);
    return Scaffold(
        body: Container(
      color: hex('#F3F4F6'),
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: G.setHeight(59)),
              height: G.setHeight(278),
              decoration: BoxDecoration(
                  // 边色与边宽度
                  gradient: LinearGradient(
                      colors: [hex('#685AFF'), hex('#69A5FF')],
                      begin: FractionalOffset(0, 1),
                      end: FractionalOffset(1, 0)),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(120, 40)))),
          AppBar(
            brightness: Brightness.dark,
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: Container(),
            iconTheme: IconThemeData(color: hex('#E7D1A8')),
            title: Text(
              _getTitle(context),
              style: TextStyle(color: hex('#fff'), fontSize: G.setSp(36)),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    G.logout(context);
                  },
                  child: Text('退出',
                      style:
                          TextStyle(color: hex('#fff'), fontSize: G.setSp(32))))
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                left: G.setWidth(50),
                right: G.setWidth(50),
                top: G.setHeight(184)),
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(50)),
            decoration: BoxDecoration(
              color: hex('#fff'),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            height: G.setHeight(900),
            child: getCurrentWidget(userinfoAuth.voucherStatus),
          ),
        ],
      ),
    ));
  }
}
