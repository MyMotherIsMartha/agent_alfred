class BannerModel {
  String bannerItemId;
  String bannerImg;
  int jumpType;
  int contactType;
  String jumpContent;
  int expiryStart;
  int expiryEnd;
  int sequence;
  int bannerStatus;

  BannerModel(
      {this.bannerItemId,
      this.bannerImg,
      this.jumpType,
      this.contactType,
      this.jumpContent,
      this.expiryStart,
      this.expiryEnd,
      this.sequence,
      this.bannerStatus});

  BannerModel.fromJson(Map<String, dynamic> json) {
    bannerItemId = json['bannerItemId'];
    bannerImg = json['bannerImg'];
    jumpType = json['jumpType'];
    contactType = json['contactType'];
    jumpContent = json['jumpContent'];
    expiryStart = json['expiryStart'];
    expiryEnd = json['expiryEnd'];
    sequence = json['sequence'];
    bannerStatus = json['bannerStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerItemId'] = this.bannerItemId;
    data['bannerImg'] = this.bannerImg;
    data['jumpType'] = this.jumpType;
    data['contactType'] = this.contactType;
    data['jumpContent'] = this.jumpContent;
    data['expiryStart'] = this.expiryStart;
    data['expiryEnd'] = this.expiryEnd;
    data['sequence'] = this.sequence;
    data['bannerStatus'] = this.bannerStatus;
    return data;
  }
}
