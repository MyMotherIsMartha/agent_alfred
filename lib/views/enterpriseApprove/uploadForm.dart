import 'package:agent37_flutter/api/dic.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:color_dart/hex_color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:agent37_flutter/api/user.dart';
// import 'package:agent37_flutter/provide/userinfo.dart';
import 'package:agent37_flutter/utils/citys.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'dart:convert';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:agent37_flutter/api/oss.dart';
import 'package:agent37_flutter/model/license.dart';
import 'package:provider/provider.dart';

class UploadLicenseForm extends StatefulWidget {
  final String uploadJson;

  UploadLicenseForm({this.uploadJson});
  @override
  _UploadLicenseFormState createState() => _UploadLicenseFormState();
}

class _UploadLicenseFormState extends State<UploadLicenseForm> {
  final _formKey = GlobalKey<FormState>();
  String city;
  String cityIndex = "10,1,5";
  String code;
  int isDefault = 0;
  String mobile;
  String name;
  String memberId;
  String id;

  Future<List<dynamic>> _jobList;

  // 获取职业数据
  Future<List> getJobList() async {
    var response = await DicApi().getOccupations();
    List<dynamic> tempList = response.data['data'];
    return tempList;
  }


  Map uploadData;

  final jobCodeCtrl = new TextEditingController();
  final _enterpriseName = new TextEditingController();
  final _registerCode = new TextEditingController();
  final _areaStr = new TextEditingController();
  final _legalPerson = new TextEditingController();

  final areaCtrl = new TextEditingController();
  String provinceName;
  String cityName;
  String areaName;

  @override
  void initState() {
    super.initState();
    uploadData =  FluroConvertUtils.string2map(widget.uploadJson);
    _enterpriseName.text = uploadData['enterpriseName'];
    _registerCode.text = uploadData['registerCode'];
    _areaStr.text = uploadData['address'];
    _legalPerson.text = uploadData['legalPerson'];
  }


  

  
  
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
            // Container(
            //   padding: EdgeInsets.all(15),
            //   alignment: Alignment.centerLeft,
            //   child: Text('收货地址',
            //       style: TextStyle(color: hex('#999'), fontSize: G.setSp(30))),
            // ),
            Container(
              height: G.setHeight(20)
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
                            child: Text('所属行业'),
                          ),
                          Expanded(
                            child: FutureBuilder(
                              future: getJobList(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return InkWell(
                                    onTap: () {
                                      _showPickerJobs(context, snapshot.data);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField(
                                            controller: jobCodeCtrl,
                                            // initialValue: '1234',
                                            onTap: () {
                                              _showPickerJobs(context, snapshot.data);
                                            },
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                border: InputBorder.none, hintText: '请选择行业'),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '请选择行业';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        // Text(city ?? '请选择'),
                                        Icon(Icons.keyboard_arrow_right)
                                      ],
                                    ),
                                  );
                                } else {
                                  return Text('');
                                }
                              },
                            ),
                            // child: 
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
                            child: Text('企业名称'),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration:
                                  InputDecoration(border: InputBorder.none, hintText: '请输入企业名称'),
                              controller: _enterpriseName,
                              onChanged: (e) {
                                setState(() {
                                  _enterpriseName.text = e;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '请输入企业名称';
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
                          border: Border(bottom: BorderSide(color: hex('#E5E6E5'), width: 1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: G.setWidth(186),
                            child: Text('营业执照号'),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none, hintText: '请输入统一社会信用代码'),
                              controller: _registerCode,
                              onChanged: (e) {
                                setState(() {
                                  name = e;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '请输入统一社会信用代码';
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
                            child: Text('注册地区'),
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
                                      controller: areaCtrl,
                                      // initialValue: '1234',
                                      onTap: () {
                                        _addressSelect(context);
                                      },
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none, hintText: '请选择省市区'),
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
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: hex('#E5E6E5'), width: 1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: G.setWidth(186),
                            child: Text('注册地址'),
                          ),
                          Expanded(
                            child: TextFormField(
                              maxLines: 3,
                              keyboardType: TextInputType.text,
                              decoration:
                                  InputDecoration(border: InputBorder.none, hintText: '请输入详细注册地址'),
                              controller: _areaStr,
                              onChanged: (e) {
                                setState(() {
                                  _areaStr.text = e;
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
                    Container(
                      height: G.setHeight(100),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: G.setWidth(186),
                            child: Text('法人姓名'),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration:
                                  InputDecoration(border: InputBorder.none, hintText: '请输入企业法人名称'),
                              controller: _legalPerson,
                              onChanged: (e) {
                                setState(() {
                                  _legalPerson.text = e;
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
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: G.setWidth(710),
              height: G.setHeight(100),
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [hex('#685AFF'), hex('#69A5FF')]),
                borderRadius: BorderRadius.circular(G.setHeight(50))
              ),
              child: FlatButton(
                color: Colors.transparent,
                textColor: Colors.white,
                onPressed: () async {
                  // Validate returns true if the form is valid, otherwise false.
                  print(code);
                  if (_formKey.currentState.validate()) {
                    Map data = {
                      'registerAddress': _areaStr.text,
                      'areaCode': int.parse(code),
                      'businessLicensePicture': uploadData['businessLicenseUrl'],
                      'enterpriseName': _enterpriseName.text,
                      'legalPerson': _legalPerson.text,
                      'registerCode': _registerCode.text
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
                child: Text('提交审核', style: TextStyle(
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

  

  _showPickerJobs(BuildContext context, listData) {
    List<PickerItem<dynamic>> testArray = listData.map<PickerItem>((item) => PickerItem(text: Text(item['name']), value: item['code'])).toList();
    Picker picker = new Picker(
      adapter: PickerDataAdapter(data: testArray),
      // changeToFirst: true,
      // textAlign: TextAlign.left,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues().first);
        jobCodeCtrl.value = TextEditingValue(text: picker.getSelectedValues().first);
        jobCodeCtrl.text = listData[value.first]['name'];
        print(jobCodeCtrl.text);
      }
    );
    picker.showModal(context);
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
          provinceName = result2.provinceName;
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
      areaCtrl.value = TextEditingValue(text: city);
    }
  }
}
