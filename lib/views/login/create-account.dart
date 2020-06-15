import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/models/address.dart';
import 'package:agent37_flutter/models/gift-packages.dart';
import 'package:agent37_flutter/provide/address.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:agent37_flutter/views/login/components/gift-item.dart';
import 'package:color_dart/color_dart.dart';
import 'package:fluro/fluro.dart';
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
  bool btnCanClick = true;

  @override
  Widget build(BuildContext context) {
    addressProvide = Provider.of<AddressProvide>(context);
    addressProvide.getAddress();
    return Scaffold(
      backgroundColor: hex('#E7D1A8'),
      body: Container(
        width: G.setWidth(750),
        child: Column(
          children: <Widget>[
            _bannerTop(),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[_addressWrap(), _giftWrapWidget()],
            )))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: hex('#fff'),
        width: double.infinity,
        height: G.setHeight(120),
        alignment: Alignment.center,
        child: FlatButton(
            // 按钮禁用指示
            onPressed: () async {
              if (!btnCanClick) {
                return;
              }
              btnCanClick = false;
              Future.delayed(Duration(seconds: 2), () {
                btnCanClick = true;
              });
              if (addressProvide.address == null ||
                  Validate.isNon(addressProvide.address.address)) {
                G.toast('请填写地址');
                return;
              }
              if (!Validate.isNon(selectedPackageNo)) {
                try {
                  var result = await MemberApi().giftpackageDetail(
                      selectedPackageNo,
                      promotionNo: selectedGiftPackagePromotionNo);
                  if (result.data['code'] != 200) {
                    G.toast(result.data['message']);
                    if (result.data['code'] == 401) {
                      return;
                    }
                    G.navigateTo(context, '/create-account',
                        transition: TransitionType.fadeIn);
                    // _getGiftsList();
                    // packageList = packageList.where((item) {
                    //   return item.giftPackageNo != selectedPackageNo;
                    // });
                    // packageList.removeWhere((element) => element.giftPackageNo == selectedPackageNo);
                    // _getGiftsList();
                    // giftListFuture = _getGiftsList();
                    return;
                  }
                  // selectedPackageNo
                  G.removePref('orderOverTime');
                  await OrderApi().getGiftPackageOrders(
                      giftPackageNo: selectedPackageNo,
                      giftPackagePromotionNo: selectedGiftPackagePromotionNo);
                  G.navigateTo(
                      context,
                      '/create-order?price=' +
                          selectedPackagePrice +
                          '&no=' +
                          selectedPackageNo +
                          '&promotionNo=' +
                          selectedGiftPackagePromotionNo);
                } catch (e) {
                  print(e);
                }
              } else {
                G.toast('请先选择礼包');
              }
            },
            child: Container(
              width: G.setWidth(690),
              height: G.setHeight(80),
              alignment: Alignment.center,
              // 按钮禁用指示
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(G.setWidth(40)),
                  gradient: addressProvide.address?.areaCode != null &&
                          selectedPackageNo != null
                      ? LinearGradient(colors: [hex('#4C5873'), hex('#333949')])
                      : LinearGradient(
                          colors: [hex('#c9ccd4'), hex('#c9ccd4')])),
              child: Text('提交礼包订单',
                  style: TextStyle(
                    fontSize: G.setSp(36),
                    color: addressProvide.address?.areaCode != null &&
                            selectedPackageNo != null
                        ? hex('#E7D1A8')
                        : hex('#e9e5de'),
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
      leading: Container(),
      iconTheme: IconThemeData(color: hex('#E7D1A8')),
      title: Text(
        '代理商开通',
        style: TextStyle(color: hex('#E7D1A8'), fontSize: G.setSp(36)),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              G.logout(context);
            },
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
        icon: 'lib/assets/images/pic-icon/vip-icon1.png',
        title: '超值大礼包',
        desc: '代理商可选购市场价值超豪华大礼包，豪华阵容，不可错过。'),
    AdItem(
        icon: 'lib/assets/images/pic-icon/vip-icon2.png',
        title: '居间服务费1',
        desc: '招募实体商家成为会员，成功后最高可获得软件信息技术服务费60%的居间服务费。'),
    AdItem(
        icon: 'lib/assets/images/pic-icon/vip-icon2.png',
        title: '居间服务费2',
        desc: '帮助会员成长为代理商且通过考核，可提取礼包采购额的30%作为服务费。'),
    AdItem(
        icon: 'lib/assets/images/pic-icon/vip-icon2.png',
        title: '居间服务费3',
        desc: '推广使用营销工具，即可获得营销工具软件信息技术服务费的30%作为居间服务费。'),
    AdItem(
        icon: 'lib/assets/images/pic-icon/vip-icon3.png',
        title: '销售服务费',
        desc: '帮助会员策划商铺促销活动或帮助其落地执行并长传图片，可提取会员采购总额的2%。'),
    AdItem(
        icon: 'lib/assets/images/pic-icon/vip-icon4.png',
        title: '技能培训支持',
        desc: '专业的落地策划服务培训、技术产品培训等，帮助代理商提高市场拓展技能。'),
    AdItem(
        icon: 'lib/assets/images/pic-icon/vip-icon5.png',
        title: '社群服务支持',
        desc: '专业的社群服务，提供海量的推广素材，帮助代理商轻松开拓市场。')
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
          Image.asset(item.icon, width: G.setWidth(80), height: G.setWidth(80)),
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
          G.navigateTo(context, '/address');
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
              Container(
                  constraints: BoxConstraints(
                    maxWidth: G.setWidth(600),
                  ),
                  child: Text(
                      address.province +
                          address.city +
                          address.district +
                          address.address,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: hex('#999999'), fontSize: G.setSp(24))))
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
        future: _getGiftsList(), //giftListFuture,
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
                  Validate.isNon(gift.giftPackagePromotionNo)
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
            G.removePref('orderOverTime');
            setState(() {
              selectedPackageNo = gift.giftPackageNo;
              selectedGiftPackagePromotionNo =
                  Validate.isNon(gift.giftPackagePromotionNo)
                      ? ''
                      : gift.giftPackagePromotionNo;
              selectedPackagePrice = gift.promotionAmount != null
                  ? gift.promotionAmount.toString()
                  : gift.amount.toString();
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
}

class AdItem {
  String icon;
  String title;
  String desc;

  AdItem({this.icon, this.title, this.desc});
}
