class UserAuthModel {
  bool isContactsPrefected;
  int voucherStatus;
  int qualificationsStatus;
  int checkStatus;
  int prefectStatus;
  int giftPackageOrderStatus;
  String auditRefuseReason;

  UserAuthModel(
      {this.isContactsPrefected,
      this.voucherStatus,
      this.qualificationsStatus,
      this.checkStatus,
      this.prefectStatus,
      this.giftPackageOrderStatus,
      this.auditRefuseReason});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    isContactsPrefected = json['isContactsPrefected'];
    voucherStatus = json['voucherStatus'];
    qualificationsStatus = json['qualificationsStatus'];
    checkStatus = json['checkStatus'];
    prefectStatus = json['prefectStatus'];
    giftPackageOrderStatus = json['giftPackageOrderStatus'];
    auditRefuseReason = json['auditRefuseReason'];
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
    return data;
  }
}
