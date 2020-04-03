class UserAuthModel {
  bool isContactsPrefected;
  bool isPrefected;
  int status;
  int giftPackageOrderStatus;
  String auditRefuseReason;
  UserAuthModel(
      {this.isContactsPrefected,
      this.isPrefected,
      this.status,
      this.giftPackageOrderStatus,
      this.auditRefuseReason});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    isContactsPrefected = json['isContactsPrefected'];
    isPrefected = json['isPrefected'];
    status = json['status'];
    giftPackageOrderStatus = json['giftPackageOrderStatus'];
    auditRefuseReason = json['auditRefuseReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isContactsPrefected'] = this.isContactsPrefected;
    data['isPrefected'] = this.isPrefected;
    data['status'] = this.status;
    data['giftPackageOrderStatus'] = this.giftPackageOrderStatus;
    data['auditRefuseReason'] = this.auditRefuseReason;
    return data;
  }
}
