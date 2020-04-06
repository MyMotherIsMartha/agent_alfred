import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-address.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:agent37_flutter/models/address.dart';
import 'package:agent37_flutter/provide/address.dart';
import 'package:agent37_flutter/utils/citys.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    addressProvide = Provider.of<AddressProvide>(G.currentContext);
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
  // eventBus

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: hex('#F3F4F6'),
        appBar: AppBar(
          title: Text('收货地址'),
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
                          hintText: '请输入真实姓名',
                          label: '姓名',
                          onChange: (e) {
                            // String hint = Validate.isNon(e) ? '请输入真实姓名' : null;
                            setState(() {
                              consigneeName = e;
                              formValidate['consigneeName'] =
                                  !Validate.isNon(e);
                            });
                          },
                        ),
                        VInput(
                          controller: mobileController,
                          hintText: '请输入联系方式',
                          value: addressModel?.mobile ?? '',
                          label: '联系方式',
                          maxLength: 11,
                          type: TextInputType.phone,
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
                          cb: (value, areaStr) {
                            print(formValidate);
                            print(areaStr);
                            setState(() {
                              areaCode = value;
                              areaName = areaStr;
                              formValidate['area'] = !Validate.isNon(value);
                            });
                          },
                        ),
                        VInput(
                          controller: addressController,
                          hintText: '请输入详细地址',
                          value: addressModel?.address ?? '',
                          label: '详细地址',
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
                    var result = await addressProvide.updateAddress(data);
                    if (result.data['code'] == 200) {
                      G.router.pop(context);
                      // G.router.navigateTo(context, '/create-account');
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
