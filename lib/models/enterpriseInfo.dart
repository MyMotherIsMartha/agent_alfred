class EnterpriseInfoModel {
  String areaCode;
  String auditRefuseReason;
  String businessLicensePicture;
  String city;
  String district;
  String enterpriseName;
  String industryCode;
  String industryName;
  String legalIdCard;
  String legalPerson;
  String mobile;
  int prefectStatus;
  String province;
  String registerAddress;
  String registerCode;
  int status;

  EnterpriseInfoModel(
      {this.areaCode,
      this.auditRefuseReason,
      this.businessLicensePicture,
      this.city,
      this.district,
      this.enterpriseName,
      this.industryCode,
      this.industryName,
      this.legalIdCard,
      this.legalPerson,
      this.mobile,
      this.prefectStatus,
      this.province,
      this.registerAddress,
      this.registerCode,
      this.status});

  EnterpriseInfoModel.fromJson(Map<String, dynamic> json) {
    areaCode = json['areaCode'];
    auditRefuseReason = json['auditRefuseReason'];
    businessLicensePicture = json['businessLicensePicture'];
    city = json['city'];
    district = json['district'];
    enterpriseName = json['enterpriseName'];
    industryCode = json['industryCode'];
    industryName = json['industryName'];
    legalIdCard = json['legalIdCard'];
    legalPerson = json['legalPerson'];
    mobile = json['mobile'];
    prefectStatus = json['prefectStatus'];
    province = json['province'];
    registerAddress = json['registerAddress'];
    registerCode = json['registerCode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaCode'] = this.areaCode;
    data['auditRefuseReason'] = this.auditRefuseReason;
    data['businessLicensePicture'] = this.businessLicensePicture;
    data['city'] = this.city;
    data['district'] = this.district;
    data['enterpriseName'] = this.enterpriseName;
    data['industryCode'] = this.industryCode;
    data['industryName'] = this.industryName;
    data['legalIdCard'] = this.legalIdCard;
    data['legalPerson'] = this.legalPerson;
    data['mobile'] = this.mobile;
    data['prefectStatus'] = this.prefectStatus;
    data['province'] = this.province;
    data['registerAddress'] = this.registerAddress;
    data['registerCode'] = this.registerCode;
    data['status'] = this.status;
    return data;
  }
}