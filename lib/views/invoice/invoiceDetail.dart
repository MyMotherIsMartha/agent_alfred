import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/models/invoiceInfo.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/oss.dart';
import 'package:color_dart/hex_color.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoiceDetail extends StatefulWidget {
  final String invoiceId;
  final String status;

  InvoiceDetail({this.invoiceId, this.status});
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState();
}

class _InvoiceDetailState extends State<InvoiceDetail> {
  String invoiceId;
  String invoiceStatus;
  String invoicePic;
  InvoiceInfoModel invoiceInfo;
  var invoiceFuture;
  List collapseList = [];
  bool collapse = false;
  bool isEditStatus = false;

  @override
  void initState() { 
    super.initState();
    invoiceId = widget.invoiceId;
    invoiceStatus = widget.status;
    invoiceFuture = _getInvoiceInfo();
  }

  Future _getInvoiceInfo() async {
    var result = await OrderApi().getMakeMoneyById(invoiceId);
    Map resultData = result.data['data'];
    print(resultData);
    setState(() {
      invoiceInfo = InvoiceInfoModel.fromJson(resultData);
      if (invoiceInfo.invoiceItems.length > 4) {
        collapseList = invoiceInfo.invoiceItems.sublist(0, 4);
      } else {
        collapseList = invoiceInfo.invoiceItems;
      }
      isEditStatus = invoiceInfo.invoiceStatus == 3;
      invoicePic = invoiceInfo.checkInvoiceUrl;
    });
    
    return 'end';
  }

  idCardImg() {
    return (invoicePic != null && invoicePic != '') ? NetworkImage(invoicePic) : AssetImage('lib/assets/images/wallet/invoice-upload-corner.png');
  }

  Widget uploadInvoice() {
    return InkWell(
      onTap: () {
        if (isEditStatus) {
          G.setContext(context);
          Oss.selectSource((path) {
            setState(() {
              invoicePic = path;
            });
          });
        } else {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  child: Container(
                    width: G.setWidth(750),
                    // height: G.setWidth(200),
                    // width: G.setWidth(400),
                    height: G.setHeight(480),
                    child: Container(
                    
                    // alignment: Alignment.center,
                    
                    decoration: BoxDecoration(
                              // color: Colors.black26,
                              // color: Colors.yellow,
                      image: DecorationImage(
                        image: idCardImg(),
                        fit: BoxFit.contain,
                      ),
                    ),
                    
                    // child: Image(image: new AssetImage('lib/assets/images/enterprise/idCardFront.png')),
                  ),
                )
              );
              
            }
          );
        }
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
            isEditStatus ? Container(
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
            ) : Container(),
          ],
        ),
      );
                
  }

  Widget topArea() {
    if (invoiceStatus == '3') {
      return Container();
    } else if (invoiceStatus == '4') {
      return GestureDetector(
        onTap: () {
          G.navigateTo(context, '/sendAdress');
        },
        child: Container(
          width: double.infinity,
          color: hex('#CABEA6'),
          padding: EdgeInsets.all(G.setWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('待核验', style: TextStyle(color: Colors.white, fontSize: G.setSp(28))),
                  Text('已提交成功，请尽快寄出发票以便核验', style: TextStyle(color: Colors.white, fontSize: G.setSp(24)))
                ]
              ),
              Row(
                children: [
                  Text('查看寄票地址', style: TextStyle(color: Colors.white, fontSize: G.setSp(28))),
                  Icon(Icons.arrow_right, color: Colors.white)
                ]
              )
            ],
          )
        )
      );
    } else if (invoiceStatus == '5') {
      return Container(
        width: double.infinity,
        color: hex('#CABEA6'),
        padding: EdgeInsets.all(G.setWidth(20)),
        child:  Text('已开票', style: TextStyle(color: Colors.white, fontSize: G.setSp(28), fontWeight: FontWeight.w400)),
      );
    } else if (invoiceStatus == '6') {
      return Container(
        width: double.infinity,
        color: hex('#CABEA6'),
        padding: EdgeInsets.all(G.setWidth(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('核验失败', style: TextStyle(color: Colors.white, fontSize: G.setSp(28))),
              Text(invoiceInfo.checkRefuseReason ?? '', style: TextStyle(color: Colors.white, fontSize: G.setSp(24)))
            ]
          ),
      );
    } else if (invoiceStatus == '7') {
      return Container(
        width: double.infinity,
        color: hex('#CABEA6'),
        padding: EdgeInsets.all(G.setWidth(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('已开票', style: TextStyle(color: Colors.white, fontSize: G.setSp(28)))
            ]
          ),
      );
    } else {
      return Container(
        child:Text('未知发票状态')
      );
    }
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
        str = '待核验';
        break;
      case 6:
        str = '核验失败';
        break;
      case 7:
        str = '已开票';
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
      // var appTitle = FluroConvertUtils.fluroCnParamsEncode('上传发票');
      G.navigateTo(context, '/resultPage?status=12&haveExit=no', replace: true);
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
          invoiceStatus == '7' ? '查看发票' : '上传发票',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
        leading: BackButton(
          onPressed: () {
            G.navigateTo(context, '/invoiceList',
                replace: true, transition: TransitionType.inFromLeft);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: invoiceFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    topArea(),
                    G.spacing(20),
                    VField(label: '开票金额', fieldVal: '¥' + invoiceInfo.serviceCharge.toStringAsFixed(2)),
                    VField(label: '开票类型', fieldVal: '增值税发票'),
                    Container(
                      constraints: BoxConstraints(
                        minWidth: double.infinity
                      ),
                      padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setWidth(12)),
                      child: Text('开票信息', style: TextStyle(fontSize: G.setSp(24), color: hex('#999'))),
                    ),
                    MediaQuery.removePadding(
                      removeBottom: true,
                      context:  context,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true, 
                          itemCount: collapseList.length,
                          itemBuilder: (context, index) {
                              return VField(label: collapseList[index].invoiceItemName, fieldVal: collapseList[index].invoiceItemContent);
                          }),
                    ),
                    invoiceInfo.invoiceItems.length > 4 ? 
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          collapse = !collapse;
                          if (collapse) {
                            collapseList = invoiceInfo.invoiceItems;
                          } else {
                            collapseList = invoiceInfo.invoiceItems.sublist(0, 4);
                          }
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: G.setWidth(20)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(collapse ? '收起' : '展开更多信息', style: TextStyle(color: hex('#999'), fontSize: G.setSp(24))),
                            Icon(collapse ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: hex('#999'))
                          ],
                        )
                      )
                    ) : Container(),
                    
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
                    invoiceStatus != '7' ?
                    Container(
                      padding: EdgeInsets.only(bottom: G.setWidth(40)),
                      margin: EdgeInsets.only(top: G.setWidth(60)),
                      child: isEditStatus ? 
                      VButton(text: '提交审核', fn: submitFunc, disabled: invoicePic == null || invoicePic == '')
                      : VButton(text: '编辑', fn: () {
                        setState(() {
                          isEditStatus = true;
                        });
                      }),
                    ) : Container()
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