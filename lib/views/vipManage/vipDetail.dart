import 'dart:async';

import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:color_dart/hex_color.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';

class VipDetail extends StatefulWidget {
  final String vipId;
  final String role;
  VipDetail({this.vipId, this.role});

  @override
  _VipDetailState createState() => _VipDetailState();
}

class _VipDetailState extends State<VipDetail> 
 with SingleTickerProviderStateMixin{
  TabController _tabController;
  ScrollController scrollController;
  List tabs = [
    {'value': 1, 'label': '待结算服务费'},
    {'value': 2, 'label': '已结算服务费'}
  ];
  List bodys;
  String currentRole;
  String currentMemberId;
  String mainTextColor = '#333333';
  String _enterpriseName = '';
  double _pengdingCharge = 0;
  double _entryCharge = 0;
  double _totalCharge = 0;

  

  @override
  void initState() {
    super.initState();
    // 创建Controller  
    scrollController = ScrollController();
    _tabController = TabController(length: tabs.length, vsync: this);
    print('test role:');
    print(widget.role);
    currentRole = widget.role;
    mainTextColor = widget.role == '1' ? '#333333' : '#FFE8A7';
    currentMemberId = widget.vipId;

    _getInfo();
  }

  void _getInfo() async{
    var result = await OrderApi().getAppMemberDetail(currentMemberId);
    Map resultData = result.data['data'];
    setState(() {
      _enterpriseName = resultData['enterpriseName'] ?? '';
      _pengdingCharge = resultData['pendingPurchaseOrderServiceCharge'];
      _entryCharge = resultData['entryPurchaseOrderServiceCharge'];
      _totalCharge = _pengdingCharge + _entryCharge;
      print('object');
      print(resultData);
    });
    
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("会员采购订单"),
        centerTitle: true,
      ),
      backgroundColor: hex('#F3F4F6'),
      body: Column(
        children: <Widget>[
          Container(
            width: G.setWidth(750),
            padding: EdgeInsets.all(G.setWidth(20)),
            child: Container(
              height: G.setWidth(360),
              padding: EdgeInsets.fromLTRB(G.setWidth(30), G.setWidth(30), G.setWidth(80), G.setWidth(30)),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(currentRole == '1' ? "lib/assets/images/vip/bg1.png" : "lib/assets/images/vip/bg2.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(children: [
                Row(children: [
                  Image(width: G.setWidth(80), height: G.setWidth(80),image: AssetImage(currentRole == '1' ? 'lib/assets/images/vip/diamond.png' : 'lib/assets/images/vip/diamond2.png')),
                  G.spacingWidth(20),
                  Container(
                    width: G.setWidth(500),
                    child: Text(_enterpriseName, 
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w500, color: hex(mainTextColor)))
                  )
                ]),
                G.spacing(30),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: '预估总服务费:  ￥',
                        style: TextStyle(
                          fontSize: G.setSp(24),
                          color: hex(mainTextColor)
                        )
                      ),
                      TextSpan(
                        text: _totalCharge.toStringAsFixed(2).split('.')[0],
                        style: TextStyle(
                          fontSize: G.setSp(30),
                          fontWeight: FontWeight.w500,
                          color: hex(mainTextColor)
                        )
                      ),
                      TextSpan(
                        text: '.' + _totalCharge.toStringAsFixed(2).split('.')[1],
                        style: TextStyle(
                          fontSize: G.setSp(24),
                          color: hex(mainTextColor)
                        )
                      )
                    ]
                )),
                G.spacing(15),
                FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      height: G.setHeight(12),
                      decoration: BoxDecoration(
                        color: hex('#A08857'),
                        borderRadius: BorderRadius.circular(G.setHeight(6)),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.topLeft,
                        widthFactor: _totalCharge <= 0 ? 0 : _pengdingCharge / _totalCharge,
                        child: Container(
                          decoration: BoxDecoration(
                            color: hex(mainTextColor),
                            borderRadius: BorderRadius.circular(G.setHeight(6)),
                          ),
                        )
                      )
                    ),
                ),
                G.spacing(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                    Text('待结算服务费',style: TextStyle(
                      fontSize: G.setSp(24),
                      color: hex(mainTextColor),
                    )),
                    G.spacing(10),
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: '￥',
                          style: TextStyle(
                            fontSize: G.setSp(24),
                            color: hex(mainTextColor)
                          )
                        ),
                        TextSpan(
                          text: _pengdingCharge.toStringAsFixed(2).split('.')[0],
                          style: TextStyle(
                            fontSize: G.setSp(30),
                            color: hex(mainTextColor),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: '.' + _pengdingCharge.toStringAsFixed(2).split('.')[1],
                          style: TextStyle(
                            fontSize: G.setSp(24),
                            color: hex(mainTextColor)
                          )
                        )
                      ]
                    ))
                  ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
                    Text('已结算服务费', style: TextStyle(
                      fontSize: G.setSp(24),
                      color: hex(mainTextColor),
                    )),
                    G.spacing(10),
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: '￥',
                          style: TextStyle(
                            fontSize: G.setSp(24),
                            color: hex(mainTextColor)
                          )
                        ),
                        TextSpan(
                          text: _entryCharge.toStringAsFixed(2).split('.')[0],
                          style: TextStyle(
                            fontSize: G.setSp(30),
                            color: hex(mainTextColor),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: '.' + _entryCharge.toStringAsFixed(2).split('.')[1],
                          style: TextStyle(
                            fontSize: G.setSp(24),
                            color: hex(mainTextColor)
                          )
                        )
                      ]
                    ))
                  ])
                ])
              ]),
            )
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e['label'])).toList()
            )
          ),
          Expanded(
            child: TabBarView(
            controller: _tabController,
            children: tabs.map((item) {
              return ServiceList(status: item['value'], currentMemberId: currentMemberId,);
            }).toList()),
          ) 
        ],
      ),
    );
  }
}


class ServiceList extends StatefulWidget {
  final int status;
  final String currentMemberId;
  ServiceList({this.status, this.currentMemberId});

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  static List waitServiceAry = [1, 2, 3, 4];
  EasyRefreshController _refreshController = EasyRefreshController();
  int currentStatus;
  int total = waitServiceAry.length;
  int pageNo = 1;
  List _listData = [];

  Future _getList(refresh) async {
    if (refresh) {
      _refreshController?.finishLoad(success: true, noMore: false);
      pageNo = 1;
     
      setState(() {
        _listData = [];
      });
    } else {
      ++pageNo;
    }
    if (_listData.length == total && !refresh) {
      _refreshController.finishLoad(success: true, noMore: true);
      return null;
    }
    var params = {
      'memberId': widget.currentMemberId,
      'pageNo': pageNo,
      'pageSize': 10,
      'settleStatus': currentStatus
    };
    void _api() async {
      var result = await OrderApi().getAppMemberCommissions(params);
      print(result);
      Map resultData = result.data['data'];
      // VipResultModel resultData = VipResultModel.fromJson(originalData);
      if (resultData == null) return;
      print(resultData);
      if (refresh) {
        setState(() {
          total = resultData['total'];
          _listData = resultData['records'];
        });
      } else {
        total = resultData['total'];
        _listData.addAll(resultData['records']);
      }
    }

    _api();
  }

  @override
  void initState() { 
    super.initState();
    currentStatus = widget.status;
    _getList(true);  
  }

  Widget serviceItem(item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: hex('#FFF')
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(item['orderNo']),
          Text(G.formatTime(item['payTime']), style: TextStyle(color: hex('#999'), fontSize: G.setSp(24)),)
        ]),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '￥',
                style: TextStyle(
                  fontSize: G.setSp(24)
                )
              ),
              TextSpan(
                text: item['commission'].toStringAsFixed(2).split('.')[0],
                style: TextStyle(
                  fontSize: G.setSp(30),
                  color: hex('#333'),
                  fontWeight: FontWeight.w600
                )
              ),
              TextSpan(
                text: '.' + item['commission'].toStringAsFixed(2).split('.')[1],
                style: TextStyle(
                  fontSize: G.setSp(24)
                )
              )
            ]
        )),
      ],),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: hex('#FFF'),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
      child: _listData.length > 0
        ? EasyRefresh(
            controller: _refreshController,
            header: vRefreshHeader,
            footer: vRefreshFooter,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(
                      height: G.setHeight(20),
                      color: Colors.transparent,
                    ),
                itemCount: _listData.length,
                itemBuilder: (context, index) {
                  return serviceItem(_listData[index]);
                }),
            onRefresh: () async {
              _getList(true);
            },
            onLoad: () async {
              _getList(false);
            },
          )
        : Container(
            margin: EdgeInsets.only(top: G.setWidth(200)),
            child: VEmpty(hintText: '暂无任何数据哦~'),
          ),
    );
  }
}