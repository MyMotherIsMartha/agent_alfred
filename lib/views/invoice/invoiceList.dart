import 'package:agent37_flutter/api/finance.dart';
import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/api/system.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:provider/provider.dart';
import 'package:agent37_flutter/provide/user.dart';

class InvoiceList extends StatefulWidget {
  @override
  _InvoiceListState createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  EasyRefreshController _controller = EasyRefreshController();
  var scrollController = new ScrollController();
  int monthlyStart;
  int monthlyEnd;
  List _invoiceList = [];


  Future _getSystemSetting() async {
    var result = await SystemApi().getSystemSettings();
    var resultData = result.data['data'];
    setState(() {
      monthlyStart = resultData['invoiceUploadBeginDateMonthly'];
      monthlyEnd = resultData['invoiceUploadEndDateMonthly'];
    });
    print(resultData.toString());
  }

  Future _getInvoiceList() async {
    var params = {
      'invoiceStatus': null
    };
    var result = await OrderApi().getMakeMoneyList(params);
    var resultData = result.data['data'];
    // var resultItem = resultData.first;
    // for(var i = 0; i < 3; i++) {
    //   resultItem['settlementStatisticsOrderDetails'].add(resultItem['settlementStatisticsOrderDetails'].first);
    // }
    setState(() {
      _invoiceList = resultData;
    });
    print(resultData.toString());
  }

  @override
  void initState() { 
    super.initState();
    _getSystemSetting();
    _getInvoiceList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        title: Text(
          '服务费发票',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
      ),
      body: Column(
          children: [
            Container(
              color: hex('#CABEA6'),
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setWidth(12)),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.white, size: G.setSp(36),),
                  Text(' 每月${monthlyStart}日-${monthlyEnd}日为开票时间，请勿错过', style: TextStyle(color: Colors.white, fontSize: G.setSp(24)))
                ]
              )
            ),
            Expanded(
              child: 
              ListView.builder(
                controller: scrollController,
                itemCount: _invoiceList.length,
                itemBuilder: (context, index) {
                  return childList(_invoiceList[index]);
                }),
            )
          ]
        )
      ,
    );
  }

  Widget childList(item) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(20), vertical: G.setWidth(10)),
            child: Text('${item['year']}年${item['month']}月', style: TextStyle(color: hex('#666'), fontSize: G.setSp(24)))
          ),
          Container(
            color: Colors.white,
            child: 
            ListView.builder(
              shrinkWrap: true, 
              itemCount: item['settlementStatisticsOrderDetails'].length,
              itemBuilder: (context, index) {
                return childItem(item['settlementStatisticsOrderDetails'][index]);
            }),
          )
        ],
      ),
    );
  }

  String getOrderTypeStr(int type) {
    String str;
    switch (type) {
      case 7:
        str = '采购商品服务费';
        break;
      case 8:
        str = '会员服务费';
        break;
      case 11:
        str = '礼包服务费';
        break;
      default:
        str = '采购商品服务费';
    }
    return str;
  }

  String getInvoiceStatusStr(int type) {
    String str;
    switch (type) {
      case 3:
        str = '未开票';
        break;
      case 4:
        str = '待核验';
        break;
      case 5:
        str = '已开票';
        break;
      case 6:
        str = '核验失败';
        break;
      default:
        str = '未知';
    }
    return str;
  }

  Widget childItem(item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
      child: InkWell(
        onTap: () {
          G.navigateTo(context, '/invoiceDetail?invoiceId=' + item['statisticsMakeMoneyId'] + '&status=' + item['invoiceStatus'].toString());
        },
        child: Container(
          height: G.setWidth(80),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: hex('#eee'), width: G.setWidth(1)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: getOrderTypeStr(item['orderType']),
                    style: TextStyle(color: hex('#333'), fontSize: G.setSp(28), fontWeight: FontWeight.w400)
                  ),
                  TextSpan(
                    text: '      ¥${item['serviceCharge'].toStringAsFixed(2)}',
                    style: TextStyle(color: hex('#333'), fontSize: G.setSp(28), fontWeight: FontWeight.w400)
                  )
                ]
              )),
              Row(
                children: [
                  Text(getInvoiceStatusStr(item['invoiceStatus']), style: TextStyle(color: hex('#999'), fontSize: G.setSp(28))),
                  Icon(Icons.keyboard_arrow_right, color: hex('#999999'),)
                ]
              )
            ]
          )
        ),
      )
    );
  }
}