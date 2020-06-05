import 'dart:async';

import 'package:agent37_flutter/api/finance.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:color_dart/hex_color.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:agent37_flutter/api/order.dart';
// import 'package:agent37_flutter/components/emptyData.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
// import 'package:agent37_flutter/models/order.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter_picker/flutter_picker.dart';

class BillHistory extends StatefulWidget {
  @override
  _BillHistoryState createState() => _BillHistoryState();
}

class _BillHistoryState extends State<BillHistory> {
  EasyRefreshController _controller = EasyRefreshController();
  var scrollController = new ScrollController();
  List _listData=[];
  List categoryList=[
    {'label': '全部', 'value': null},
    {'label': '收入', 'value': 0},
    {'label': '支出', 'value': 1},
  ];
  String currentCate = '全部';
  var categoryVal;
  int total;
  int pageNo = 1;

  @override
  void initState() { 
    super.initState();
    _getList(true);
  }

  Future _getList(refresh) async {
    if (refresh) {
      pageNo = 1;
    }
    if (_listData.length == total && !refresh) {
      G.toast('已加载全部');
      _controller.finishLoad(success: true, noMore: true);
      return null;
    }
    var params = {
      'pageNo': pageNo,
      'pageSize': 10,
      'fundDirection': categoryVal
    };
    print(params);
    void _api() async {
      var result = await FinanceApi().getPaymentHistory(params);
      print(result);
      Map resultData = result.data['data'];
      print(resultData.toString());
      if (resultData == null) return;
      if (refresh) {
        setState(() {
          _listData = resultData['records'];
          total = resultData['total'];
        });
      } else {
        _listData.addAll(resultData['records']);
        setState(() {
          total = resultData['total'];
          if (pageNo <= resultData['pages']) {
            pageNo += 1;
          }
        });
      }
    }

    _api();
  }

  _showPickerCate() {
    List<PickerItem<dynamic>> testArray = categoryList.map<PickerItem>((item) => PickerItem(text: Text(item['label']), value: item['value'])).toList();
    Picker picker = new Picker(
      adapter: PickerDataAdapter(data: testArray),
      cancelText: '取消',
      confirmText: '确认',
      // changeToFirst: true,
      // textAlign: TextAlign.left,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues().first);
        print(picker.adapter.text);
        setState(() {
          currentCate = categoryList[value.first]['label'];
        });
        categoryVal = picker.getSelectedValues().first;
        _getList(true);
      }
    );
    picker.showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        leading: BackButton(
          onPressed: () {
            G.navigateTo(context, '/walletMain',
                replace: true, transition: TransitionType.inFromLeft);
          },
        ),
        title: Text(
          '账单',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        )
      ),
      body: Container(
        color: hex('#F3F4F6'),
        // padding: EdgeInsets.symmetric(horizontal: G.setWidth(20), vertical: G.setHeight(30)),
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                minWidth: double.infinity
              ),
              height: G.setWidth(94),
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('账单类别', style: TextStyle(color: hex('#666'), fontSize: G.setSp(30)),),
                InkWell(
                  onTap: () {
                    _showPickerCate();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(G.setHeight(8))),
                    padding: EdgeInsets.only(
                        left: G.setWidth(20),
                        top: G.setHeight(10),
                        bottom: G.setHeight(10)),
                    child: Row(children: [
                      Text(
                        currentCate, 
                        style: TextStyle(color: hex('#424242'))
                      ),
                      Icon(Icons.arrow_drop_down, color: hex('#CCCCCC'))
                    ]),
                  ))
              ])
            ),
            Expanded(child: 
            Container(
              child: extended.NestedScrollViewInnerScrollPositionKeyWidget(
              Key('Tab-'),
              EasyRefresh(
                controller: _controller,
                header: vRefreshHeader,
                footer: vRefreshFooter,
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: _listData.length,
                    itemBuilder: (context, index) {
                      return billItem(_listData[index]);
                    }),
                emptyWidget: _listData.length == 0
                    ? Container(
                        margin: EdgeInsets.only(top: G.setHeight(240)),
                        child: VEmpty(hintText: '暂无任何账单哦～'),
                      )
                    : null,
                onLoad: () async {
                  _getList(false);
                },
                onRefresh: () async {
                  _getList(true);
                },
              ))
            )),
          ]
        ),
      ),
    );
  }

  Widget billItem(item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
      decoration: BoxDecoration(
        color: hex('#FFF')
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: G.setWidth(15)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: hex('#E5E6E5')))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              item['tradeStyleStr'], 
              style: TextStyle(
                fontSize: G.setSp(30),
                color: hex('#333'),
                fontWeight: FontWeight.w500
            )),
            G.spacing(10),
            Text(G.formatTime(item['tradeTime'], type: 'date'), style: TextStyle(color: hex('#999'), fontSize: G.setSp(24)),)
          ]),
          Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: item['fundDirection'] == 0 ? '+' : '-',
                      style: TextStyle(
                        fontSize: G.setSp(30),
                        color: hex('#333'),
                        fontWeight: FontWeight.w600
                      )
                    ),
                    TextSpan(
                      text: item['amount'].toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: G.setSp(30),
                        color: hex('#333'),
                        fontWeight: FontWeight.w600
                      )
                    )
                  ]
              )),
              G.spacing(10),
              Text('余额: ' + item['balance'].toStringAsFixed(2), style: TextStyle(color: hex('#999999')),)
            ]
          )
        ],),
      )
    );
  }
}