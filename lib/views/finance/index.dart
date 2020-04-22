import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-data-picker.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/components/v-underline_indicator.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/finance/components/finance-item.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // tabbar选项栏
  List<Widget> _appTabItem() {
    List<String> types = ['商品销售', '会员订单', '礼包销售'];
    return types.map((type) {
      return Tab(text: type);
    }).toList();
  }

  // appbar
  PreferredSizeWidget _appbar() {
    return AppBar(
      title: Row(
        children: <Widget>[
          Expanded(
            child: TabBar(
              labelPadding: EdgeInsets.all(0),
              indicator: VUnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: G.setHeight(6), color: hex('#6982FF'))),
              controller: _tabController,
              labelStyle: TextStyle(
                  fontSize: G.setSp(30),
                  color: hex('#333'),
                  fontWeight: FontWeight.w500),
              unselectedLabelColor: hex('#999'),
              unselectedLabelStyle:
                  TextStyle(fontSize: G.setSp(28), fontWeight: FontWeight.w400),
              tabs: _appTabItem(),
            ),
          )
        ],
      ),
      elevation: 0,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            G.router.navigateTo(context, '/finance/search');
          },
          icon: iconsearch(color: hex('#666666')),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: _appbar(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          OrderView(),
          Text('34'),
          Text('56'),
        ],
      ),
    );
  }
}

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  String currentStatus = '待结算';
  EasyRefreshController _refreshController = EasyRefreshController();
  int listCount = 10;
  DateTime startTime = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime endTime = DateTime.now();

  // 待结算提示
  Widget _hint() {
    return Container(
      color: hex('#CABEA6'),
      width: G.setWidth(750),
      height: G.setHeight(60),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          iconhint(color: hex('#fff'), size: G.setSp(30)),
          G.spacing(10, dir: 'x'),
          Text('考核期代理的服务费结算将在考核过后当月/下月15日结算',
              style: TextStyle(fontSize: G.setSp(24), color: hex('#fff')))
        ],
      ),
    );
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
        height: G.setHeight(94),
        alignment: Alignment.center,
        color: hex('#FFF'),
        child: Container(
          width: G.setWidth(600),
          height: G.setHeight(54),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(G.setSp(54)),
              color: hex('#F3F4F6')),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: <Widget>[
              _statucItem('待结算'),
              _statucItem('已结算'),
              _statucItem('已关闭'),
            ],
          ),
        ));
  }

  // 筛选
  Widget _filterWidget() {
    return Container(
      width: double.infinity,
      height: G.setHeight(94),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              VDatePicker(startTime, (time) {
                setState(() {
                  startTime = time;
                  endTime = DateTime(time.year, time.month +1, 0);
                });
              }),
              Container(
                alignment: Alignment.center,
                width: G.setWidth(46),
                child: Text('至', style: TextStyle(
                  fontSize: G.setSp(24),
                  color: hex('#424242')
                )),
              ),
              VDatePicker(endTime, (time) {
                setState(() {
                  endTime = time;
                });
              }, minValue: startTime)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('预估服务费：', style: TextStyle(
                fontSize: G.setSp(22),
                color: hex('#666')
              )),
              Text('￥1999.00', style: TextStyle(
                fontSize: G.setSp(24),
                color: hex('#E84747')
              ))
            ],
          )
        ],
      ),
    );
  }

  // 财务列表
  Widget _financeList() {
    return Expanded(
      flex: 1,
      child: EasyRefresh(
        controller: _refreshController,
        header: vRefreshHeader,
        footer: vRefreshFooter,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(
                  height: G.setHeight(20),
                  color: Colors.transparent,
                ),
            itemCount: listCount,
            itemBuilder: (context, index) {
              return FinanceItem();
            }),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            print('延时1s执行');
          });
        },
        onLoad: () async {
          if (listCount >= 30) {
            _refreshController.finishLoad(success: true, noMore: true);
            return;
          }
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {
              listCount += 10;
            });
            print('延时1s执行');
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: hex('#54f'),
      child: Column(
        children: <Widget>[
          _hint(),
          _statucSwitch(),
          _filterWidget(),
          _financeList()
        ],
      ),
    );
  }
}