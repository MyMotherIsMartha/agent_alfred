import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-address.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-hint.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/hex_color.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class UpdateUserPage extends StatefulWidget {
  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String sex = 'male';
  String idcard;
  String areaId;
  String areaName;
  String birtyday = '';
  String errorMsg = '';
  Map<String, bool> formValidate = {
    'name': false,
    'idcard': false,
    'areaId': false
  };

  final nameController = TextEditingController();
  final idcardController = TextEditingController();
  final areaController = TextEditingController();
  final birtydayController = TextEditingController();
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
                        _selectSex(),
                        VInput(
                          controller: idcardController,
                          hintText: '请输入身份证号',
                          label: '身份证号',
                          validator: (value) {
                            if (Validate.isNon(errorMsg)) {
                              var reg =
                                  r"(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)";
                              if (!RegExp(reg).hasMatch(value)) {
                                setState(() {
                                  errorMsg = '请输入真实身份证号';
                                });
                              }
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
                        VAddress(
                          areaId: areaId,
                          controller: areaController,
                          cb: (value) {
                            print('areaId');
                            print(value);
                          },
                          validator: (value) {
                            if (Validate.isNon(value) &&
                                Validate.isNon(errorMsg)) {
                              setState(() {
                                errorMsg = '请选择地区';
                              });
                            }
                            return null;
                          },
                        ),
                        VInput(
                          controller: birtydayController,
                          hintText: '请选择生日日期',
                          label: '生日',
                          readOnly: true,
                          suffixIcon: iconarrow(size: 24),
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1900, 1, 1),
                                maxTime: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day),
                                onChanged: (date) {}, onConfirm: (date) {
                              String dateStr =
                                  formatDate(date, [yyyy, '-', mm, '-', dd]);
                              birtydayController.value =
                                  TextEditingValue(text: dateStr);
                              birtyday = dateStr;
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.zh);
                          },
                        ),
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
                  // disabled: formValidate.containsValue(false),
                  fn: () async {
                    setState(() {
                      errorMsg = null;
                    });
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {}
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget _selectSex() {
    return Container(
      height: G.setWidth(100),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(right: G.setWidth(20)),
              child: Text('性别',
                  style: TextStyle(fontSize: G.setSp(30), color: hex('#666')))),
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _sexItem('male', sex),
                Container(width: G.setWidth(60)),
                _sexItem('female', sex),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _sexItem(String type, String sex) {
    Color activeColor = type == 'male' ? hex('#279FF3') : hex('#FF5973');
    Color iconColor = type == sex ? hex('#fff') :hex('#bfbfbf');
    Color textColor = type == sex ? hex('#333') :hex('#bfbfbf');
    return InkWell(
      onTap: () {
        _toggleSex(type);
      },
      child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: type == sex ? activeColor : hex('#F0F0F0'),
            ),
            alignment: Alignment.center,
            width: G.setWidth(60),
            height: G.setHeight(60),
            child: type == 'male' ? iconmale(color: iconColor) : iconfemale(color: iconColor),
          ),
          Container(width: G.setWidth(20)),
          Text(type == 'male' ? '男' : '女', style: TextStyle(
            color: textColor,
            fontSize: G.setSp(30)
          ))
        ],
      ),
    ));
  }

  void _toggleSex(item) {
    setState(() {
      sex = item;
    });
  }

  // void _setValidate(String key, bool value) {
  //   setState(() {
  //     formValidate[key] = value;
  //   });
  // }
}
