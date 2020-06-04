import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/address-picker/address_picker.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class VAddress extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String areaId;
  final Function cb;
  final Function validator;
  final String hintText;
  final double labelWidth;
  VAddress(
      {this.controller,
      this.areaId,
      this.cb,
      this.validator,
      this.label,
      this.hintText,
      this.labelWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: G.setHeight(100),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: hex('#eee'), width: G.setWidth(1)))),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
      child: Row(
        children: <Widget>[
          Container(
              // padding: EdgeInsets.only(right: G.setWidth(20)),
              width: labelWidth ?? G.setWidth(160),
              child: Text(label ?? '地区',
                  style: TextStyle(fontSize: G.setSp(30), color: hex('#666')))),
          Expanded(
            child: InkWell(
              onTap: () {
                _addressSelect2(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: G.setSp(30)),
                      controller: controller,
                      onTap: () {
                        _addressSelect2(context);
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText ?? '请选择地区'),
                      validator: validator,
                    ),
                  ),
                  // Text(city ?? '请选择'),
                  iconarrow(size: G.setWidth(35))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _addressSelect2(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  height: 250.0,
                  child: AddressPicker(
                    areaCode: areaId,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    mode: AddressPickerMode.provinceCityAndDistrict,
                    onSelectedAddressChanged: (address) {
                      String areaName = address.currentProvince.province +
                          ',' +
                          address.currentCity.city +
                          ',' +
                          address.currentDistrict.area;
                      String value = address.currentProvince.provinceid +
                          ',' +
                          address.currentCity.cityid +
                          ',' +
                          address.currentDistrict.areaid;
                      controller.value = TextEditingValue(text: areaName);
                      cb(value, areaName);
                    },
                  ),
                );
              });
        });
  }
}
