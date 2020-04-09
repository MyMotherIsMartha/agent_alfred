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
import 'package:agent37_flutter/utils/global.dart';
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

  static List<Map> statusMap = MapUtils.orderList;
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
              title: Text("订单列表"),
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
                  elevation: 0.0,
                  margin: new EdgeInsets.all(0.0),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  child: new TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorWeight: 3,
                      indicatorColor: hex('#E2B55D'),
                      unselectedLabelColor: hex('#999'),
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (index) {
                        setState(() {
                          _tabIndex = index;
                        });
                      },
                      tabs: tabs
                      // tabs: <Widget>[
                      //   new Tab(
                      //     text: 'List',
                      //   ),
                      //   new Tab(
                      //     text: 'Grid',
                      //   ),
                      // ],
                      ),
                ),
                preferredSize: new Size(double.infinity, 46.0),
              ),
            ),
          ];
        },
        body: IndexedStack(index: _tabIndex, children: bodys),
      ),
    );
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
      bodysTmp.add(OrderList(i, model['value']));
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
}

class OrderList extends StatefulWidget {
  final int sort;
  final int orderStatus;
  OrderList(this.sort, this.orderStatus);
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  
  EasyRefreshController _controller = EasyRefreshController();
  var scrollController = new ScrollController();
  StreamSubscription _colorSubscription;
  int pageNo = 1;
  List list = [];
  int total;
  @override
  void initState() {
    super.initState();
    _colorSubscription = eventBus.on<RefreshOrderEvent>().listen((event) {
      // 如果需要刷新，就触发refresh
      if (event.refreshOrder.contains(widget.sort)) {
        _controller.callRefresh();
      }
    });
    _getOrder(true);
  }

  void dispose() {
    super.dispose();
    //取消订阅
    _colorSubscription.cancel();
  }

  Widget build(BuildContext context) {
    return Container(
        color: hex('#F3F4F6'),
        padding: EdgeInsets.all(20),
        child: extended.NestedScrollViewInnerScrollPositionKeyWidget(
            Key('Tab-' + widget.sort.toString()),
            EasyRefresh(
              controller: _controller,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: list.length + 1,
                  itemBuilder: (context, index) {
                    if (index == total) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text('没有更多了'),
                      );
                    } else {
                      return orderItem(list[index], orderBtns(list[index]));
                    }
                  }),
              emptyWidget: list.length == 0
                  ? Container(
                      margin: EdgeInsets.only(top: G.setHeight(300)),
                      child: Text('暂无相关订单'),
                    )
                  : null,
              onLoad: () async {
                _getOrder(false);
              },
              onRefresh: () async {
                _getOrder(true);
              },
            )));
  }

  List<Widget> orderBtns(order) {
    if (order.orderStatus != -1) {
      return <Widget>[
        FlatButton(
          color: hex('#F3C774'),
          highlightColor: hex('#E2B55D'),
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("取消订单"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () async {
            print(order.orderNo);
            // var result = await OrderApi().cancelOrder([order.orderNo]);
            // print(result);
            // if (result.data['code'] == 200) {
            //   G.toast('取消成功');
            //   // _controller.callRefresh();
            //   eventBus.fire(RefreshOrderEvent([4, 1, 0]));
            // }
          },
        )
      ];
    }
    return <Widget>[];
  }

  Future _getOrder(refresh) async {
    if (list.length == total && !refresh) {
      G.toast('已加载全部');
      _controller.finishLoad(success: true, noMore: true);
      return null;
    }
    // void _api() async {
    //   var result = await OrderApi()
    //       .fetchOrder(orderStatus: widget.orderStatus, pageNo: pageNo);
    //   Map origindata = result.data['data'];
    //   if (origindata == null) return;
    //   OrderResultModel data = OrderResultModel.fromJson(origindata);
    //   setState(() {
    //     total = data.total;
    //   });
    //   if (refresh) {
    //     setState(() {
    //       list = data.records;
    //     });
    //   } else {
    //     list.addAll(data.records);
    //   }
    // }

    setState(() {
      pageNo = refresh ? 1 : pageNo + 1;
    });
    // _api();
  }
}

Widget orderItem(order, orderBtns) {
  String status = MapUtils.orderList
      .firstWhere((item) => item['value'] == order.orderStatus)['label'];
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      color: hex('#FFF'),
      borderRadius: BorderRadius.circular(10),
    )
  );
}
