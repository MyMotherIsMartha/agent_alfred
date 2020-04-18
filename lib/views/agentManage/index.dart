import 'dart:async';

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

  static List<Map> statusMap = [
    {'value': 1, 'label': '普通'},
    {'value': 2, 'label': '代理商'},
    // {'value': 3, 'label': '钻石'}
  ];


  List<Widget> bodys = [];
  List<Tab> tabs = <Tab>[];
  int _tabIndex = 0;
  int needRreshIndex;

  // 初始化
  @override
  void initState() {
    super.initState();
    loadCateGoryData();
    _scrollController = ScrollController();
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
  void loadCateGoryData() {
    List<Map> list = List.from(statusMap);
    list.retainWhere((item) => item['value'] != 50);
    List<Tab> myTabsTmp = <Tab>[];
    List<Widget> bodysTmp = [];
    for (int i = 0; i < list.length; i++) {
      Map model = list[i];
      myTabsTmp.add(Tab(text: model['label']));
      // bodysTmp.add(OrderList(i, model['value']));
    }
    setState(() {
      tabs.addAll(myTabsTmp);
      bodys.addAll(bodysTmp);
      _tabController = TabController(
        length: tabs.length,
        vsync: this,
      );
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
                      text: '5',
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
                          Text('每推荐两个钻石会员即可获赠名额', style: TextStyle(fontSize: G.setSp(30), color: hex('#000'))),
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
                      text: '1',
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
                        TextSpan(text: '2', style: TextStyle(color: Colors.white, fontSize: G.setSp(42)))
                      ]
                    ))
                  ]),
                  G.spacing(10),
                  Text('待入账代理商名额3名', style: TextStyle(fontSize: G.setSp(24), color: Color.fromRGBO(255, 255, 255, 0.6)))
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
              title: Text("代理商管理"),
              centerTitle: true,
              // expandedHeight: 190.0,
              // flexibleSpace: SingleChildScrollView(
              //   physics: NeverScrollableScrollPhysics(),
              //   child: Container(),
              // ),
              floating: false,
              pinned: true,
            ),
          ];
        },
        body: Column(children: <Widget>[
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
                setState(() {
                  _tabIndex = index;
                });
              },
              tabs: tabs
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: statusMap.map((item) {
                return MemberList(item['value'], item['label']);
              }).toList()),
          )
        ])
      ),
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
  String currentStatus = '待短信验证';

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

  Widget _statucItem(String status) {
    bool selected = status == currentStatus;
    return InkWell(
        onTap: () {
          setState(() {
            currentStatus = status;
          });
        },
        child: Container(
            width: G.setWidth(300),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(51)),
            decoration: BoxDecoration(
                border: Border.all(
                    color: selected ? hex('#6982FF') : Colors.transparent),
                borderRadius: BorderRadius.circular(G.setSp(54))),
            child: Text(status,
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
              _statucItem('待短信验证'),
              _statucItem('已短信验证')
            ],
          ),
        ));
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
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: hex('#eee'), width:  G.setWidth(1))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: G.setWidth(390),
                  ),
                  child: Text('云上一家旗舰店云上一家旗舰云上一家旗舰店云上一家旗舰', 
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis, 
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Image(height: G.setHeight(34),image: AssetImage('lib/assets/images/pic-icon/new-ellipse.png')),
              ]),
              Row(children: [
                Text('审核拒绝'),
                Container(
                  margin: EdgeInsets.only(left: G.setWidth(5)),
                  decoration: BoxDecoration(
                    color: hex('#E6E6E6'),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.arrow_drop_down, size: G.setSp(40), color: hex('#666666'),)
                )
              ])
            ]
          ),
        ),
        InkWell(
          onTap: () {
            // print(item["value"].toString());
            String vipId = item["value"].toString();
            G.router.navigateTo(context, Routes.vipDetail + '?vipId=$vipId');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
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
                    Text('18892663052')
                  ],),
                  Row(children: <Widget>[
                    Text('注册时间:'),
                    G.spacingWidth(20),
                    Text('2019-08-12')
                  ],)
                ]
              )
            ],)
          )
        )
      ])
    );
  }

  @override
  Widget build(BuildContext context) {
    EasyRefreshController _controller = EasyRefreshController();
    var scrollController = new ScrollController();
    StreamSubscription _colorSubscription;
    int pageNo = 1;
    List<Map> _listData = [
      {'value': 1, 'label': '普通'},
      {'value': 2, 'label': '标准2'},
      {'value': 3, 'label': '钻石3'},
      {'value': 4, 'label': '普通4'},
      {'value': 5, 'label': '标准5'},
      {'value': 6, 'label': '钻石6'},
      {'value': 7, 'label': '普通7'},
      {'value': 8, 'label': '标准8'},
      {'value': 9, 'label': '钻石9'},
      {'value': 10, 'label': '普通10'},
      {'value': 11, 'label': '标准11'},
      {'value': 12, 'label': '钻石12'}
    ];
    int total;

    return Container(
      color: hex('#F3F4F6'),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20), vertical: G.setHeight(20)),
      child: Column(
        children: <Widget>[
          Container(
            child: widget.status == 2 ? _statucSwitch() : null,
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.only(top: G.setHeight(10)),
              child: extended.NestedScrollViewInnerScrollPositionKeyWidget(
              Key('Tab-' + widget.status.toString()),
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
                  // _getOrder(false);
                },
                onRefresh: () async {
                  // _getOrder(true);
                },
              ))
            ),
          )
          ]
      ),
    );
  }
}