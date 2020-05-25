library address_picker;

import 'package:agent37_flutter/components/address-picker/address_manager.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'address_model.dart';

class Address {
  AddressProvince currentProvince;
  AddressCity currentCity;
  AddressDistrict currentDistrict;

  Address({this.currentProvince, this.currentCity, this.currentDistrict});
}

typedef AddressCallback = void Function(Address);

enum AddressPickerMode {
  province,
  provinceAndCity,
  provinceCityAndDistrict,
}

class AddressPicker extends StatefulWidget {
  /// 选中的地址发生改变回调
  final AddressCallback onSelectedAddressChanged;
  final Function cb;

  final String areaCode;

  /// 选择模式
  /// province 一级: 省
  /// provinceAndCity 二级: 省市
  /// provinceCityAndDistrict 三级: 省市区
  final AddressPickerMode mode;

  /// 省市区文字显示样式
  final TextStyle style;

  AddressPicker(
      {Key key,
      this.mode = AddressPickerMode.provinceCityAndDistrict,
      this.areaCode,
      this.onSelectedAddressChanged,
      this.cb,
      this.style = const TextStyle(color: Colors.black, fontSize: 17)})
      : super(key: key);

  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  List<AddressProvince> _provinces;

  AddressProvince _selectedProvince;
  AddressCity _selectedCity;
  AddressDistrict _selectedDistrict;

  FixedExtentScrollController _provinceScrollController =
      FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController _cityScrollController =
      FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController _districtScrollController =
      FixedExtentScrollController(initialItem: 0);

  @override
  void dispose() {
    _cityScrollController.dispose();
    _districtScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getAddressData();
  }

  void _getAddressData() async {
    var addressData = await AddressManager.loadAddressData(context);
    AddressProvince province;
    int _selectedProvinceIndex = 0;
    AddressCity city;
    int _selectedCityIndex = 0;
    AddressDistrict district;
    int _selectedDistrictIndex = 0;
    if (!Validate.isNon(widget.areaCode)) {
      List<String> areaList = widget.areaCode.split(',');
      province = addressData.firstWhere(
          (element) => element.provinceid == areaList[0].toString());
      _selectedProvinceIndex = addressData.indexWhere(
          (element) => element.provinceid == areaList[0].toString());
      city = province.cities
          .firstWhere((element) => element.cityid == areaList[1].toString());
      _selectedCityIndex = province.cities
          .indexWhere((element) => element.cityid == areaList[1].toString());
      district = city.district
          .firstWhere((element) => element.areaid == areaList[2].toString());
      _selectedDistrictIndex = city.district
          .indexWhere((element) => element.areaid == areaList[2].toString());
    }
    setState(() {
      _provinces = addressData;
      _selectedProvince = province ?? _provinces.first;
      _selectedCity = city ?? _selectedProvince.cities.first;
      _selectedDistrict = district ?? _selectedCity.district.first;
      _provinceScrollController =
          FixedExtentScrollController(initialItem: _selectedProvinceIndex);
      _cityScrollController =
          FixedExtentScrollController(initialItem: _selectedCityIndex);
      _districtScrollController =
          FixedExtentScrollController(initialItem: _selectedDistrictIndex);
    });
  }

  void _updateCurrent() {
    if (widget.onSelectedAddressChanged != null) {
      var address = Address(
          currentProvince: _selectedProvince,
          currentCity: _selectedCity,
          currentDistrict: _selectedDistrict);
      widget.onSelectedAddressChanged(address);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_provinces == null || _provinces.isEmpty) {
      return Container();
    }

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 30,
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    G.router.pop(context);
                  },
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: G.setSp(32), color: hex('#999')),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _updateCurrent();
                    G.router.pop(context);
                  },
                  child: Text('确认', style: TextStyle(
                    fontSize: G.setSp(32),
                    color: hex('#108EE9')
                  )),
                )
              ],
            )),
          ),
          Container(
            height: 220,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: CupertinoPicker.builder(
                    scrollController: _provinceScrollController,
                    backgroundColor: Colors.white,
                    childCount: _provinces?.length ?? 0,
                    itemBuilder: (context, index) {
                      var item = _provinces[index];
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          item.province,
                          style: widget.style,
                        ),
                      );
                    },
                    itemExtent: 44,
                    onSelectedItemChanged: (item) {
                      setState(() {
                        _selectedProvince = _provinces[item];
                        _selectedCity = _selectedProvince.cities.first;
                        _selectedDistrict = _selectedCity.district.first;
                        _cityScrollController.animateToItem(0,
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 250));
                        _districtScrollController.animateToItem(0,
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 250));
                      });
                      // _updateCurrent();
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CupertinoPicker.builder(
                      scrollController: _cityScrollController,
                      backgroundColor: Colors.white,
                      childCount: _selectedProvince?.cities?.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = _selectedProvince.cities[index];
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            item.city,
                            style: widget.style,
                          ),
                        );
                      },
                      itemExtent: 44,
                      onSelectedItemChanged: (item) {
                        setState(() {
                          _selectedCity = _selectedProvince.cities[item];
                          _selectedDistrict = _selectedCity.district.first;
                          _districtScrollController.animateToItem(0,
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 250));
                        });
                        // _updateCurrent();
                      },
                    )),
                Expanded(
                  flex: 1,
                  child: CupertinoPicker.builder(
                    scrollController: _districtScrollController,
                    backgroundColor: Colors.white,
                    childCount: _selectedCity?.district?.length ?? 0,
                    itemBuilder: (context, index) {
                      var item = _selectedCity.district[index];
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          item.area,
                          style: widget.style,
                        ),
                      );
                    },
                    itemExtent: 44,
                    onSelectedItemChanged: (item) {
                      var district = _selectedCity.district[item];
                      _selectedDistrict = district;
                      // _updateCurrent();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
