import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/models/address.dart';
import 'package:agent37_flutter/models/gift-packages.dart';
import 'package:agent37_flutter/provide/address.dart';
import 'package:agent37_flutter/utils/event_bus.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:agent37_flutter/views/login/components/gift-item.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  AddressProvide addressProvide;
  List<Widget> giftItemList = <Widget>[];
  List<GiftPackagesModel> packageList = <GiftPackagesModel>[];
  String selectedPackageNo;
  String selectedPackagePrice;
  String selectedGiftPackagePromotionNo;

  @override
  Widget build(BuildContext context) {
    addressProvide = Provider.of<AddressProvide>(context);
    return Scaffold(
      backgroundColor: hex('#E7D1A8'),
      body: SingleChildScrollView(
        child: Container(
          width: G.setWidth(750),
          child: Column(
            children: <Widget>[_bannerTop(), _addressWrap(), _giftWrapWidget()],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: hex('#fff'),
        width: double.infinity,
        height: G.setHeight(120),
        alignment: Alignment.center,
        child: FlatButton(
            onPressed: () {
              if (!Validate.isNon(selectedPackageNo)) {
                G.router.navigateTo(
                    context,
                    '/create-order?price=' +
                        selectedPackagePrice +
                        '&no=' +
                        selectedPackageNo +
                        '&promotionNo=' +
                        selectedGiftPackagePromotionNo);
              }
            },
            child: Container(
              width: G.setWidth(690),
              height: G.setHeight(80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(G.setWidth(40)),
                  gradient:
                      LinearGradient(colors: [hex('#4C5873'), hex('#333949')])),
              child: Text('确认开通',
                  style: TextStyle(
                    fontSize: G.setSp(36),
                    color: hex('#E7D1A8'),
                  )),
            )),
      ),
    );
  }

  Widget _bannerTop() {
    return Container(
      // padding: EdgeInsets.only(top: G.statusHeight),
      width: double.infinity,
      height: G.setHeight(570),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/cu-head_bg.png"),
              fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[_headBar(), _headSwiper()],
      ),
    );
  }

  Widget _headBar() {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: hex('#E7D1A8')),
      title: Text(
        '代理商开通',
        style: TextStyle(color: hex('#E7D1A8'), fontSize: G.setSp(36)),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text('退出',
                style: TextStyle(color: hex('#E7D1A8'), fontSize: G.setSp(32))))
      ],
    );
  }

  Widget _headSwiper() {
    return Container(
      margin: EdgeInsets.only(top: G.setHeight(24)),
      height: G.setHeight(330),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _adItem(adList[index]);
        },
        autoplay: true,
        itemCount: adList.length,
        containerWidth: G.setWidth(300),
        itemWidth: 200,
        // layout: SwiperLayout.STACK,
        viewportFraction: 0.6,
        scale: 0.7,
      ),
    );
  }

  List<AdItem> adList = [
    AdItem(
        icon: '这是一张icon',
        title: '奢侈品9.5折',
        desc: '天猫奢侈品9.5折，预计可省1000元，还可以享受尊贵会员超值待遇，快来抢购吧'),
    AdItem(
        icon: '这是一张icon',
        title: '网易严选7.5折',
        desc: '天猫奢侈品9.5折，预计可省1000元，还可以享受尊贵会员超值待遇，快来抢购吧'),
    AdItem(
        icon: '这是一张icon',
        title: '小米家电7.5折',
        desc: '天猫奢侈品9.5折，预计可省1000元，还可以享受尊贵会员超值待遇，快来抢购吧')
  ];

  Widget _adItem(AdItem item) {
    return Container(
      // height: G.setHeight(330),
      // width: G.setWidth(400),
      padding: EdgeInsets.fromLTRB(
          G.setWidth(45), G.setWidth(30), G.setWidth(45), 0),
      decoration: BoxDecoration(
          color: hex('#44454D'),
          borderRadius: BorderRadius.circular(G.setSp(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("lib/assets/images/icon_temp1.png",
              width: G.setWidth(80), height: G.setWidth(80)),
          G.spacing(10),
          Text(item.title,
              style: TextStyle(
                  color: hex('#E7D1A8'),
                  fontSize: G.setSp(30),
                  fontWeight: FontWeight.w500)),
          G.spacing(20),
          Text(item.desc,
              style: TextStyle(
                  color: hex('#E7D1A8'),
                  fontSize: G.setSp(24),
                  height: 33 / 24,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }

  Widget _addressWrap() {
    return InkWell(
        onTap: () {
          G.setContext(context);
          G.router.navigateTo(context, '/address');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: G.setHeight(30)),
          padding: EdgeInsets.all(G.setWidth(30)),
          width: G.setWidth(710),
          decoration: BoxDecoration(
              color: hex('#fff'),
              borderRadius: BorderRadius.circular(G.setWidth(20))),
          child: FutureBuilder(
            future: _getAddressInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                AddressModel address = addressProvide.address;
                if (address == null) {
                  return _nullAddress();
                } else {
                  return _addressInfo();
                }
              }
              return Container();
            },
          ),
        ));
  }

  Widget _nullAddress() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              iconmap(color: hex('#666'), size: G.setWidth(30)),
              Container(width: G.setWidth(13)),
              Text('请填写您的收货地址',
                  style: TextStyle(color: hex('#999'), fontSize: G.setSp(30)))
            ],
          ),
          iconarrow(size: G.setSp(30))
        ],
      ),
    );
  }

  Widget _addressInfo() {
    AddressModel address = addressProvide.address;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  iconmap(color: hex('#666'), size: G.setWidth(30)),
                  Container(width: G.setWidth(13)),
                  Text(address.consigneeName,
                      style: TextStyle(color: hex('#333'), fontSize: 15)),
                  Container(width: G.setWidth(20)),
                  Text(address.mobile,
                      style: TextStyle(color: hex('#333'), fontSize: 14))
                ],
              ),
              Text(
                  address.province +
                      address.city +
                      address.district +
                      address.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: hex('#999999'), fontSize: G.setSp(24)))
            ],
          ),
          iconarrow(size: G.setSp(30))
        ],
      ),
    );
  }

  Future _getAddressInfo() async {
    await addressProvide.getAddress();
    return 'end';
  }

  Widget _giftWrapWidget() {
    return Container(
      padding: EdgeInsets.only(bottom: G.setHeight(20)),
      child: FutureBuilder(
        future: _getGiftsList(),
        builder: (context, shapshot) {
          if (shapshot.hasData) {
            return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
                child: Column(
                  children: giftItemList,
                ));
          } else {
            return VLoading();
          }
        },
      ),
    );
  }

  Future _getGiftsList() async {
    if (packageList.length != 0) {
      List<Widget> list = <Widget>[];
      packageList.forEach((gift) {
        list.add(GiftItem(
          item: gift,
          selectedPackageNo: selectedPackageNo,
          fn: () {
            setState(() {
              selectedPackageNo = gift.giftPackageNo;
              selectedGiftPackagePromotionNo =
                  Validate.isNon(selectedGiftPackagePromotionNo)
                      ? ''
                      : gift.giftPackagePromotionNo;
              selectedPackagePrice = gift.promotionAmount != null
                  ? gift.promotionAmount.toString()
                  : gift.amount.toString();
            });
          },
        ));
      });
      setState(() {
        giftItemList = list;
      });
      return 'end';
    }
    var result = await MemberApi().giftpackage();
    if (result.data['code'] == 200 && result.data['data'] != null) {
      List<Widget> list = <Widget>[];
      List<GiftPackagesModel> giftList = <GiftPackagesModel>[];
      result.data['data'].forEach((item) {
        GiftPackagesModel gift = GiftPackagesModel.fromJson(item);

        // list.add(_giftItem(gift));
        list.add(GiftItem(
          item: gift,
          selectedPackageNo: selectedPackageNo,
          fn: () {
            setState(() {
              selectedPackageNo = item.giftPackageNo;
              selectedGiftPackagePromotionNo =
                  Validate.isNon(selectedGiftPackagePromotionNo)
                      ? ''
                      : item.giftPackagePromotionNo;
              selectedPackagePrice = item.promotionAmount != null
                  ? item.promotionAmount.toString()
                  : item.amount.toString();
            });
          },
        ));
        giftList.add(gift);
      });
      setState(() {
        giftItemList = list;
        packageList = giftList;
      });
      return 'end';
    }
  }

  // Widget _giftItem(GiftPackagesModel item) {
  //   return Stack(
  //     children: <Widget>[
  //       InkWell(
  //           onTap: () {
  //             setState(() {
  //               selectedPackageNo = item.giftPackageNo;
  //               selectedGiftPackagePromotionNo =
  //                   Validate.isNon(selectedGiftPackagePromotionNo)
  //                       ? ''
  //                       : item.giftPackagePromotionNo;
  //               selectedPackagePrice = item.promotionAmount != null
  //                   ? item.promotionAmount.toString()
  //                   : item.amount.toString();
  //             });
  //           },
  //           child: Container(
  //             margin: EdgeInsets.only(top: G.setHeight(20)),
  //             height: G.setHeight(368),
  //             padding: EdgeInsets.fromLTRB(
  //                 G.setWidth(30), G.setWidth(30), G.setWidth(30), 0),
  //             decoration: BoxDecoration(
  //                 color: hex('#FFF'),
  //                 borderRadius: BorderRadius.circular(G.setWidth(20)),
  //                 border: selectedPackageNo == item.giftPackageNo
  //                     ? Border.all(color: hex('#A37531'))
  //                     : Border.all(color: Colors.transparent)),
  //             child: Column(
  //               children: <Widget>[
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Text(item.name,
  //                         style: TextStyle(
  //                             fontSize: G.setSp(30), color: hex('#333'))),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.end,
  //                       children: <Widget>[
  //                         RichText(
  //                           text: TextSpan(
  //                               text: '￥',
  //                               style: TextStyle(
  //                                   fontSize: G.setSp(24), color: hex('#333')),
  //                               children: <TextSpan>[
  //                                 TextSpan(
  //                                   text: item.promotionAmount == null
  //                                       ? '${item.amount}'
  //                                       : '${item.promotionAmount}',
  //                                   style: TextStyle(
  //                                       fontSize: G.setSp(32),
  //                                       color: hex('#333')),
  //                                 )
  //                               ]),
  //                         ),
  //                         item.promotionAmount != null
  //                             ? Text(
  //                                 '￥${item.amount}',
  //                                 style: TextStyle(
  //                                     decoration: TextDecoration.lineThrough,
  //                                     fontSize: G.setSp(24),
  //                                     color: hex('#999')),
  //                               )
  //                             : Container()
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //                 G.spacing(17),
  //                 Container(
  //                   height: G.setHeight(200),
  //                   child: ListView.builder(
  //                       scrollDirection: Axis.horizontal,
  //                       itemCount: item.appGoodses.length,
  //                       // padding: EdgeInsets.symmetric(horizontal: 20),
  //                       // padding: EdgeInsets.only(right: G.setWidth(20)),
  //                       // itemExtent: G.setWidth(150),
  //                       itemBuilder: (context, index) {
  //                         AppGoodses good = item.appGoodses[index];
  //                         return Container(
  //                             width: G.setWidth(164),
  //                             margin: index == item.appGoodses.length - 1
  //                                 ? EdgeInsets.zero
  //                                 : EdgeInsets.only(right: G.setWidth(20)),
  //                             child: Column(
  //                               children: <Widget>[
  //                                 Container(
  //                                   height: G.setHeight(150),
  //                                   width: G.setWidth(150),
  //                                   decoration: BoxDecoration(
  //                                       color: hex('#F5F5F5'),
  //                                       borderRadius: BorderRadius.circular(
  //                                           G.setWidth(10))),
  //                                   alignment: Alignment.center,
  //                                   child: Image.network(
  //                                     good.goodsMainImg,
  //                                     width: G.setWidth(110),
  //                                     height: G.setHeight(110),
  //                                     fit: BoxFit.fitWidth,
  //                                   ),
  //                                 ),
  //                                 G.spacing(10),
  //                                 Container(
  //                                   width: G.setWidth(150),
  //                                   child: Text(
  //                                     good.displayGoodsName,
  //                                     maxLines: 1,
  //                                     overflow: TextOverflow.ellipsis,
  //                                   ),
  //                                 )
  //                               ],
  //                             ));
  //                       }),
  //                 )
  //               ],
  //             ),
  //           )),
  //       selectedPackageNo == item.giftPackageNo
  //           ? Positioned(
  //               top: G.setHeight(25),
  //               right: G.setWidth(15),
  //               child: Image.asset('lib/assets/images/checked_icon.png',
  //                   width: G.setWidth(44), height: G.setHeight(44)),
  //             )
  //           : Container()
  //     ],
  //   );
  // }
}

class AdItem {
  String icon;
  String title;
  String desc;

  AdItem({this.icon, this.title, this.desc});
}
