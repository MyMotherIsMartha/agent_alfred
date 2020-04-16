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
  List tabs = ["待结算服务费", "已结算服务费"];
  int tabIndex = 0;
  List bodys;

  List waitServiceAry = [1, 2, 3, 4];
  List alreadyServiceAry = [5, 6, 7, 8];

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
                  Text('遇上一家旗舰店呀', style: TextStyle(fontWeight: FontWeight.w500))
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
                        text: '9999',
                        style: TextStyle(
                          fontSize: G.setSp(30),
                          color: hex('#333'),
                          fontWeight: FontWeight.w500
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
                        widthFactor: 0.8,
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
                    Text('已结算服务费',style: TextStyle(
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
                          text: '9999',
                          style: TextStyle(
                            fontSize: G.setSp(30),
                            color: hex('#333'),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: '.00',
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
                          text: '9999',
                          style: TextStyle(
                            fontSize: G.setSp(30),
                            color: hex('#333'),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: '.00',
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
              tabs: tabs.map((e) => Tab(text: e)).toList()
            )
          ),
          Container(
            child: IndexedStack(index: tabIndex, children: bodys),
          )
        ],
      ),
    );
  }
}

class ServiceList extends StatelessWidget {
  final String type;
  ServiceList({this.type});

  final List waitServiceAry = [1, 2, 3, 4];
  final List alreadyServiceAry = [5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    int total = waitServiceAry.length;

    return Container(
      child: ListView.builder(
        itemCount: waitServiceAry.length,
        itemBuilder: (context, index) {
          if (index == total) {
            return Container(
              alignment: Alignment.center,
              child: Text('没有更多了'),
            );
          } else {
            return serviceItem(waitServiceAry[index]);
          }
        }),
    );
  }

  Widget serviceItem(item) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: hex('#FFF'),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text('ylh-test'),
    );
  }
}