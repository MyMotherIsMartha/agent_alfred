import 'package:agent37_flutter/api/finance.dart';
import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-data-picker.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/components/v-underline_indicator.dart';
import 'package:agent37_flutter/models/finance.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/finance/components/finance-item.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:agent37_flutter/api/system.dart';

class FinancePage extends StatefulWidget {
  final String type;
  final String index;
  FinancePage({this.type, this.index});
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  DateTime startTime;
  DateTime endTime;
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
            G.navigateTo(context, '/finance/search');
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
    _tabController.animateTo(int.parse(widget.index));
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: _appbar(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          OrderView(
              FinanceApi().fetchProduct,
              'pendingPurchaseOrderServiceCharge',
              'entryPurchaseOrderServiceCharge',
              start: startTime,
              end: endTime),
          OrderView(
              FinanceApi().fetchMemberOrder,
              'pendingMemberOrderServiceCharge',
              'entryMemberOrderServiceCharge	',
              start: startTime,
              end: endTime),
          OrderView(
              FinanceApi().fetchPackageOrder,
              'pendingGiftPackageOrderServiceCharge',
              'entryGiftPackageOrderServiceCharge',
              start: startTime,
              end: endTime)
        ],
      ),
    );
  }
}

class OrderView extends StatefulWidget {
  final Function getListFn;
  final String pending;
  final String entry;
  final DateTime start;
  final DateTime end;
  OrderView(this.getListFn, this.pending, this.entry, {this.start, this.end});
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView>
    with AutomaticKeepAliveClientMixin {
  int pageNo = 1; // 当前页码
  List<FinanceItemModel> itemList = <FinanceItemModel>[]; // 列表项
  int total; // 总条数
  List<String> settleStatusList = ['', '待结算', '已结算', '已关闭'];
  int settleStatus = 1; // 当前栏目
  List<double> serviceCharge = [];
  EasyRefreshController _refreshController = EasyRefreshController();
  int listCount = 10;
  DateTime startTime = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime endTime = DateTime.now();
  var chargeFuture;
  String dateCalc = '15'; // 每月X号结算

  Future getDateCalc() async {
    if (Validate.isNon(G.getPref('generateSettleBillDatesMonthly'))) {
      var result = await SystemApi().getSystemSettings();
      setState(() {
        dateCalc = result.data['data']['generateSettleBillDatesMonthly'];
      });
      // G.setPref('generateSettleBillDatesMonthly', result.data['data']['generateSettleBillDatesMonthly']);
    } else {
      setState(() {
        dateCalc = G.getPref('generateSettleBillDatesMonthly');
      });
    }
  }

  // 待结算提示
  Widget _hint() {
    return settleStatus == 1
        ? Container(
            color: hex('#CABEA6'),
            width: G.setWidth(750),
            height: G.setHeight(60),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                iconhint(color: hex('#fff'), size: G.setSp(30)),
                G.spacing(10, dir: 'x'),
                Text('考核期代理的服务费结算将在考核过后当月/下月$dateCalc日结算',
                    style: TextStyle(fontSize: G.setSp(24), color: hex('#fff')))
              ],
            ),
          )
        : Container();
  }

  Widget _statucItem(int status) {
    bool selected = status == settleStatus;
    return InkWell(
        onTap: () async {
          setState(() {
            settleStatus = status;
          });
          G.showLoading(context);
          await _getList(refresh: true);
          G.closeLoading();
        },
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(51)),
            decoration: BoxDecoration(
                border: Border.all(
                    color: selected ? hex('#6982FF') : Colors.transparent),
                borderRadius: BorderRadius.circular(G.setSp(54))),
            child: Text(settleStatusList[status],
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
              _statucItem(1),
              _statucItem(2),
              _statucItem(3),
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
              VDatePicker(
                startTime,
                (time) async {
                  setState(() {
                    startTime = time;
                  });
                  await _getList(refresh: true);
                },
                maxValue: endTime,
              ),
              Container(
                alignment: Alignment.center,
                width: G.setWidth(46),
                child: Text('至',
                    style: TextStyle(
                        fontSize: G.setSp(24), color: hex('#424242'))),
              ),
              VDatePicker(endTime, (time) async {
                setState(() {
                  endTime = time;
                });
                await _getList(refresh: true);
              }, minValue: startTime)
            ],
          ),
          FutureBuilder(
            future: chargeFuture,
            builder: (context, shapshot) {
              if (shapshot.hasData) {
                if (settleStatus == 3) {
                  return Container();
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('预估服务费：',
                          style: TextStyle(
                              fontSize: G.setSp(22), color: hex('#666'))),
                      Text('￥${shapshot.data[settleStatus].toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: G.setSp(24), color: hex('#E84747')))
                    ],
                  );
                }
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Future _getList({bool refresh = false}) async {
    if (refresh) {
      _refreshController?.finishLoad(success: true, noMore: false);
      pageNo = 1;
      itemList = <FinanceItemModel>[];
    } else {
      ++pageNo;
    }

    FinanceModel sourceData;
    var result = await widget.getListFn(pageNo, settleStatus,
        beginPayDate: startTime, endPayDate: endTime);
    var data = result.data['data'];
    if (data == null) return;
    sourceData = FinanceModel.fromJson(data);
    Future.delayed(Duration(microseconds: 0), (){
      setState(() {
        total = sourceData.total;
      });
      itemList.addAll(sourceData.records);
      if (itemList.length >= total) {
        _refreshController?.finishLoad(success: true, noMore: true);
      }
    });
    
  }

  Future _getCharge() async {
    var result = await MemberApi().serviceCharges();
    Map data = result.data['data'];
    if (data != null) {
      return [0, data[widget.pending] ?? 0, data[widget.entry] ?? 0];
      // serviceCharge = [0, data[widget.pending] ?? 0, data[widget.entry] ?? 0];
      // setState(() {

      // });
    }

    return [0, 0, 0];
  }

  // 财务列表
  Widget _financeList() {
    return Expanded(
      flex: 1,
      child: itemList.length > 0
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
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return FinanceItem(itemList[index]);
                  }),
              onRefresh: () async {
                await _getList(refresh: true);
              },
              onLoad: () async {
                await _getList();
              },
            )
          : Container(
              margin: EdgeInsets.only(top: G.setWidth(200)),
              child: VEmpty(hintText: '暂无任何订单哦~'),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime = widget.start;
    endTime = widget.end;
    _getList(refresh: true);
    
    
    chargeFuture = _getCharge();
    getDateCalc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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

  bool get wantKeepAlive => true;
}
