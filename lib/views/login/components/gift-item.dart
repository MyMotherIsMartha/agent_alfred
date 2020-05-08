import 'package:agent37_flutter/models/gift-packages.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class GiftItem extends StatelessWidget {
  final GiftPackagesModel item;
  final String selectedPackageNo;
  final Function fn;
  GiftItem({this.item, this.selectedPackageNo, this.fn});
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        InkWell(
            onTap: () {
              fn();
            },
            child: Container(
              margin: EdgeInsets.only(top: G.setWidth(20)),
              height: G.setWidth(368),
              padding: EdgeInsets.fromLTRB(
                  G.setWidth(30), G.setWidth(30), G.setWidth(30), 0),
              decoration: BoxDecoration(
                  color: hex('#FFF'),
                  borderRadius: BorderRadius.circular(G.setWidth(20)),
                  border: selectedPackageNo == item.giftPackageNo
                      ? Border.all(color: hex('#A37531'))
                      : Border.all(color: Colors.transparent)),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(item.name,
                          style: TextStyle(
                              fontSize: G.setSp(30), color: hex('#333'))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: '￥',
                                style: TextStyle(
                                    fontSize: G.setSp(24), color: hex('#333')),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: item.promotionAmount == null
                                        ? '${item.amount}'
                                        : '${item.promotionAmount}',
                                    style: TextStyle(
                                        fontSize: G.setSp(32),
                                        color: hex('#333')),
                                  )
                                ]),
                          ),
                          item.promotionAmount != null
                              ? Text(
                                  '￥${item.amount}',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: G.setSp(24),
                                      color: hex('#999')),
                                )
                              : Container()
                        ],
                      )
                    ],
                  ),
                  G.spacing(17),
                  Container(
                    height: G.setWidth(210),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: item.appGoodses.length,
                        // padding: EdgeInsets.symmetric(horizontal: 20),
                        // padding: EdgeInsets.only(right: G.setWidth(20)),
                        // itemExtent: G.setWidth(150),
                        itemBuilder: (context, index) {
                          AppGoodses good = item.appGoodses[index];
                          return Container(
                              width: G.setWidth(164),
                              margin: index == item.appGoodses.length - 1
                                  ? EdgeInsets.zero
                                  : EdgeInsets.only(right: G.setWidth(20)),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: G.setWidth(150),
                                    width: G.setWidth(150),
                                    decoration: BoxDecoration(
                                        color: hex('#F5F5F5'),
                                        borderRadius: BorderRadius.circular(
                                            G.setWidth(10))),
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      good.goodsMainImg,
                                      width: G.setWidth(110),
                                      height: G.setWidth(110),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  G.spacing(10),
                                  Container(
                                    width: G.setWidth(150),
                                    child: Text(
                                      good.displayGoodsName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontSize: G.setSp(24)
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        }),
                  )
                ],
              ),
            )),
        selectedPackageNo == item.giftPackageNo
            ? Positioned(
                top: G.setWidth(8),
                right: G.setWidth(-8),
                child: Image.asset('lib/assets/images/checked_icon.png',
                    width: G.setWidth(44), height: G.setWidth(44)),
              )
            : Container()
      ],
    );
    
  }
}