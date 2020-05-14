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
  String shareCode;
  String enterpriseName;
  bool isSettingPassword;
  bool isQualificationsPrefected;
  int payType;
  int qualificationsAuditOvertime;
  int role;
  int settleStatus;
  int voucherAuditOvertime;
  String voucherRefuseReason;
  String qualificationsRefuseReason;

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
      this.shareCode,
      this.isSettingPassword,
      this.isQualificationsPrefected,
      this.enterpriseName,
      this.payType,
      this.role,
      this.settleStatus,
      this.qualificationsRefuseReason,
      this.voucherAuditOvertime,
      this.voucherRefuseReason,
      this.qualificationsAuditOvertime
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
    shareCode = json['shareCode'];
    payType = json['payType'];
    enterpriseName = json['enterpriseName'];
    isSettingPassword = json['isSettingPassword'];
    isQualificationsPrefected = json['isQualificationsPrefected'];
    qualificationsAuditOvertime = json['qualificationsAuditOvertime'];
    qualificationsRefuseReason = json['qualificationsRefuseReason'];
    settleStatus = json['settleStatus'];
    role = json['role'];
    voucherAuditOvertime = json['voucherAuditOvertime'];
    voucherRefuseReason = json['voucherRefuseReason'];
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
    data['shareCode'] = this.shareCode;
    data['isSettingPassword'] = this.isSettingPassword;
    data['isQualificationsPrefected'] = this.isQualificationsPrefected;
    data['payType'] = this.payType;
    data['enterpriseName'] = this.enterpriseName;
    data['qualificationsAuditOvertime'] = this.qualificationsAuditOvertime;
    data['qualificationsRefuseReason'] = this.qualificationsRefuseReason;
    data['settleStatus'] = this.settleStatus;
    data['role'] = this.role;
    data['voucherAuditOvertime'] = this.voucherAuditOvertime;
    data['voucherRefuseReason'] = this.voucherRefuseReason;
    return data;
  }
}
