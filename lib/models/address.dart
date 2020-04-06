class AddressModel {
  String consigneeName;
  String mobile;
  String areaCode;
  String province;
  String city;
  String district;
  String address;

  AddressModel(
      {this.consigneeName,
      this.mobile,
      this.areaCode,
      this.province,
      this.city,
      this.district,
      this.address});

  AddressModel.fromJson(Map<String, dynamic> json) {
    consigneeName = json['consigneeName'];
    mobile = json['mobile'];
    areaCode = json['areaCode'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consigneeName'] = this.consigneeName;
    data['mobile'] = this.mobile;
    data['areaCode'] = this.areaCode;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    data['address'] = this.address;
    return data;
  }
}
