class License {
  String enterpriseName;
  String registerCode;
  String legalPerson;
  String address;
  String businessLicenseUrl;

  License(
      {this.enterpriseName,
      this.registerCode,
      this.legalPerson,
      this.address,
      this.businessLicenseUrl});

  License.fromJson(Map<String, dynamic> json) {
    enterpriseName = json['enterpriseName'];
    registerCode = json['registerCode'];
    legalPerson = json['legalPerson'];
    address = json['address'];
    businessLicenseUrl = json['businessLicenseUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enterpriseName'] = this.enterpriseName;
    data['registerCode'] = this.registerCode;
    data['legalPerson'] = this.legalPerson;
    data['address'] = this.address;
    data['businessLicenseUrl'] = this.businessLicenseUrl;
    return data;
  }
}