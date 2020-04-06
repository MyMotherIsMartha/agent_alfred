class GiftPackagesModel {
  String name;
  String giftPackageNo;
  String giftPackagePromotionNo;
  double amount;
  double promotionAmount;
  List<AppGoodses> appGoodses;

  GiftPackagesModel(
      {this.name,
      this.giftPackageNo,
      this.giftPackagePromotionNo,
      this.amount,
      this.promotionAmount,
      this.appGoodses});

  GiftPackagesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    giftPackageNo = json['giftPackageNo'];
    giftPackagePromotionNo = json['giftPackagePromotionNo'];
    amount = json['amount'];
    promotionAmount = json['promotionAmount'];
    if (json['appGoodses'] != null) {
      appGoodses = new List<AppGoodses>();
      json['appGoodses'].forEach((v) {
        appGoodses.add(new AppGoodses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['giftPackageNo'] = this.giftPackageNo;
    data['giftPackagePromotionNo'] = this.giftPackagePromotionNo;
    data['amount'] = this.amount;
    data['promotionAmount'] = this.promotionAmount;
    if (this.appGoodses != null) {
      data['appGoodses'] = this.appGoodses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppGoodses {
  String skuCode;
  String displayGoodsName;
  String goodsMainImg;
  String unit;
  String attrProperty;
  Null skuAmount;
  Null quantity;
  Null amount;

  AppGoodses(
      {this.skuCode,
      this.displayGoodsName,
      this.goodsMainImg,
      this.unit,
      this.attrProperty,
      this.skuAmount,
      this.quantity,
      this.amount});

  AppGoodses.fromJson(Map<String, dynamic> json) {
    skuCode = json['skuCode'];
    displayGoodsName = json['displayGoodsName'];
    goodsMainImg = json['goodsMainImg'];
    unit = json['unit'];
    attrProperty = json['attrProperty'];
    skuAmount = json['skuAmount'];
    quantity = json['quantity'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skuCode'] = this.skuCode;
    data['displayGoodsName'] = this.displayGoodsName;
    data['goodsMainImg'] = this.goodsMainImg;
    data['unit'] = this.unit;
    data['attrProperty'] = this.attrProperty;
    data['skuAmount'] = this.skuAmount;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    return data;
  }
}
