import 'dart:async';

import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-data-picker.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/models/vipManage.dart';
import 'package:agent37_flutter/views/vipManage/components/vipListItem.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:agent37_flutter/components/v-underline_indicator.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';

/// NestedScrollView示例页面
class VipManageMain extends StatefulWidget {
  final String type;
  final String index;
  VipManageMain({this.type, this.index});

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
  DateTime startTime;
  DateTime endTime;

  static List<Map> statusMap = [
    {'value': 0, 'label': '普通'},
    {'value': 1, 'label': '标准'},
    {'value': 2, 'label': '钻石'}
  ];


  List<Widget> bodys = [];
  List<Tab> tabs = <Tab>[];
  int needRreshIndex;

  // 初始化
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    switch (widget.type) {
      case 'today':
        startTime = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);
        endTime = DateTime.now();
        break;
      case 'thisMonth':
        startTime = DateTime(DateTime.now().year, DateTime.now().month);
        endTime = DateTime.now();
        break;
      case 'lastMonth':
        startTime = DateTime(DateTime.now().year, DateTime.now().month - 1);
        endTime = DateTime(DateTime.now().year, DateTime.now().month, 0);
        break;
      default:
        startTime = DateTime(DateTime.now().year, DateTime.now().month);
        endTime = DateTime.now();
    }
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
      bodys.add(MemberList(model['value'], model['label'], start: startTime, end: endTime));
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
    var resultData = result.data['data'];
    setState(() {
      tabs[0] = Tab(text: '普通(${resultData['normalMemberNum']})');
      tabs[1] = Tab(text: '标准(${resultData['standMemberNum']})');
      tabs[2] = Tab(text: '钻石(${resultData['diamondMemberNum']})');
    });
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
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    G.navigateTo(context, '/vipManage/search');
                  },
                  icon: iconsearch(color: hex('#666666')),
                )
              ],
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
                      onTap: (index) {},
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
  final DateTime start;
  final DateTime end;
  MemberList(this.role, this.label, {this.start, this.end});

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  EasyRefreshController _controller = EasyRefreshController();
  var scrollController = new ScrollController();
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
    beginRegisterDate = widget.start;
    endRegisterDate = widget.end;
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
      role == 0 ? "beginRegisterDate" : "beginPayDate": G.formatTime(beginRegisterDate.millisecondsSinceEpoch, type: 'date' ),
      role == 0 ? "endRegisterDate" : "endPayDate": G.formatTime(endRegisterDate.millisecondsSinceEpoch, type: 'date'),
    };
    print(params);
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
              Text(role == 0 ? '注册时间' : '购买时间'),
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
              header: vRefreshHeader,
              footer: vRefreshFooter,
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
                      return VipListItem(_listData[index]);
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


}