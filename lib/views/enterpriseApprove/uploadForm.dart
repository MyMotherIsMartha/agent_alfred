import 'package:city_pickers/city_pickers.dart';
import 'package:color_dart/hex_color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:agent37_flutter/api/user.dart';
// import 'package:agent37_flutter/provide/userinfo.dart';
import 'package:agent37_flutter/utils/citys.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:provider/provider.dart';

class UploadLicenseForm extends StatefulWidget {
  final String name;
  final int age;
  final String personJson;

  UploadLicenseForm({this.name, this.age, this.personJson});
  @override
  _UploadLicenseFormState createState() => _UploadLicenseFormState();
}

class _UploadLicenseFormState extends State<UploadLicenseForm> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String address;
  String city;
  String cityIndex = "10,1,5";
  String code;
  int isDefault = 0;
  String mobile;
  String name;
  String memberId;
  String id;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('企业认证'),
        centerTitle: true
      ),
      body: Container(
        color: hex('#F3F4F6'),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text('收货地址',
                  style: TextStyle(color: hex('#999'), fontSize: G.setSp(30))),
            ),
            Container(
              color: hex('#FFF'),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: G.setHeight(100),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: hex('#E5E6E5'), width: 1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: G.setWidth(186),
                            child: Text('收货人'),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              onChanged: (e) {
                                setState(() {
                                  name = e;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '请输入收货人';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: G.setHeight(100),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: hex('#E5E6E5'), width: 1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: G.setWidth(186),
                            child: Text('手机号码'),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              onChanged: (e) {
                                setState(() {
                                  mobile = e;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '请输入手机号';
                                }
                                RegExp reg = RegExp(r'^1[3456789]\d{9}$');
                                if (!reg.hasMatch(value)) {
                                  return '请输入11位手机号';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: G.setHeight(100),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: hex('#E5E6E5'), width: 1))),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: G.setWidth(186),
                            child: Text('省市区'),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _addressSelect(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: TextFormField(
                                      controller: myController,
                                      // initialValue: '1234',
                                      onTap: () {
                                        _addressSelect(context);
                                      },
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return '请选择省市区';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  // Text(city ?? '请选择'),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: G.setHeight(100),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: G.setWidth(186),
                            child: Text('详细地址'),
                          ),
                          Expanded(
                            child: TextFormField(
                              maxLines: 3,
                              keyboardType: TextInputType.phone,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              onChanged: (e) {
                                setState(() {
                                  address = e;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '请输入详细地址';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: G.setHeight(100),
                color: hex('#fff'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('设置为默认地址',
                        style: TextStyle(
                            fontSize: G.setSp(32), color: hex('#363636'))),
                    CupertinoSwitch(
                      activeColor: hex('#E5B760'),
                      value: isDefault == 1,
                      onChanged: (e) {
                        setState(() {
                          isDefault = e ? 1 : 0;
                        });
                      },
                    ),
                  ],
                )),
            Container(
              width: G.setWidth(710),
              height: G.setHeight(100),
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [hex('#F3C774'), hex('#E2B55D')]),
                borderRadius: BorderRadius.circular(G.setHeight(50))
              ),
              child: FlatButton(
                color: Colors.transparent,
                textColor: Colors.white,
                onPressed: () async {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    Map data = {
                      'name': name,
                      'mobile': mobile,
                      'address': address,
                      'city': city,
                      'code': int.parse(code),
                      'isDefault': isDefault,
                      'cityIndex': cityIndex,
                      // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
                    };
                    print(1234);
                    print(data);
                    // FormData formData = FormData.fromMap(data);
                    // var result = await UserApi().createAddress(data);
                    // print(result);
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    // Scaffold.of(context).showSnackBar(
                    //     SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('确定', style: TextStyle(
                  fontSize: G.setSp(36),
                  color: Colors.white
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addressSelect(context) async {
    Result result2 = await CityPickers.showCityPicker(
        context: context,
        locationCode: code,
        height: G.setHeight(500),
        cancelWidget: Text('取消',
            style: TextStyle(fontSize: G.setSp(32), color: hex('#999'))),
        confirmWidget: Text('确认',
            style: TextStyle(fontSize: G.setSp(32), color: hex('#108EE9'))),
        citiesData: citiesData,
        provincesData: provincesData);
    if (result2 != null) {
      setState(() {
        if (result2.areaId != null && result2.areaId.isNotEmpty) {
          code = result2.areaId;
          city = result2.provinceName +
              ',' +
              result2.cityName +
              ',' +
              result2.areaName;
        } else {
          code = result2.cityId;
          city = result2.provinceName + ',' + result2.cityName;
        }
      });
      myController.value = TextEditingValue(text: city);
    }
  }
}
