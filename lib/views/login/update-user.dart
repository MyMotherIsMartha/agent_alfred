import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-address.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-hint.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/components/v-timer-btn.dart';
import 'package:agent37_flutter/utils/citys.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateUserPage extends StatefulWidget {
  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String idcard;
  String areaId;
  String areaName;
  String errorMsg = '';
  Map<String, bool> formValidate = {'name': false, 'sms': false, 'pwd': false};

  final nameController = TextEditingController();
  final idcardController = TextEditingController();
  final areaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('完善个人信息'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: hex('#F3F4F6'),
            child: Column(
              children: <Widget>[
                G.spacing(20),
                Container(
                  color: hex('#FFF'),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        VInput(
                          controller: nameController,
                          hintText: '请输入真实姓名',
                          label: '姓名',
                          validator: (value) {
                            if (Validate.isNon(errorMsg)) {
                              setState(() {
                                errorMsg =
                                    Validate.isNon(value) ? '请输入真实姓名' : null;
                              });
                            }
                            print(errorMsg);
                          },
                          onChange: (e) {
                            setState(() {
                              // smsDisabled = Validate.checkname(e) != null;
                              // formValidate['name'] =
                              //     Validate.checkname(e) == null;
                            });
                            name = e;
                          },
                        ),
                        VInput(
                          controller: idcardController,
                          hintText: '请输入身份证号',
                          label: '身份证号',
                          validator: (value) {
                            if (Validate.isNon(errorMsg)) {
                              setState(() {
                                errorMsg =
                                    Validate.isNon(value) ? '请输入身份证号' : null;
                              });
                            }
                            print(errorMsg);
                          },
                          onChange: (e) {
                            setState(() {
                              formValidate['mobile'] =
                                  Validate.checkMobile(e) == null;
                            });
                            idcard = e;
                          },
                        ),
                        // VAddress(
                        //   areaId: areaId,
                        //   controller: areaController,
                        //   cb: (value) {
                        //     print('areaId');
                        //     print(value);
                        //     setState(() {
                        //       areaId = value;
                        //     });
                        //   },
                        // ),
                        Container(
                          alignment: Alignment.center,
                          height: G.setHeight(100),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: hex('#eee'),
                                      width: G.setWidth(1)))),
                          padding:
                              EdgeInsets.symmetric(horizontal: G.setWidth(30)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  padding:
                                      EdgeInsets.only(right: G.setWidth(20)),
                                  child: Text('地区',
                                      style: TextStyle(
                                          fontSize: G.setSp(30),
                                          color: hex('#666')))),
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
                                          controller: areaController,
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
                                      iconarrow(size: G.setWidth(50))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                G.spacing(20),
                Validate.isNon(errorMsg)
                    ? G.spacing(G.setHeight(50))
                    : VHint(errorMsg),
                G.spacing(40),
                VButton(
                  width: 690,
                  text: '开通代理商',
                  disabled: formValidate.containsValue(false),
                  fn: () async {
                    setState(() {
                      errorMsg = null;
                    });
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      Map data = {
                        // 'mobile': mobile,
                        // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
                      };

                      print(1234);
                      print(data);
                      // FormData formData = FormData.fromMap(data);
                      // var result = await UserApi().createAddress(data);
                      // if (result.data['code'] == 200) {
                      //   G.toast('操作成功');
                      //   Provider.of<UserinfoProvide>(context).toggleRefreshAddress();
                      //   G.router.pop(context);
                      // } else {
                      //   G.toast(result.data['message']);
                      // }
                      // print(result);
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      // Scaffold.of(context).showSnackBar(
                      //     SnackBar(content: Text('Processing Data')));
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }

  String _smsValidate(String value) {
    if (value == null || value.isEmpty) {
      _setValidate('sms', false);
      return '请输入验证码';
    } else if (value.length != 4) {
      _setValidate('sms', false);
      return '验证码错误';
    } else {
      _setValidate('sms', true);
      return null;
    }
  }

  String _pwdValidate(String value) {
    if (value == null || value.isEmpty) {
      _setValidate('pwd', false);
      return '请输入密码';
    } else if (value.length < 6 || value.length > 15) {
      _setValidate('pwd', false);
      return '密码长度在6-15位之间';
    } else {
      _setValidate('pwd', true);
      return null;
    }
  }

  void _setValidate(String key, bool value) {
    setState(() {
      formValidate[key] = value;
    });
  }

  _addressSelect(context) async {
    Result result2 = await CityPickers.showCityPicker(
        context: context,
        locationCode: '659002',
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
          areaId = result2.areaId;
          areaName = result2.provinceName +
              ',' +
              result2.cityName +
              ',' +
              result2.areaName;
        } else {
          areaId = result2.cityId;
          areaName = result2.provinceName + ',' + result2.cityName;
        }
      });
      print(areaId);
      areaController.value = TextEditingValue(text: areaName);
    }
  }
}
