class UserAuthModel {
  bool isContactsPrefected;
  int voucherStatus;
  int qualificationsStatus;
  int checkStatus;
  int prefectStatus;
  int giftPackageOrderStatus;
  String auditRefuseReason;
  String headSculptureUrl;
  String mobile;
  String nickname;
  bool isSettingPassword;
  int payType;

  UserAuthModel(
      {this.isContactsPrefected,
      this.voucherStatus,
      this.qualificationsStatus,
      this.checkStatus,
      this.prefectStatus,
      this.giftPackageOrderStatus,
      this.auditRefuseReason,
      this.headSculptureUrl,
      this.mobile,
      this.nickname,
      this.isSettingPassword,
      this.payType
      });

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    isContactsPrefected = json['isContactsPrefected'];
    voucherStatus = json['voucherStatus'];
    qualificationsStatus = json['qualificationsStatus'];
    checkStatus = json['checkStatus'];
    prefectStatus = json['prefectStatus'];
    giftPackageOrderStatus = json['giftPackageOrderStatus'];
    auditRefuseReason = json['auditRefuseReason'];
    headSculptureUrl = json['headSculptureUrl'];
    mobile = json['mobile'];
    nickname = json['nickname'];
    payType = json['payType'];
    isSettingPassword = json['isSettingPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isContactsPrefected'] = this.isContactsPrefected;
    data['voucherStatus'] = this.voucherStatus;
    data['qualificationsStatus'] = this.qualificationsStatus;
    data['checkStatus'] = this.checkStatus;
    data['prefectStatus'] = this.prefectStatus;
    data['giftPackageOrderStatus'] = this.giftPackageOrderStatus;
    data['auditRefuseReason'] = this.auditRefuseReason;
    data['headSculptureUrl'] = this.headSculptureUrl;
    data['mobile'] = this.mobile;
    data['nickname'] = this.nickname;
    data['isSettingPassword'] = this.isSettingPassword;
    data['payType'] = this.payType;
    return data;
  }
}
