import 'dart:async';

import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';

class VipDetail extends StatefulWidget {
  final String vipId;
  VipDetail({this.vipId});

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
  int tabIndex = 0;
  List bodys;
  String currentMemberId;
  String _enterpriseName;
  double _pengdingCharge;
  double _entryCharge;
  double _totalCharge;

  Future _getInfo() async{
    var result = await OrderApi().getAppMemberDetail(currentMemberId);
    Map resultData = result.data['data'];
    _enterpriseName = resultData['enterpriseName'] ?? '';
    _pengdingCharge = resultData['pendingPurchaseOrderServiceCharge'];
    _entryCharge = resultData['entryPurchaseOrderServiceCharge'];
    _totalCharge = _pengdingCharge + _entryCharge;
    print('object');
    print(_totalCharge);
  }

  @override
  void initState() {
    super.initState();
    // 创建Controller  
    scrollController = ScrollController();
    _tabController = TabController(length: tabs.length, vsync: this)
    ..addListener(() {
      if(_tabController.indexIsChanging){
        setState(() {
          tabIndex = _tabController.index;
        });
      }
    });

    currentMemberId = widget.vipId;

    _getInfo();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.vipId);

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
                  image: AssetImage("lib/assets/images/vip/bg1.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(children: [
                Row(children: [
                  Image(width: G.setWidth(80), height: G.setWidth(80),image: AssetImage('lib/assets/images/vip/diamond.png')),
                  G.spacingWidth(20),
                  Text(_enterpriseName, style: TextStyle(fontWeight: FontWeight.w500))
                ]),
                G.spacing(30),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: '预估总服务费:  ￥',
                        style: TextStyle(
                          fontSize: G.setSp(24)
                        )
                      ),
                      TextSpan(
                        text: _totalCharge.toString().split('.')[0],
                        style: TextStyle(
                          fontSize: G.setSp(30),
                          color: hex('#333'),
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextSpan(
                        text: '.' + _totalCharge.toString().split('.')[1],
                        style: TextStyle(
                          fontSize: G.setSp(24)
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
                            color: hex('#333'),
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
                      fontSize: G.setSp(24)
                    )),
                    G.spacing(10),
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: '￥',
                          style: TextStyle(
                            fontSize: G.setSp(24)
                          )
                        ),
                        TextSpan(
                          text: _pengdingCharge.toString().split('.')[0],
                          style: TextStyle(
                            fontSize: G.setSp(30),
                            color: hex('#333'),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: '.' + _pengdingCharge.toString().split('.')[1],
                          style: TextStyle(
                            fontSize: G.setSp(24)
                          )
                        )
                      ]
                    ))
                  ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
                    Text('已结算服务费', style: TextStyle(
                      fontSize: G.setSp(24)
                    )),
                    G.spacing(10),
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: '￥',
                          style: TextStyle(
                            fontSize: G.setSp(24)
                          )
                        ),
                        TextSpan(
                          text: _entryCharge.toString().split('.')[0],
                          style: TextStyle(
                            fontSize: G.setSp(30),
                            color: hex('#333'),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: '.' + _entryCharge.toString().split('.')[1],
                          style: TextStyle(
                            fontSize: G.setSp(24)
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
              return ServiceList(status: item['value']);
            }).toList()),
          )
          // Container(
          //   child: IndexedStack(index: tabIndex, children: bodys),
          // )
        ],
      ),
    );
  }
}


class ServiceList extends StatefulWidget {
  final int status;
  ServiceList({this.status});

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  static List waitServiceAry = [1, 2, 3, 4];
  static List alreadyServiceAry = [5, 6, 7, 8];
  EasyRefreshController _refreshController = EasyRefreshController();
  int currentStatus;
  int total = waitServiceAry.length;
  int pageNo = 1;
  List _listData = [];

  Future _getList(refresh) async {
    if (_listData.length == total && !refresh) {
      G.toast('已加载全部');
      _refreshController.finishLoad(success: true, noMore: true);
      return null;
    }
    var params = {
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
      setState(() {
        total = resultData['total'];
      });
      if (refresh) {
        setState(() {
          _listData = resultData['records'];
        });
      } else {
        _listData.addAll(resultData['records']);
      }
    }

    setState(() {
      pageNo = refresh ? 1 : pageNo + 1;
    });

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
          Text('test'),
          Text('2018-05-06 14:20', style: TextStyle(color: hex('#999'), fontSize: G.setSp(24)),)
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
                text: '9999',
                style: TextStyle(
                  fontSize: G.setSp(30),
                  color: hex('#333'),
                  fontWeight: FontWeight.w600
                )
              ),
              TextSpan(
                text: '.00',
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