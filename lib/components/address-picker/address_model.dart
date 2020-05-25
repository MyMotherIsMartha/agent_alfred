class AddressProvince {
  String provinceid;
  String province;
  List<AddressCity> cities;

  AddressProvince(
      {
      this.provinceid,
      this.province,
      this.cities});

  AddressProvince.fromJson(Map<String, dynamic> json, {Map<String, AddressCity> cityMap, Map<String, AddressDistrict> districtMap}) {
    provinceid = json['provinceid'];
    province = json['province'];
    if (json['cities'] != null) {
      cities = new List<AddressCity>();
      json['cities'].forEach((v) {
        var city = AddressCity.fromJson(v, districtMap: districtMap);
        cityMap[city.cityid] = city;
        cities.add(city);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinceid'] = this.provinceid;
    data['province'] = this.province;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressCity {
  String city;
  String cityid;
  String provinceid;
  List<AddressDistrict> district;

  AddressCity(
      {
      this.city,
      this.cityid,
      this.provinceid,
      this.district});

  AddressCity.fromJson(Map<String, dynamic> json, {Map<String, AddressDistrict> districtMap}) {
    city = json['city'];
    cityid = json['cityid'];
    provinceid = json['provinceid'];
    if (json['district'] != null) {
      district = new List<AddressDistrict>();
      json['district'].forEach((v) {
        var dis = AddressDistrict.fromJson(v);
        districtMap[dis.areaid] = dis;
        district.add(dis);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['cityid'] = this.cityid;
    data['provinceid'] = this.provinceid;
    if (this.district != null) {
      data['district'] = this.district.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressDistrict {
  String area;
  String areaid;
  String cityid;

  AddressDistrict({this.area, this.areaid, this.cityid});

  AddressDistrict.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    areaid = json['areaid'];
    cityid = json['cityid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['areaid'] = this.areaid;
    data['cityid'] = this.cityid;
    return data;
  }
}