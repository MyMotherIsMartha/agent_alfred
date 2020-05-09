import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/utils/citys.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class VAddress extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String areaId;
  final Function cb;
  final Function validator;
  final String hintText;
  VAddress({this.controller, this.areaId, this.cb, this.validator, this.label, this.hintText});
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
              width: G.setWidth(160),
              child: Text(label??'地区',
                  style: TextStyle(fontSize: G.setSp(30), color: hex('#666')))),
          Expanded(
            child: InkWell(
              onTap: () {
                _addressSelect(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      
                      controller: controller,
                      onTap: () {
                        _addressSelect(context);
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText??'请选择地区'
                      ),
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

  _addressSelect(context) async {
    Result result2 = await CityPickers.showCityPicker(
        context: context,
        locationCode: areaId ?? '110000',
        height: G.setHeight(500),
        cancelWidget: Text('取消',
            style: TextStyle(fontSize: G.setSp(32), color: hex('#999'))),
        confirmWidget: Text('确认',
            style: TextStyle(fontSize: G.setSp(32), color: hex('#108EE9'))),
        citiesData: citiesData,
        provincesData: provincesData);
    if (result2 != null) {
      String area;
      String areaName;
      if (result2.areaId != null && result2.areaId.isNotEmpty) {
        area = result2.areaId;
        areaName = result2.provinceName +
            ',' +
            result2.cityName +
            ',' +
            result2.areaName;
      } else {
        area = result2.cityId;
        areaName = result2.provinceName + ',' + result2.cityName;
      }
      controller.value = TextEditingValue(text: areaName);
      cb(area, areaName);
    }
  }
}
