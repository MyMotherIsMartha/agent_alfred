import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/resttime.dart';
import 'package:agent37_flutter/views/home/home.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// 资格任务细则
class FinePointPage extends StatefulWidget {
  @override
  _FinePointPageState createState() => _FinePointPageState();
}

class _FinePointPageState extends State<FinePointPage> {
  FinePrintModel orderinfo;
  var futureRes;

  Future _getorderinfo() async {
    var result = await MemberApi().checkOrderRecords();
    if (result.data['data'] != null) {
      print(result.data['data']);
      setState(() {
        orderinfo = finePrintModelFromJson(result.data['data']);
      });
    }
    return 'feture end';
  }

  Widget _head() {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: G.setWidth(20), vertical: G.setHeight(20)),
        decoration: BoxDecoration(
            color: hex('#FFF'),
            borderRadius: BorderRadius.circular(G.setWidth(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('资格任务',
                        style: TextStyle(
                            color: hex('#333'), fontSize: G.setSp(30), fontWeight: FontWeight.bold)),
                    G.spacing(15),
                    Text(
                              orderinfo.checkStatus == 1
                                  ? '考核时间已过期，未完成考核无法获得服务费'
                                  : '距结束：${restTime(orderinfo.checkEndTime)}',
                              style: TextStyle(
                                  fontSize: G.setSp(26),
                                  color: hex('#686868'))),
                  ],
                ),
                orderinfo.checkStatus == 1
                ? InkWell(
                  onTap: () {
                    yyAlertDialog(context);
                  },
                  child: Container(
                    width: G.setWidth(144),
                    height: G.setHeight(44),
                    decoration: BoxDecoration(
                        color: hex('#E8B469'),
                        borderRadius: BorderRadius.circular(G.setWidth(50))),
                    child: Text('申请延迟',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: G.setSp(24),
                          color: hex('#FFF'),
                          height: 44 / 24,
                        )),
                  ),
                )
                : Container(),
              ],
            ),
            G.spacing(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('开通企业会员'),
                Row(
                  children: <Widget>[
                    Container(
                      width: G.setWidth(290),
                      height: G.setHeight(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: hex('#6982FF')),
                          borderRadius: BorderRadius.circular(7.5)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation(hex('#6982FF')),
                        value: orderinfo.openedDiamondMemberNum / orderinfo.checkDiamondMemberNum,
                      ),
                    ),
                    G.spacing(15, dir: 'x'),
                    Text('${orderinfo.openedDiamondMemberNum} / ${orderinfo.checkDiamondMemberNum}',
                        style: TextStyle(
                            fontSize: G.setSp(30), color: hex('#424242'))),
                    G.spacing(10, dir: 'x'),
                    orderinfo.openedDiamondMemberNum / orderinfo.checkDiamondMemberNum == 1
                    ? iconcheck(color: hex('#6982FF'), size: G.setWidth(30))
                    : Container()
                  ],
                ),
              ],
            ),
            G.spacing(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('企业会员有效订单'),
                Row(
                  children: <Widget>[
                    Container(
                      width: G.setWidth(290),
                      height: G.setHeight(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: hex('#6982FF')),
                          borderRadius: BorderRadius.circular(7.5)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation(hex('#6982FF')),
                        value: orderinfo.effectiveOrderNum / orderinfo.checkEffectiveOrderNum,
                      ),
                    ),
                    G.spacing(15, dir: 'x'),
                    Text('${orderinfo.effectiveOrderNum} / ${orderinfo.checkEffectiveOrderNum}',
                        style: TextStyle(
                            fontSize: G.setSp(30), color: hex('#424242'))),
                    G.spacing(10, dir: 'x'),
                    orderinfo.effectiveOrderNum / orderinfo.checkEffectiveOrderNum == 1
                    ? iconcheck(color: hex('#6982FF'), size: G.setWidth(30))
                    : Container()
                  ],
                ),
              ],
            )
          ],
        ));
  }

  Widget _rules() {
    return Container(
      width: G.setWidth(710),
      margin: EdgeInsets.symmetric(vertical: G.setHeight(20)),
      padding: EdgeInsets.symmetric(
          vertical: G.setHeight(20), horizontal: G.setWidth(20)),
      decoration: BoxDecoration(
          color: hex('#FFF'),
          borderRadius: BorderRadius.circular(G.setWidth(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('考核细则',
              style: TextStyle(fontSize: G.setSp(30), color: hex('#424242'), fontWeight: FontWeight.bold)),
          G.spacing(15),
          Text('1）自审核通过起，${orderinfo.checkDays}天内在名下开通${orderinfo.checkDiamondMemberNum}个企业会员，且名下至少${orderinfo.checkEffectiveOrderNum}个企业会员有产生有效订单；',
              style: TextStyle(fontSize: G.setSp(26), color: hex('#434343'))),
          Text('2）未在倒计时内完成任务，前${orderinfo.checkDiamondMemberNum}个企业会员服务费减半；',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: G.setSp(26), color: hex('#434343'))),
          Text('3）考核通过后才可获得服务费。',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: G.setSp(26), color: hex('#434343'))),
        ],
      ),
    );
  }

  TextStyle subStyle() {
    return TextStyle(fontSize: G.setSp(26), color: hex('#434343'));
  }

  Widget _equity() {
    return Container(
      width: G.setWidth(710),
      padding: EdgeInsets.symmetric(
          vertical: G.setHeight(20), horizontal: G.setWidth(20)),
      decoration: BoxDecoration(
          color: hex('#FFF'),
          borderRadius: BorderRadius.circular(G.setWidth(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('代理商权益',
              style: TextStyle(fontSize: G.setSp(30), color: hex('#424242'), fontWeight: FontWeight.bold)),
          G.spacing(15),
          Text('1、代理豪礼：精选好物，豪华大礼；', style: subStyle()),
          Text('2、无限分享：标准版会员，无限数量分享；', style: subStyle()),
          Text('3、推荐奖励：推荐有回报，分享赚不停；', style: subStyle()),
          Text('4、服务奖励：可享会员采购额分佣；', style: subStyle()),
          Text('5、培训支持：尊享总部专业订制，落地策划、培训服务；', style: subStyle()),
          Text('6、营销策划：总部一对一，落地策划指导服务；', style: subStyle()),
          Text('7、成交支持：总部成交支持，助力会员成功。', style: subStyle()),
        ],
      ),
    );
  }
/* 
1、代理豪礼：精选好物，豪华大礼；





 */
  @override
  void initState() {
    super.initState();
    futureRes = _getorderinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        title: Text('资格任务细则'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: futureRes,
        builder: (context, shatshot) {
          if (shatshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(G.setWidth(20)),
                child: Column(
                  children: <Widget>[_head(), _rules(), _equity()],
                ),
              ),
            );
          } else {
            return VLoading();
          }
        },
      ),
    );
  }
}

FinePrintModel finePrintModelFromJson(Map data) => FinePrintModel.fromJson(data);

String finePrintModelToJson(FinePrintModel data) => json.encode(data.toJson());

class FinePrintModel {
    int checkEndTime;
    int openedDiamondMemberNum;
    int checkDiamondMemberNum;
    int effectiveOrderNum;
    int checkEffectiveOrderNum;
    int checkDays;
    int checkStatus;

    FinePrintModel({
        this.checkEndTime,
        this.openedDiamondMemberNum,
        this.checkDiamondMemberNum,
        this.effectiveOrderNum,
        this.checkEffectiveOrderNum,
        this.checkDays,
        this.checkStatus
    });

    factory FinePrintModel.fromJson(Map<String, dynamic> json) => FinePrintModel(
        checkEndTime: json["checkEndTime"],
        openedDiamondMemberNum: json["openedDiamondMemberNum"],
        checkDiamondMemberNum: json["checkDiamondMemberNum"],
        effectiveOrderNum: json["effectiveOrderNum"],
        checkEffectiveOrderNum: json["checkEffectiveOrderNum"],
        checkDays: json["checkDays"],
        checkStatus: json["checkStatus"],
    );

    Map<String, dynamic> toJson() => {
        "checkEndTime": checkEndTime,
        "openedDiamondMemberNum": openedDiamondMemberNum,
        "checkDiamondMemberNum": checkDiamondMemberNum,
        "effectiveOrderNum": effectiveOrderNum,
        "checkEffectiveOrderNum": checkEffectiveOrderNum,
        "checkDays": checkDays,
        "checkStatus": checkStatus,
    };
}
