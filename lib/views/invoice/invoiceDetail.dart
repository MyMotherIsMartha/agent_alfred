import 'package:agent37_flutter/api/finance.dart';
import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/models/invoiceInfo.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/oss.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agent37_flutter/provide/user.dart';

class InvoiceDetail extends StatefulWidget {
  final String invoiceId;
  final String status;

  InvoiceDetail({this.invoiceId, this.status});
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  String invoiceId;
  String invoicePic;
  InvoiceInfoModel invoiceInfo;
  var invoiceFuture;

  @override
  void initState() { 
    super.initState();
    invoiceId = widget.invoiceId;
    invoiceFuture = _getInvoiceInfo();
  }

  Future _getInvoiceInfo() async {
    var result = await OrderApi().getMakeMoneyById(invoiceId);
    Map resultData = result.data['data'];
    invoiceInfo = InvoiceInfoModel.fromJson(resultData);
    invoicePic = invoiceInfo.checkInvoiceUrl;
    return 'end';
  }

  idCardImg() {
    return (invoicePic != null && invoicePic != '') ? NetworkImage(invoicePic) : AssetImage('lib/assets/images/wallet/invoice-upload-corner.png');
  }

  Widget uploadInvoice() {
    return InkWell(
      onTap: () {
        G.setContext(context);
        Oss.selectSource((path) {
          setState(() {
            invoicePic = path;
          });
        });
      },
      child: Stack(
          children: <Widget>[
            Container(
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                        // color: Colors.black26,
                image: DecorationImage(
                  image: idCardImg(),
                  fit: BoxFit.contain,
                ),
              ),
              width: G.setWidth(400),
              height: G.setHeight(256),
              // child: Image(image: new AssetImage('lib/assets/images/enterprise/idCardFront.png')),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                // borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              width: G.setWidth(400),
              height: G.setHeight(256),
            ),
            Container(
              width: G.setWidth(400),
              height: G.setHeight(256),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: G.setWidth(60),
                    height: G.setWidth(60),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/assets/images/wallet/plus.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text('点击上传发票', style: TextStyle(color: Colors.white, fontSize: G.setSp(24)))
                ],
              ),
            ),
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
        str = '未知发票类型';
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

  void submitFunc() async {
    var params = {
      "invoiceUrl": invoicePic,
      "statisticsMakeMoneyId": invoiceId
    };
    print(params);
    var result = await OrderApi().uploadInvoice(params);
    print(result.data['data']);
    if (result.data['code'] == 200) {
      var appTitle = FluroConvertUtils.fluroCnParamsEncode('上传发票');
      G.navigateTo(context, '/resultPage?status=12&title=$appTitle&haveExit=no');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.invoiceId);
    print(widget.status);
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        // brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        title: Text(
          '上传发票',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: invoiceFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    G.spacing(20),
                    VField(label: '开票金额', fieldVal: '¥' + invoiceInfo.serviceCharge.toStringAsFixed(2)),
                    VField(label: '开票类型', fieldVal: getOrderTypeStr(invoiceInfo.orderType)),
                    Container(
                      constraints: BoxConstraints(
                        minWidth: double.infinity
                      ),
                      padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setWidth(12)),
                      child: Text('开票信息', style: TextStyle(fontSize: G.setSp(24), color: hex('#999'))),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true, 
                      itemCount: invoiceInfo.invoiceItems.length,
                      itemBuilder: (context, index) {
                          return VField(label: invoiceInfo.invoiceItems[index].invoiceItemContent, fieldVal: invoiceInfo.invoiceItems[index].invoiceItemName);
                      }),
                    G.spacing(20),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: G.setWidth(32), horizontal: G.setWidth(30)),
                      child: Row(
                        children: [
                          Text('上传发票'),
                          G.spacingWidth(80),
                          uploadInvoice()
                        ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: G.setWidth(40)),
                      margin: EdgeInsets.only(top: G.setWidth(60)),
                      child: VButton(text: '提交审核', fn: submitFunc, disabled: invoicePic == null || invoicePic == ''),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
    );
  }
}