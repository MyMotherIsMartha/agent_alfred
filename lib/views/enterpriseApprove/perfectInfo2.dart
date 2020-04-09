import 'package:agent37_flutter/api/dic.dart';
import 'package:agent37_flutter/api/oss.dart';
import 'package:agent37_flutter/api/member.dart';
import 'package:color_dart/hex_color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-address.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'dart:io';

class PerfectEnterprise2 extends StatefulWidget {

  final String legalName;

  PerfectEnterprise2({this.legalName});

  @override
  _PerfectEnterprise2State createState() => _PerfectEnterprise2State();
}

class _PerfectEnterprise2State extends State<PerfectEnterprise2> {
  final _formKey = GlobalKey<FormState>();

  final legalNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final areaController = TextEditingController();
  final addressStrController = TextEditingController();

  var mobile;
  var email;
  var areaCode;
  var areaName;
  var addressStr;

  var frontIdCardImg1;
  var backIdCardImg1;
  var frontIdCardImg2;
  var backIdCardImg2;

  Map formValidate = {
    'mobile': true,
    'email': true,
    'areaCode': true,
    'addressStr': true,
    'legalName': true,
  };

  Widget titleWidget(padding, size, String text) {
    return Padding(padding: EdgeInsets.only(left: padding), child: Text(text, textAlign: TextAlign.left, style: TextStyle(fontSize: size, height: 2.4, color: hex('#666'))));
  }

  idCardImg(String type, int index) {
    if (type == 'front') {
      return AssetImage('lib/assets/images/enterprise/idCardFront.png');
    } else {
      return AssetImage('lib/assets/images/enterprise/idCardBack.png');
    }
  }

  Widget uploadIdCard(String type, int index) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context){
                return new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text("拍照"),
                      onTap: () {
                        _takePhoto();
                        Navigator.pop(context);
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text("相册"),
                      onTap: () {
                        _openGallery();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }
          );
        },
        child: Stack(
            children: <Widget>[
              Container(
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                          // color: Colors.black26,
                  image: DecorationImage(
                    image: idCardImg(type, index),
                    fit: BoxFit.cover,
                  ),
                ),
                width: G.setWidth(330),
                height: G.setHeight(206),
                // child: Image(image: new AssetImage('lib/assets/images/enterprise/idCardFront.png')),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                width: G.setWidth(330),
                height: G.setHeight(206),
              ),
              Container(
                width: G.setWidth(330),
                height: G.setHeight(206),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: G.setWidth(120),
                      height: G.setWidth(120),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/enterprise/cameraBlue.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
  }

  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _uploadImage(image);
    }
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    if (image != null) {
      _uploadImage(image);
    }
  }

  _uploadImage(File image) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    // FormData formData = FormData.from({
    //   "userId": "10000024",
    //   "file": UploadFileInfo(new File(path), name,
    //       contentType: ContentType.parse("image/$suffix"))
    // });
    FormData data = FormData.fromMap({
        "file": await MultipartFile.fromFile(path,filename: name + '.' + suffix)
    });
    var resultInfo = await OssApi().uploadEnterpriseLicense(data);
    if (resultInfo.data['success'] == true) {
      Map resultData = resultInfo.data['data'];
      setState(() {
        // licenseUrl = resultData['businessLicenseUrl'];
        // enterpriseName = _enterpriseNameCtrl.text = resultData['enterpriseName'];
        // registerCode = _registerCodeCtrl.text = resultData['registerCode'];
        // _areaStrCtrl.text = resultData['registerAddress'];
        // addressStr = _areaStrCtrl.text = resultData['registerAddress'];
        // legalName = _legalPersonCtrl.text = resultData['legalPerson'];
      });
      // var uploadJson = FluroConvertUtils.object2string(uploadData);
      // G.router.navigateTo(
      //   context, Routes.uploadLicenseForm + "?uploadJson=$uploadJson");
    } else {
      print(resultInfo.data['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    String legalName2 = FluroConvertUtils.fluroCnParamsDecode(widget.legalName);
    legalNameController.text = legalName2;

    return Scaffold(
      appBar: AppBar(
        title: Text('完善企业信息'),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleWidget(G.setWidth(30), G.setSp(24), '法人信息'),
              Container(
                color: hex('#fff'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    VInput(
                      controller: legalNameController,
                      hintText: '请输入手机号',
                      label: '姓名',
                      readOnly: true
                    ),
                    titleWidget(G.setWidth(30), G.setSp(30), '身份证上传'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setHeight(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: G.setWidth(330),
                            child: Column(
                              children: <Widget>[
                                uploadIdCard('front', 1),
                                Text('上传正面照', style: TextStyle(height: 2),)
                              ],
                            ),
                          ),
                          Container(
                            width: G.setWidth(330),
                            child: Column(
                              children: <Widget>[
                                uploadIdCard('back', 1),
                                Text('上传背面照', style: TextStyle(height: 2),)
                              ],
                            ),
                          )
                        ]
                      ),
                    )
                  ],
                )
              ),
              titleWidget(G.setWidth(30), G.setSp(24), '负责人信息'),
              Container(
                color: hex('#FFF'),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      VInput(
                        controller: legalNameController,
                        hintText: '请输入手机号',
                        label: '姓名',
                        readOnly: true
                      ),
                      VInput(
                        controller: mobileController,
                        hintText: '请输入手机号',
                        label: '手机号',
                        maxLength: 11,
                        type: TextInputType.phone,
                        onChange: (e) {
                          setState(() {
                            formValidate['mobile'] =
                                Validate.checkMobile(e) == null;
                          });
                          mobile = e;
                        },
                      ),
                      VInput(
                        controller: emailController,
                        hintText: '请输入邮箱',
                        label: '邮箱',
                        type: TextInputType.text,
                        onChange: (e) {
                          setState(() {
                            formValidate['email'] = !Validate.isNon(e);
                          });
                          email = e;
                        },
                      ),
                      VAddress(
                        label: '注册地区',
                        areaId: areaCode,
                        controller: areaController,
                        cb: (value, areaStr) {
                          areaCode = value;
                          print(areaStr);
                          areaName = areaStr;
                          setState(() {
                            formValidate['areaCode'] = !Validate.isNon(value);
                          });
                        },
                      ),
                      VInput(
                        controller: addressStrController,
                        hintText: '请填写详细地址',
                        label: '详细地址',
                        type: TextInputType.text,
                        onChange: (e) {
                          setState(() {
                            formValidate['addressStr'] = !Validate.isNon(e);
                          });
                          addressStr = e;
                        },
                      ),
                      titleWidget(G.setWidth(30), G.setSp(30), '身份证上传'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setHeight(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: G.setWidth(330),
                              child: Column(
                                children: <Widget>[
                                  uploadIdCard('front', 2),
                                  Text('上传正面照', style: TextStyle(height: 2),)
                                ],
                              ),
                            ),
                            Container(
                              width: G.setWidth(330),
                              child: Column(
                                children: <Widget>[
                                  uploadIdCard('back', 1),
                                  Text('上传背面照', style: TextStyle(height: 2),)
                                ],
                              ),
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: G.setWidth(710),
                  height: G.setHeight(100),
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [hex('#685AFF'), hex('#69A5FF')]),
                    borderRadius: BorderRadius.circular(G.setHeight(50))
                  ),
                  child: FlatButton(
                    disabledColor: hex('#666'),
                    color: Colors.transparent,
                    shape: StadiumBorder(),
                    textColor: Colors.white,
                    onPressed: formValidate.containsValue(false) ? null : () async {
                      
                      // Validate returns true if the form is valid, otherwise false.
                      if (_formKey.currentState.validate()) {
                        var areaAry = areaName.split(',');
                        print('test');
                        print(areaAry);
                        Map params = {
                          // 'industryCode': jobCode,
                          // 'industryName': jobCodeCtrl.text,
                          // 'registerAddress': addressStr,
                          // 'areaCode': int.parse(areaCode),
                          // 'businessLicensePicture': licenseUrl,
                          // 'enterpriseName': enterpriseName,
                          // 'legalPerson': legalName,
                          // 'registerCode':registerCode,
                          // 'province': areaAry[0],
                          // 'city': areaAry[1],
                          // 'district': areaAry[2],
                          // 'legalMobile': mobile,
                          // 'idCard': idNo
                          // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
                        };
                        var legalName2 = FluroConvertUtils.fluroCnParamsEncode('test');
                        print(params);
                        G.router.navigateTo(
                        context, Routes.perfectEnterprise2 + "?legalName=$legalName2");
                        
                      }
                    },
                    child: Text('提交审核', style: TextStyle(
                      fontSize: G.setSp(36),
                      color: Colors.white
                    )),
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}