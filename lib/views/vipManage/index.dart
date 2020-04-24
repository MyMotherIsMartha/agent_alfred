import 'dart:async';

import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/v-data-picker.dart';
import 'package:agent37_flutter/models/vipManage.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
// import 'package:agent37_flutter/api/order.dart';
// import 'package:agent37_flutter/components/emptyData.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
// import 'package:agent37_flutter/models/order.dart';
import 'package:agent37_flutter/utils/event_bus.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/components/v-underline_indicator.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:agent37_flutter/utils/map.dart';

/// NestedScrollView示例页面
class VipManageMain extends StatefulWidget {
  @override
  VipManageMainState createState() {
    return VipManageMainState();
  }
}

class VipManageMainState extends State<VipManageMain>
    with SingleTickerProviderStateMixin {
  // 滚动控制器
  ScrollController _scrollController;
  // Tab控制器
  TabController _tabController;

  static List<Map> statusMap = [
    {'value': 0, 'label': '普通'},
    {'value': 1, 'label': '标准'},
    {'value': 2, 'label': '钻石'}
  ];


  List<Widget> bodys = [];
  List<Tab> tabs = <Tab>[];
  int _tabIndex = 0;
  int needRreshIndex;

  // 初始化
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    loadCateGoryData();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }

  /*
   * 加载大类列表和标签
   */
  Future loadCateGoryData() async{
    List<Map> list = List.from(statusMap);
    list.retainWhere((item) => item['value'] != 50);
    List<Tab> myTabsTmp = <Tab>[];
    for (int i = 0; i < statusMap.length; i++) {
      Map model = list[i];
      myTabsTmp.add(Tab(text: model['label']));
      bodys.add(MemberList(model['value'], model['label']));
    }
    setState(() {
      tabs.addAll(myTabsTmp);
      _tabController = TabController(
        length: tabs.length,
        vsync: this,
      );
    });

    var result = await OrderApi().getAppMemberAmount();
    print('app member amount');
    print(result.data['data'].toString());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: extended.NestedScrollView(
        // pinnedHeaderSliverHeightBuilder: () {
        //   // return MediaQuery.of(context).padding.top + kToolbarHeight;
        //   return G.setHeight(400);
        // },
        innerScrollPositionKeyBuilder: () {
          return Key('Tab-' + _tabController.index.toString());
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: Text("会员管理"),
              centerTitle: true,
              // expandedHeight: 190.0,
              // flexibleSpace: SingleChildScrollView(
              //   physics: NeverScrollableScrollPhysics(),
              //   child: Container(),
              // ),
              floating: false,
              pinned: true,
              bottom: new PreferredSize(
                child: new Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 1.0,
                  margin: new EdgeInsets.all(0.0),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  child: TabBar(
                      controller: _tabController,
                      // isScrollable: true,
                      indicatorWeight: 3,
                      unselectedLabelColor: hex('#999'),
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: VUnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: G.setHeight(6), color: hex('#6982FF'))),
                      onTap: (index) {
                        setState(() {
                          _tabIndex = index;
                        });
                      },
                      tabs: tabs
                    ),
                ),
                preferredSize: new Size(double.infinity, 46.0),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: bodys),
      ),
    );
  }
}

class MemberList extends StatefulWidget {
  final int role;
  final String label;
  MemberList(this.role, this.label);

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  EasyRefreshController _controller = EasyRefreshController();
  var scrollController = new ScrollController();
  StreamSubscription _colorSubscription;
  int pageNo = 1;
  int total;
  int role;
  DateTime beginRegisterDate = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime endRegisterDate = DateTime.now();
  List<VipItemModel> _listData = [];
  

  @override
  void initState() {
    super.initState();
    role = widget.role;
    print(widget.label);
    _getList(true);
  }

  // showPickerDate(BuildContext context) {
  //   Picker(
  //     adapter: DateTimePickerAdapter(
  //       customColumnType: [0, 1, 2],
  //       months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
  //       yearSuffix: '年',
  //       daySuffix: '日'
  //     ),
  //     selectedTextStyle: TextStyle(color: hex('#333333')),
  //     cancelText: '取消',
  //     confirmText: '完成',
  //     cancelTextStyle: TextStyle(color: hex('#999999')),
  //     confirmTextStyle: TextStyle(color: hex('#108EE9')),
  //     itemExtent: 50,
  //     height: G.setHeight(510),
  //     onConfirm: (Picker picker, List value) {
  //       print((picker.adapter as DateTimePickerAdapter).value);
  //       var selectedTime = (picker.adapter as DateTimePickerAdapter).value;
  //       print(formatDate(selectedTime, [yyyy, '-', mm, '-', dd]));
  //     }
  //   ).showModal(context);
  // }

  Future _getList(refresh) async {
    if (_listData.length == total && !refresh) {
      G.toast('已加载全部');
      _controller.finishLoad(success: true, noMore: true);
      return null;
    }
    var params = {
      'pageNo': pageNo,
      'pageSize': 10,
      'role': role,
      'beginPayDate': G.formatTime(beginRegisterDate.millisecondsSinceEpoch, type: 'date' ),
      'endPayDate': G.formatTime(endRegisterDate.millisecondsSinceEpoch, type: 'date'),
    };
    void _api() async {
      var result = await OrderApi().getAppMemberInfos(params);
      print(result);
      Map originalData = result.data['data'];
      VipResultModel resultData = VipResultModel.fromJson(originalData);
      if (resultData == null) return;
      print(resultData);
      setState(() {
        total = resultData.total;
      });
      if (refresh) {
        setState(() {
          _listData = resultData.records;
        });
      } else {
        _listData.addAll(resultData.records);
      }
    }

    setState(() {
      pageNo = refresh ? 1 : pageNo + 1;
    });

    _api();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hex('#F3F4F6'),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20), vertical: G.setHeight(30)),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              Text('注册时间'),
              G.spacingWidth(60),
              VDatePicker(beginRegisterDate, (time) async {
                setState(() {
                  beginRegisterDate = time;
                });
                await _getList(true);
              }, maxValue: endRegisterDate,),
              Container(
                alignment: Alignment.center,
                width: G.setWidth(46),
                child: Text('至',
                    style: TextStyle(
                        fontSize: G.setSp(24), color: hex('#424242'))),
              ),
              VDatePicker(endRegisterDate, (time) async {
                setState(() {
                  endRegisterDate = time;
                });
                await _getList(true);
              }, minValue: beginRegisterDate)
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: G.setHeight(80)),
            child: extended.NestedScrollViewInnerScrollPositionKeyWidget(
            Key('Tab-' + widget.role.toString()),
            EasyRefresh(
              controller: _controller,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: _listData.length,
                  itemBuilder: (context, index) {
                    if (index == total) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text('没有更多了'),
                      );
                    } else {
                      return memberItem(_listData[index]);
                    }
                  }),
              emptyWidget: _listData.length == 0
                  ? Container(
                      margin: EdgeInsets.only(top: G.setHeight(240)),
                      child: VEmpty(hintText: '暂无任何会员哦～'),
                    )
                  : null,
              onLoad: () async {
                _getList(false);
              },
              onRefresh: () async {
                _getList(true);
              },
            ))
          ),
        ]
      ),
    );
  }

  String hideMobile(mobile) {
    return mobile.replaceFirst(new RegExp(r'\d{4}'), '****', 3);
  }

  Widget leftTopText(statusCode) {
    String statusStr;
    switch (statusCode) {
      case -1:
        statusStr = '未提交审核';
        break;
      case 1:
        statusStr = '已通过认证';
        break;
      case 0:
        statusStr = '未通过认证';
        break;
      case 2:
        statusStr = '驳回认证';
        break;
      default:
        statusStr = '未知状态';
    }
    if (statusCode == 2) {
      return Row(children: [
        Text(statusStr),
        Container(
          margin: EdgeInsets.only(left: G.setWidth(5)),
          decoration: BoxDecoration(
            color: hex('#E6E6E6'),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.arrow_drop_down, size: G.setSp(40), color: hex('#666666'),)
        )
      ]);
    } else {
      return Text(statusStr);
    }
    
  }
  
  Widget memberItem(item) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: hex('#FFF'),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Image(height: G.setHeight(34),image: item.headImg != '' ? NetworkImage(item.headImg) : AssetImage('lib/assets/images/pic-icon/new-ellipse.png')),
                Container(
                  margin: EdgeInsets.only(left: G.setWidth(5)),
                  constraints: BoxConstraints(
                    maxWidth: G.setWidth(425),
                  ),
                  child: Text(item.enterpriseName ?? '', 
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis, 
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ]),
              leftTopText(item.auditStatus)
            ]
          ),
        ),
        Offstage( // 控制拒绝原因的显隐
          offstage: item.auditStatus != 2,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: G.setWidth(15), horizontal: G.setWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(G.setWidth(10)),
              color: hex('#F3F4F6')
            ),
            constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
            ),
            child: Text(item.rejectReason, style: TextStyle(color: hex('#666666')),),
          ),
        ),
        InkWell(
          onTap: () {
            // print(item["value"].toString());
            String vipId = item.memberId;
            G.router.navigateTo(context, Routes.vipDetail + '?vipId=$vipId');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: hex('#eee'), width:  G.setWidth(1))),
            ),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 20, 0), 
                child: Image(width: G.setWidth(100),image: AssetImage('lib/assets/images/home/vip.png'))
              ),
              Column(
                children: [
                  Row(children: <Widget>[
                    Text('手机号:'),
                    G.spacingWidth(25),
                    Text(hideMobile(item.mobile))
                  ],),
                  Row(children: <Widget>[
                    Text('注册时间:'),
                    G.spacingWidth(20),
                    Text(G.formatTime(item.registerTime, type: 'date'))
                    // Text(formatDate(DateTime(fromMillisecondsSinceEpoch(item.registerTime)) ,[yyyy,'-',mm,'-',dd]);)
                  ],)
                ]
              )
            ],)
          )
        )
      ])
    );
  }
}