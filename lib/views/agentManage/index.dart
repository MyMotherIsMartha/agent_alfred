import 'dart:async';

import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/models/agentManage.dart';
import 'package:agent37_flutter/views/agentManage/components/agentListItem.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:agent37_flutter/components/v-underline_indicator.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:date_format/date_format.dart';

/// NestedScrollView示例页面
class AgentManageMain extends StatefulWidget {
  @override
  AgentManageMainState createState() {
    return AgentManageMainState();
  }
}

class AgentManageMainState extends State<AgentManageMain>
    with SingleTickerProviderStateMixin {
  // 滚动控制器
  ScrollController _scrollController;
  // Tab控制器
  TabController _tabController;
  //  各代理商数量
  Map _agentNumObj = {
    'giveAgentNum': 0,
    'checkAgentNum': 0
  };

  static List<Map> statusMap = [
    {'value': 1, 'label': '普通'},
    {'value': 0, 'label': '代理商'},
  ];


  List<Widget> bodys = [];
  List<Tab> tabs = <Tab>[];
  // int _tabIndex = 0;
  int needRreshIndex;

  // 初始化
  @override
  void initState() {
    super.initState();
    loadCateGoryData();
    _scrollController = ScrollController();
  }

  @override
  void deactivate() {
    super.deactivate();
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      loadCateGoryData();
    }
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
  void loadCateGoryData() async {
    List<Map> list = List.from(statusMap);

    for (int i = 0; i < list.length; i++) {
      Map model = list[i];
      tabs.add(Tab(text: model['label']));
      bodys.add(MemberList(model['value'], model['label']));
    }
    setState(() {
      _tabController = TabController(
        length: tabs.length,
        vsync: this,
      );
    });

    var result = await MemberApi().getAgentStatistics();
    setState(() {
      _agentNumObj = result.data['data'];
      print(_agentNumObj);
      var normalAgentNum = _agentNumObj["normalAgentNum"];
      var agentNum = _agentNumObj["agentNum"];
      tabs[0] = Tab(text: '普通($normalAgentNum)');
      tabs[1] = Tab(text: '代理商($agentNum)');
    });
  }

  void showExplain1() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.fromLTRB(G.setWidth(25), G.setWidth(30), G.setWidth(25), G.setWidth(60)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('新增推荐名额', style: TextStyle(color: Colors.black, fontSize: G.setSp(30), fontWeight: FontWeight.w600)),
              G.spacing(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(width: G.setWidth(80), height: G.setWidth(80), image: AssetImage('lib/assets/images/pic-icon/agentMember.png')),
                      G.spacingWidth(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('通过考核即可获赠名额', style: TextStyle(fontSize: G.setSp(30), color: hex('#000'))),
                          Text('只限一次，满足自动新增', style: TextStyle(fontSize: G.setSp(24), color: hex('#999999')))
                        ]
                      )
                    ]
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '名额 ×',
                      style: TextStyle(fontSize: G.setSp(24), color: hex('#666'))
                    ),
                    TextSpan(
                      text: _agentNumObj['checkPassGiveAgentNum'].toString(),
                      style: TextStyle(fontSize: G.setSp(30), fontWeight: FontWeight.w600)
                    ),
                  ]))
                ]
              ),
              G.spacing(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(width: G.setWidth(80), height: G.setWidth(80), image: AssetImage('lib/assets/images/pic-icon/diamondMember.png')),
                      G.spacingWidth(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('每推荐${_agentNumObj['eachAddDiamondMemberNum']}个钻石会员即可获赠名额', style: TextStyle(fontSize: G.setSp(30), color: hex('#000'))),
                          Text('无次数限制，满足自动新增', style: TextStyle(fontSize: G.setSp(24), color: hex('#999999')))
                        ]
                      )
                    ]
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '名额 ×',
                      style: TextStyle(fontSize: G.setSp(24), color: hex('#666'))
                    ),
                    TextSpan(
                      text: _agentNumObj['eachAddDiamondMembeGiveAgentNum'].toString(),
                      style: TextStyle(fontSize: G.setSp(30), fontWeight: FontWeight.w600)
                    ),
                  ]))
                ]
              )
            ]
          ),
        );
      });
  }

  void showExplain2() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.fromLTRB(G.setWidth(25), G.setWidth(30), G.setWidth(25), G.setWidth(60)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('如何扣除名额', style: TextStyle(color: Colors.black, fontSize: G.setSp(30), fontWeight: FontWeight.w600)),
              G.spacing(20),
              Text('''在每月结算服务费时：
1）若有待结算且已验证的代理商≤剩余名额时，则结算代理商服务费并扣除名额；
2）若有待结算且已验证的代理商>剩余名额时，则代理商服务费仍为待结算且不会扣除名额。''', style: TextStyle(fontSize: G.setSp(28), height: 1.5))
            ]
          ),
        );
      });
  }

  Widget _topArea() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: G.setWidth(260),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [hex('#685AFF'), hex('#69A5FF')]),
        ),
        child: Stack(children: [
          Positioned(child: 
            Container(
              width: G.setWidth(400),
              margin: EdgeInsets.only(top: G.setWidth(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('可用推荐名额', style: TextStyle(color: Colors.white, fontSize: G.setSp(30))),
                  G.spacing(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Image(width: G.setWidth(60), height: G.setHeight(60),image: AssetImage('lib/assets/images/pic-icon/agent-user.png')),
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(text: '   ×', style: TextStyle(color: Colors.white, fontSize: G.setSp(28))),
                        TextSpan(text: (_agentNumObj['giveAgentNum'] - _agentNumObj['checkAgentNum']).toString(), style: TextStyle(color: Colors.white, fontSize: G.setSp(42)))
                      ]
                    ))
                  ]),
                  G.spacing(10),
                  Text('待入账代理商名额${_agentNumObj["pendingAgentNum"] ?? 0}名', style: TextStyle(fontSize: G.setSp(24), color: Color.fromRGBO(255, 255, 255, 0.6)))
                ]
              )
            )
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: showExplain1,
                  child: Container(
                    margin: EdgeInsets.only(top: G.setWidth(55)),
                    width: G.setWidth(250),
                    padding: EdgeInsets.only(top: G.setWidth(10), bottom: G.setWidth(10), left: G.setWidth(30)),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0)
                      ) 
                    ),
                    child: Text('如何增加名额？', style: TextStyle(color: hex('#fff'))),
                  ),
                ),
                InkWell(
                  onTap: showExplain2,
                  child: Container(
                    margin: EdgeInsets.only(top: G.setWidth(30)),
                    width: G.setWidth(250),
                    padding: EdgeInsets.only(top: G.setWidth(10), bottom: G.setWidth(10), left: G.setWidth(30)),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0)
                      ) 
                    ),
                    child: Text('扣除名额说明', style: TextStyle(color: hex('#fff'))),
                  )
                )
              ]
            )
          ),
        ])
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
              title: Text("代理商管理"),
              centerTitle: true,
              // expandedHeight: 190.0,
              // flexibleSpace: SingleChildScrollView(
              //   physics: NeverScrollableScrollPhysics(),
              //   child: Container(),
              // ),
              // floating: false,
              // pinned: true,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    G.navigateTo(context, '/agentManage/search');
                  },
                  icon: iconsearch(color: hex('#666666')),
                )
              ],
            ),
      body:  Column(children: <Widget>[
          _topArea(),
          Container(
            color: Colors.white,
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
                // setState(() {
                //   _tabIndex = index;
                // });
              },
              tabs: tabs
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: bodys),
          )
        ])
      );
  }
}

class MemberList extends StatefulWidget {
  final int status;
  final String label;
  MemberList(this.status, this.label);

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  EasyRefreshController _controller = EasyRefreshController();
  var scrollController = new ScrollController();
  int pageNo = 1;
  int isNormal;
  int smsValid = 0;
  List<AgentItemModel> _listData = [];
  int total;

  showPickerDate(BuildContext context) {
    Picker(
      adapter: DateTimePickerAdapter(
        customColumnType: [0, 1, 2],
        months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        yearSuffix: '年',
        daySuffix: '日'
      ),
      selectedTextStyle: TextStyle(color: hex('#333333')),
      cancelText: '取消',
      confirmText: '完成',
      cancelTextStyle: TextStyle(color: hex('#999999')),
      confirmTextStyle: TextStyle(color: hex('#108EE9')),
      itemExtent: 50,
      height: G.setHeight(510),
      onConfirm: (Picker picker, List value) {
        print((picker.adapter as DateTimePickerAdapter).value);
        var selectedTime = (picker.adapter as DateTimePickerAdapter).value;
        print(formatDate(selectedTime, [yyyy, '-', mm, '-', dd]));
      }
    ).showModal(context);
  }

  Widget _statucItem(String label, int value) {
    bool selected = value == smsValid;
    return InkWell(
        onTap: () async{
          setState(() {
            smsValid = value;
          });
          G.showLoading(context);
          await _getList(true);
          G.closeLoading();
        },
        child: Container(
            width: G.setWidth(300),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(51)),
            decoration: BoxDecoration(
                border: Border.all(
                    color: selected ? hex('#6982FF') : Colors.transparent),
                borderRadius: BorderRadius.circular(G.setSp(54))),
            child: Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: selected ? hex('#6982FF') : hex('#999999'),
                    fontSize: G.setSp(26)))));
  }

  // 状态切换
  Widget _statucSwitch() {
    return Container(
        width: double.infinity,
        height: G.setHeight(54),
        margin: EdgeInsets.only(bottom: G.setWidth(20)),
        alignment: Alignment.center,
        child: Container(
          width: G.setWidth(600),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(G.setSp(54)),
              color: hex('#FFF')),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: <Widget>[
              _statucItem('待短信验证', 0),
              _statucItem('已短信验证', 1)
            ],
          ),
        ));
  }


  @override
  void initState() { 
    super.initState();
    isNormal = widget.status;
    G.setContext(context);
    _getList(true);
  }

  Future _getList(refresh) async {
    if (_listData.length == total && !refresh) {
      
      // List<AgentItemModel> tempList = _listData;
      // _listData.map((e) {
      //   tempList.add(e);
      // });
      // for (int i = 0; i < _listData.length; i++) {
      //   tempList[i] = _listData[i];
      // }
      // print(tempList[1].shareCode);
      // print('tempList[1].shareCode');
      
      // _listData = [];
      // return await Future.delayed(Duration(microseconds: 1000), () {
      //   setState(() {
      //     _listData = tempList;
      //   });
      // });
      // _controller.callLoad();
      _controller.finishLoad(success: true, noMore: true);
      return null;
    }
    var params = {
      'pageNo': pageNo,
      'pageSize': 10,
      'isNormal': isNormal,
      'smsValid': isNormal == 0 ? smsValid : ''
    };
    void _api() async {
      var result = await MemberApi().getAgentChildren(params);
      Map originalData = result.data['data'];
      AgentResultModel resultData = AgentResultModel.fromJson(originalData);
      if (resultData == null) return;
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
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20), vertical: G.setHeight(20)),
      child: Column(
        children: <Widget>[
          Container(
            child: widget.status == 0 ? _statucSwitch() : null,
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.only(top: G.setHeight(10)),
              child: extended.NestedScrollViewInnerScrollPositionKeyWidget(
              Key('Tab-' + widget.status.toString()),
              EasyRefresh(
                controller: _controller,
                header: vRefreshHeader,
                footer: _listData.length > 0 ? vRefreshFooter : MaterialFooter(),
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: _listData.length,
                    itemBuilder: (context, index) {
                      return AgentListItem(_listData[index]);
                      // if (index == total) {
                      //   return Container(
                      //     alignment: Alignment.center,
                      //     child: Text('没有更多了'),
                      //   );
                      // } else {
                      //   return AgentListItem(_listData[index]);
                      // }
                    }),
                emptyWidget: _listData.length == 0
                    ? Container(
                        margin: EdgeInsets.only(top: G.setHeight(240)),
                        child: VEmpty(hintText: '暂无任何代理商哦～'),
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
          )
          ]
      ),
    );
  }
}