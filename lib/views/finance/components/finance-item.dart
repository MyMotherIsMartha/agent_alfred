import 'package:agent37_flutter/models/finance.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class FinanceItem extends StatelessWidget {
  final FinanceItemModel item;
  final int status;
  FinanceItem(this.item, this.status);

  @override
  Widget build(BuildContext context) {
    // 财务列表子项产品内容
    List<Widget> _financeItemProduct() {
      Widget product(RefundOrders product) {
        return Stack(overflow: Overflow.visible, children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(vertical: G.setWidth(30)),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: hex('#ddd'), width: G.setWidth(1)))),
              child: Column(
                children: <Widget>[
                  Container(
                    width: G.setWidth(710),
                    // padding: EdgeInsets.only(bottom: G.setWidth(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: G.setWidth(170),
                          height: G.setWidth(170),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Validate.isNon(product.orderImageUrl)
                                  ? item.toRole == null
                                      ? Image.asset(
                                          '${G.imgBaseUrl}package_icon.png')
                                      : Image.asset(
                                          '${G.imgBaseUrl}member-order${item.toRole.toString()}_icon.png')
                                  : CachedNetworkImage(
                                      imageUrl: product.orderImageUrl,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.fill,
                                    ))
                          // decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.circular(G.setWidth(10)),
                          //     image: product.orderImageUrl != null
                          //     ? DecorationImage(
                          //         image: NetworkImage(
                          //           // 产品图
                          //           product.orderImageUrl,
                          //         ),
                          //         fit: BoxFit.fill)
                          //         : null
                          //         )
                          ,
                        ),
                        Expanded(
                          // 内容区域
                          // flex: 1,
                          child: Container(
                              height: G.setWidth(190),
                              padding: EdgeInsets.symmetric(
                                  horizontal: G.setWidth(20),
                                  vertical: G.setWidth(10)),
                              child: Column(
                                // 规格说明
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // 标题与价格
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          width: G.setWidth(324),
                                          child: Text(
                                            product.goodsName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: G.setSp(26),
                                                color: hex('333')),
                                          )),
                                      Text.rich(
                                        TextSpan(
                                            style: TextStyle(
                                                fontSize: G.setSp(24),
                                                color: hex('#333')),
                                            text: '￥',
                                            children: [
                                              TextSpan(
                                                  text: product.refundAmount
                                                      .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      fontSize: G.setSp(26),
                                                      color: hex('#333'))),
                                            ]),
                                      )
                                    ],
                                  ),
                                  G.spacing(10),
                                  // 规格 数量
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(product.spec ?? '',
                                          style: TextStyle(
                                              color: hex('#85868A'),
                                              fontSize: G.setSp(26))),
                                      item.orderType == 7
                                          ? Text('X${product.quantity}',
                                              style: TextStyle(
                                                  color: hex('#85868A'),
                                                  fontSize: G.setSp(26)))
                                          : Container()
                                    ],
                                  ),
                                  G.spacing(20),
                                  product.refundOrderTime != null
                                      ? Text(
                                          '退款时间：${G.formatTime(product.refundOrderTime, type: 'date')}',
                                          style: TextStyle(
                                              color: hex('#85868A'),
                                              fontSize: G.setSp(24)))
                                      : Container()
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          // Divider(color: hex('D7D7D7'),),
          Positioned(
            top: 0,
            right: G.setWidth(-20),
            child: Image.asset(
              '${G.imgBaseUrl}pic-icon/refund_icon.png',
              width: G.setWidth(78),
              height: G.setWidth(78),
            ),
          )
          // Divider(color: hex('#d7d7d7'))
        ]);
      }

      List<RefundOrders> productList = item.refundOrders;
      return productList.map((type) {
        return product(type);
      }).toList();
    }

    // 财务列表页脚
    Widget _financeItemFooter() {
      return Container(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxWidth: G.setWidth(300)),
                    // width: G.setWidth(360),
                    child: Text('购买企业：${item.enterpriseName ?? ""}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: hex('#666'),
                            fontSize: G.setSp(24),
                            height: 36 / 24)),
                  ),
                  // G.spacing(6),

                  Text('支付时间：${G.formatTime(item.payTime, type: "date")}',
                      style: TextStyle(
                          color: hex('#666'),
                          fontSize: G.setSp(24),
                          height: 36 / 24))
                ],
              ),
              Container(
                  // constraints: BoxConstraints(
                  //   maxWidth: G.setWidth(550)
                  // ),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text.rich(TextSpan(
                      text: '订单金额：',
                      style: TextStyle(
                          color: hex('#252525'),
                          fontSize: G.setSp(30),
                          height: 36 / 24),
                      children: [
                        TextSpan(
                            text: '￥',
                            style: TextStyle(
                                color: hex('#252525'), fontSize: G.setSp(24))),
                        TextSpan(
                            text: item.totalOrderAmount.toStringAsFixed(2),
                            style: TextStyle(
                                color: hex('#252525'), fontSize: G.setSp(30))),
                      ])),
                  Row(
                    children: <Widget>[
                      item.commissionFeeRate != null && status != 3
                          ? Text(
                              '比例：${item.commissionFeeRate.toStringAsFixed(2)}%',
                              style: TextStyle(
                                  height: 36 / 24,
                                  color: hex('#252525'),
                                  fontSize: G.setSp(26)))
                          : Container(),
                      item.commissionFeeRate != null &&
                              status != 3 &&
                              item.originCommissionFeeRate != null &&
                              item.commissionFeeRate !=
                                  item.originCommissionFeeRate
                          ? Container(
                              margin: EdgeInsets.only(left: G.setWidth(20)),
                              child: Text(
                                  '${item.originCommissionFeeRate.toStringAsFixed(2)}%',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      height: 36 / 24,
                                      color: hex('#999'),
                                      fontSize: G.setSp(26))),
                            )
                          : Container(),
                    ],
                  ),
                ],
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              status != 3
                  ? Text.rich(TextSpan(
                      text: '预估服务费：',
                      style: TextStyle(
                          height: 36 / 24,
                          color: hex('#252525'),
                          fontSize: G.setSp(30)),
                      children: [
                          TextSpan(
                              text: '￥',
                              style: TextStyle(
                                  height: 36 / 24,
                                  color: hex('#252525'),
                                  fontSize: G.setSp(24))),
                          TextSpan(
                              text: item.commission.toStringAsFixed(2),
                              style: TextStyle(
                                  height: 36 / 24,
                                  color: hex('#252525'),
                                  fontSize: G.setSp(30))),
                        ]))
                  : Container(),
              status != 3 &&
                      item.originCommission != null &&
                      item.originCommission != item.commission
                  ? Container(
                      margin: EdgeInsets.only(left: G.setWidth(20)),
                      child: Text.rich(TextSpan(
                          children: [
                            TextSpan(
                                text: '￥',
                                style: TextStyle(
                                    color: hex('#999'),
                                    fontSize: G.setSp(24))),
                            TextSpan(
                                text: item.originCommission.toStringAsFixed(2),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: hex('#999'),
                                    fontSize: G.setSp(24))),
                          ])))
                  : Container(),
            ],
          )
        ],
      ));
    }

    return Container(
      width: G.setWidth(710),
      margin: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
      padding: EdgeInsets.all(G.setWidth(20)),
      decoration: BoxDecoration(
          color: hex('#FFF'),
          borderRadius: BorderRadius.circular(G.setWidth(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('单号：${item.orderNo}'),
                  item.isShowTodayFlag
                      ? Container(
                          margin: EdgeInsets.only(left: G.setWidth(10)),
                          child: Image.asset(
                            '${G.imgBaseUrl}pic-icon/new-ellipse.png',
                            width: G.setWidth(60),
                            height: G.setWidth(34),
                          ),
                        )
                      : Container()
                ],
              ),
              Text(['交易成功', '交易关闭', '交易完结'][item.status])
            ],
          ),
          Container(
            height: G.setWidth(18),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: hex('#D7D7D7'), width: G.setWidth(1)))),
          ),
          FinanceProduct(item),
          item.refundOrders != null && item.refundOrders.length > 0
              ? Column(children: _financeItemProduct())
              : Container(),
          G.spacing(16),
          _financeItemFooter()
        ],
      ),
    );
  }
}

class FinanceProduct extends StatelessWidget {
  final FinanceItemModel data;
  FinanceProduct(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: G.setWidth(30)),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: hex('#ddd'), width: G.setWidth(1)))),
        child: Column(
          children: <Widget>[
            Container(
              width: G.setWidth(710),
              // padding: EdgeInsets.only(bottom: G.setWidth(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: G.setWidth(170),
                    height: G.setWidth(170),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(G.setWidth(10)),
                        image: !Validate.isNon(data.orderImageUrl)
                            ? DecorationImage(
                                image: NetworkImage(
                                  // 产品图
                                  data.orderImageUrl,
                                ),
                                fit: BoxFit.fill)
                            : null),
                    child: !Validate.isNon(data.orderImageUrl)
                        ? null
                        : data.toRole == null
                            ? Image.asset('${G.imgBaseUrl}package_icon.png')
                            : Image.asset(
                                '${G.imgBaseUrl}member-order${data.toRole.toString()}_icon.png'),
                  ),
                  Expanded(
                    // 内容区域
                    // flex: 1,
                    child: Container(
                        height: G.setWidth(170),
                        padding:
                            EdgeInsets.symmetric(horizontal: G.setWidth(20)),
                        child: Column(
                          // 规格说明
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // 标题与价格
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: G.setWidth(284),
                                    child: Text(
                                      data.goodsName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: G.setSp(26),
                                          color: hex('333')),
                                    )),
                                Text.rich(
                                  TextSpan(
                                      style: TextStyle(
                                          fontSize: G.setSp(24),
                                          color: hex('#333')),
                                      text: '￥',
                                      children: [
                                        TextSpan(
                                            text: data.goodsAmount
                                                .toStringAsFixed(2),
                                            style: TextStyle(
                                                fontSize: G.setSp(26),
                                                color: hex('#333'))),
                                      ]),
                                )
                              ],
                            ),
                            G.spacing(10),
                            // 规格 数量
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(data.spec ?? '',
                                    style: TextStyle(
                                        color: hex('#85868A'),
                                        fontSize: G.setSp(26))),
                                data.orderType == 7
                                    ? Text('X${data.quantity}',
                                        style: TextStyle(
                                            color: hex('#85868A'),
                                            fontSize: G.setSp(26)))
                                    : Container()
                              ],
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
