import 'package:agent37_flutter/components/v-address.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/models/address.dart';
import 'package:agent37_flutter/provide/address.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  AddressModel addressModel;
  String address;
  String areaCode;
  String mobile;
  String consigneeName;
  String areaName;
  String province;
  String city;
  String district;
  String errorMsg;
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();
  Map formValidate = {
    'consigneeName': false,
    'mobile': false,
    'area': false,
    'address': false,
  };
  AddressProvide addressProvide;

  checkChange() {
    bool flag = true;
    if (consigneeName != addressProvide.address.consigneeName) {
      flag = false;
    }
    if (mobile != addressProvide.address.mobile) {
      flag = false;
    }
    if (areaCode != addressProvide.address.areaCode) {
      flag = false;
    }
    if (address != addressProvide.address.address) {
      flag = false;
    }
    if (flag) {
      G.router.pop(context);
    } else {
      // 
      YYDialog().build(context)
      ..width = G.setWidth(440)
      ..borderRadius = G.setWidth(20)
      ..text(
        padding: EdgeInsets.all(G.setWidth(60)),
        alignment: Alignment.center,
        text: "您填写的信息尚未保存，是否返回",
        color: hex('#333'),
        fontSize: G.setSp(36),
        fontWeight: FontWeight.w500,
      )
      ..divider()
      ..doubleButton(
        padding: EdgeInsets.only(top: 10.0),
        gravity: Gravity.center,
        withDivider: true,
        text1: "取消",
        color1: hex('#85868A'),
        fontSize1: G.setSp(36),
        onTap1: () {
          print("取消");
        },
        text2: "确定",
        color2: hex('##0091F0'),
        fontSize2: G.setSp(36),
        onTap2: () {
          G.router.pop(context);
        },
      )
      ..dismissCallBack = () {
        if (Validate.isNon(G.getPref('token'))) {
          Provider.of<AddressProvide>(context).resetAddress();
          Future.delayed(Duration(microseconds: 100), () {
            G.navigateTo(context, '/login', replace: true);
          });
        }
      }
      ..show();
    }
  }

  @override
  void initState() {
    super.initState();
    addressProvide = Provider.of<AddressProvide>(G.currentContext);
    print('address is');
    print(addressModel == null);
    addressModel = addressProvide.address;
    if (addressModel != null) {
      String area =
          '${addressModel.province},${addressModel.city},${addressModel.district}';
      setState(() {
        consigneeName = addressModel.consigneeName;
        mobile = addressModel.mobile;
        address = addressModel.address;
        areaCode = addressModel.areaCode;
        areaName = area;
      });
      areaController.value = G.setTextEdit(area);
      for (var key in formValidate.keys) {
        formValidate[key] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: hex('#F3F4F6'),
        appBar: AppBar(
          leading: BackButton(
            onPressed: checkChange,
          ),
          title: Text('新增地址'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
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
                          type: TextInputType.text,
                          value: addressModel?.consigneeName ?? '',
                          controller: nameController,
                          // inputFormatters: WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[\u4e00-\u9fa5]|[.]+")),
                          hintText: '请填写姓名',
                          label: '收货人',
                          maxLength: 10,
                          onChange: (e) {
                            // String hint = Validate.isNon(e) ? '请填写真实姓名' : null;
                            setState(() {
                              consigneeName = e;
                              formValidate['consigneeName'] =
                                  !Validate.isNon(e);
                            });
                          },
                        ),
                        VInput(
                          controller: mobileController,
                          hintText: '请填写联系方式',
                          value: addressModel?.mobile ?? '',
                          label: '联系电话',
                          maxLength: 11,
                          type: TextInputType.number,
                          inputFormatters: WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          onChange: (e) {
                            setState(() {
                              mobile = e;
                              formValidate['mobile'] =
                                  Validate.checkMobile(e) == null;
                            });
                          },
                        ),
                        VAddress(
                          areaId: areaCode,
                          controller: areaController,
                          label: '所在地区',
                          hintText: '请选择省市区',
                          cb: (value, areaStr) {
                            setState(() {
                              areaCode = value;
                              areaName = areaStr;
                              formValidate['area'] = !Validate.isNon(value);
                            });
                          },
                        ),
                        VInput(
                          controller: addressController,
                          hintText: '请填写详细地址',
                          value: addressModel?.address ?? '',
                          label: '详细地址',
                          maxLength: 25,
                          onChange: (e) {
                            setState(() {
                              address = e;
                              formValidate['address'] = !Validate.isNon(e);
                            });
                            print(formValidate);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                G.spacing(80),
                VButton(
                  disabled: formValidate.containsValue(false),
                  width: 690,
                  height: 100,
                  fn: () async {
                    List<String> areaLev = areaName.split(',');
                    Map data = {
                      'consigneeName': consigneeName,
                      'mobile': mobile,
                      'areaCode': areaCode,
                      'address': address,
                      'province': areaLev[0],
                      'city': areaLev[1],
                      'district': areaLev[2],
                    };
                    print(data);
                    var regx = RegExp(r"^[\u4e00-\u9fa5a-zA-Z0-9.]+$");
                    if (!regx.hasMatch(consigneeName)) {
                      G.toast('姓名只能输入中英文');
                      return;
                    }
                    var result = await addressProvide.updateAddress(data);
                    if (result.data['code'] == 200) {
                      G.router.pop(context);
                      // G.navigateTo(context, '/create-account');
                    }
                  },
                  text: '确定',
                )
              ],
            ),
          ),
        ));
  }
}
