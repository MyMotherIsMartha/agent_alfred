import 'package:agent37_flutter/api/dic.dart';
import 'package:agent37_flutter/api/oss.dart';
import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:color_dart/hex_color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-address.dart';
import 'package:agent37_flutter/components/v-input.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'dart:io';

class PerfectEnterprise1 extends StatefulWidget {

  @override
  _PerfectEnterprise1State createState() => _PerfectEnterprise1State();
}

class _PerfectEnterprise1State extends State<PerfectEnterprise1> {
  final _formKey = GlobalKey<FormState>();
  var licenseUrl = 'https://static37.woouo.com/agent/20200408/22b14781819d49ab98a9e9d547f9e48f.jpg';
  List<dynamic> jobList;
  // 获取职业数据
  Future<List> getJobList() async {
    var response = await DicApi().getOccupations();
    List<dynamic> tempList = response.data['data'];
    return tempList;
  }
  String errorMsg = '';

  Map uploadData;

  String jobCode;
  String enterpriseName;
  String registerCode;
  String areaCode;
  String areaName;
  String addressStr;
  String legalName;
  String mobile;
  String idNo;

  final jobCodeCtrl = TextEditingController();
  final _enterpriseNameCtrl = TextEditingController();
  final _registerCodeCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _legalPersonCtrl = TextEditingController();
  final mobileController = TextEditingController();
  final idNoController = TextEditingController();
  final areaCtrl = TextEditingController();

  Map formValidate = {
    'jobCode': true,
    'enterpriseName': true,
    'registerCode': true,
    'areaCode': true,
    'addressStr': true,
    'legalName': true,
    'mobile': false,
    'idNo': false
  };

  _getEnterpriseInfo() async {
    var result = await MemberApi().getEnterpriseInfo();
    var resultData = result.data['data'];
    print(result.data.toString());
    setState(() {
      licenseUrl = resultData['businessLicensePicture'];
    });
    jobCode = resultData['industryCode'];
    jobCodeCtrl.text = resultData['industryName'];
    enterpriseName = _enterpriseNameCtrl.text = resultData['enterpriseName'];
    areaName = areaCtrl.text = resultData['province'] + ',' + resultData['city'] + ',' + resultData['district'];
    areaCode = resultData['areaCode'];
    registerCode = _registerCodeCtrl.text = resultData['registerCode'];
    addressStr = _addressCtrl.text = resultData['registerAddress'];
    legalName = _legalPersonCtrl.text = resultData['legalPerson'];
    mobile = mobileController.text = resultData['legalMobile'];
    idNo = idNoController.text = resultData['legalIdCard'];
    formValidate['mobile'] = mobile != null;
    formValidate['idNo'] = idNo != null;
  }

  _getJobList() async {
    var response = await DicApi().getOccupations();
    jobList = response.data['data'];
  }

  _getPerfectInfo() async {
    var result = await MemberApi().getPerfectInfo();
    var resultData = result.data['data'];
    print(result.data.toString());
    setState(() {
      licenseUrl = resultData['businessLicensePicture'];
    });
    jobCode = resultData['industryCode'];
    jobCodeCtrl.text = resultData['industryName'];
    enterpriseName = _enterpriseNameCtrl.text = resultData['enterpriseName'];
    areaName = areaCtrl.text = resultData['enterpriseProvince'] + ',' + resultData['enterpriseCity'] + ',' + resultData['enterpriseDistrict'];
    areaCode = resultData['enterpriseAreaCode'];
    registerCode = _registerCodeCtrl.text = resultData['registerCode'];
    addressStr = _addressCtrl.text = resultData['registerAddress'];
    legalName = _legalPersonCtrl.text = resultData['legalPerson'];
    mobile = mobileController.text = resultData['legalMobile'];
    idNo = idNoController.text = resultData['legalIdCard'];
    formValidate['mobile'] = mobile != null;
    formValidate['idNo'] = idNo != null;
  }

  @override
  void initState() {
    super.initState();
    // G.setContext(context);
    // G.setPref('token', 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJBdXRob3JpemF0aW9uIjoiIiwibmJmIjoxNTg2MzI2MjE0LCJpc3MiOiIzN2R1bGlnb3UiLCJtb2JpbGUiOiIxODg5MjY2MzAyNSIsImV4cCI6MTU4NjkzMTAxNCwiaWF0IjoxNTg2MzI2MjE0LCJ1c2VySWQiOjEyMDQ1ODkwNDYxNjM5MDI0NjYsInVzZXJuYW1lIjoiMTg4OTI2NjMwMjUifQ.FwMvr15n_TU7kmJwKCSGO97gx5qcwtQCFIn0-tEv65c');
    
    // _getEnterpriseInfo();
    _getPerfectInfo();
    _getJobList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
  }

  /*拍照*/
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
        licenseUrl = resultData['businessLicenseUrl'];
        enterpriseName = _enterpriseNameCtrl.text = resultData['enterpriseName'];
        registerCode = _registerCodeCtrl.text = resultData['registerCode'];
        _addressCtrl.text = resultData['registerAddress'];
        addressStr = _addressCtrl.text = resultData['registerAddress'];
        legalName = _legalPersonCtrl.text = resultData['legalPerson'];
      });
      // var uploadJson = FluroConvertUtils.object2string(uploadData);
      // G.navigateTo(
      //   context, Routes.uploadLicenseForm + "?uploadJson=$uploadJson");
    } else {
      print(resultInfo.data['message']);
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('完善企业信息'),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Container(
            color: hex('#F3F4F6'),
            child: Column(
              children: <Widget>[
                // Container(
                //   padding: EdgeInsets.all(15),
                //   alignment: Alignment.centerLeft,
                //   child: Text('收货地址',
                //       style: TextStyle(color: hex('#999'), fontSize: G.setSp(30))),
                // ),
                G.spacing(20),
                InkWell(
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
                        decoration: BoxDecoration(
                          // color: Colors.black26,
                          image: DecorationImage(
                            image: NetworkImage(licenseUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // alignment: Alignment.center,
                        width: G.setWidth(709),
                        height: G.setHeight(396),
                      ),
                      Container(
                        width: G.setWidth(709),
                        height: G.setHeight(396),
                        color: Colors.black38
                      ),
                      Container(
                        width: G.setWidth(709),
                        height: G.setHeight(396),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: G.setWidth(80),
                              height: G.setWidth(80),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("lib/assets/images/enterprise/plus.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text('点击重新上传', style: TextStyle(
                              color: hex('#fff'),
                              fontSize: G.setSp(30)
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                G.spacing(20),
                Container(
                  color: hex('#FFF'),
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: G.setHeight(100),
                          padding: EdgeInsets.symmetric(
                            horizontal: G.setWidth(30)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: hex('#eee'), width:  G.setWidth(1)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: G.setWidth(180),
                                child: Text('所属行业', style: TextStyle(
                                  fontSize: G.setSp(30),
                                  color: hex('#666')
                                ))
                              ),
                              Expanded(
                                child: InkWell(
                                    onTap: () {
                                      _showPickerJobs(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField(
                                            style: TextStyle(
                                               fontSize: G.setSp(30)),
                                            controller: jobCodeCtrl,
                                            // initialValue: '1234',
                                            onTap: () {
                                              _showPickerJobs(context);
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
                                        iconarrow(size: G.setWidth(35))
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // VInput(
                        //   type: TextInputType.text,
                        //   controller: _enterpriseNameCtrl,
                        //   hintText: '请输入企业名称',
                        //   label: '企业名称',
                        //   onChange: (e) {
                        //     String hint = Validate.isNon(e) ? '请输入企业名称' : null;
                        //     setState(() {
                        //       name = e;
                        //       formValidate['name'] = Validate.isNon(hint);
                        //     });
                        //   },
                        // ),
                        Container(
                          height: G.setHeight(100),
                          padding: EdgeInsets.symmetric(
                            horizontal: G.setWidth(30)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: hex('#eee'), width:  G.setWidth(1)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: G.setWidth(180),
                                child: Text('企业名称', style: TextStyle(
                                  fontSize: G.setSp(30),
                                  color: hex('#666')
                                ))
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                    fontSize: G.setSp(30)),
                                  decoration:
                                      InputDecoration(border: InputBorder.none, hintText: '请输入企业名称'),
                                  controller: _enterpriseNameCtrl,
                                  // onChanged: (e) {
                                  //   setState(() {
                                  //     _enterpriseNameCtrl.value = G.setTextEdit(e);
                                  //   });
                                  // },
                                  onSaved: (e) {
                                    setState(() {
                                      _enterpriseNameCtrl.text = e;
                                      formValidate['enterpriseName'] = Validate.isNon(e);
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
                          padding: EdgeInsets.symmetric(
                            horizontal: G.setWidth(30)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: hex('#eee'), width:  G.setWidth(1)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: G.setWidth(180),
                                child: Text('营业执照号', style: TextStyle(
                                  fontSize: G.setSp(30),
                                  color: hex('#666')
                                ))
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: G.setSp(30)),
                                  decoration:
                                      InputDecoration(border: InputBorder.none, hintText: '请输入统一社会信用代码'),
                                  controller: _registerCodeCtrl,
                                  onSaved: (e) {
                                    setState(() {
                                      _registerCodeCtrl.text = e;
                                      formValidate['registerCode'] = Validate.isNon(e);
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
                        VAddress(
                          label: '注册地区',
                          labelWidth: G.setWidth(180),
                          areaId: areaCode, // ,
                          controller: areaCtrl,
                          cb: (value, areaStr) {
                            areaCode = value;
                            print(areaStr);
                            areaName = areaStr;
                            setState(() {
                              formValidate['areaCode'] = !Validate.isNon(value);
                            });
                          },
                        ),
                        Container(
                          height: G.setHeight(100),
                          padding: EdgeInsets.symmetric(
                            horizontal: G.setWidth(30)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: hex('#eee'), width:  G.setWidth(1)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: G.setWidth(180),
                                child: Text('注册地址', style: TextStyle(
                                  fontSize: G.setSp(30),
                                  color: hex('#666')
                                ))
                              ),
                              Expanded(
                                child: TextFormField(
                                  // maxLines: 3,
                                  style: TextStyle(
                                    fontSize: G.setSp(30)),
                                  keyboardType: TextInputType.text,
                                  decoration:
                                      InputDecoration(border: InputBorder.none, hintText: '请输入详细注册地址'),
                                  controller: _addressCtrl,
                                  onChanged: (e) {
                                    addressStr = e;
                                    setState(() {
                                      formValidate['addressStr'] = !Validate.isNon(e);
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
                          padding: EdgeInsets.symmetric(
                            horizontal: G.setWidth(30)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: hex('#eee'), width:  G.setWidth(1)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: G.setWidth(180),
                                child: Text('法人姓名', style: TextStyle(
                                  fontSize: G.setSp(30),
                                  color: hex('#666')
                                ))
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none, hintText: '请输入企业法人名称'),
                                  controller: _legalPersonCtrl,
                                  onChanged: (e) {
                                    legalName = e;
                                    setState(() {
                                      formValidate['legalName'] = !Validate.isNon(e);
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
                        VInput(
                          controller: mobileController,
                          hintText: '请输入手机号',
                          label: '法人手机号',
                          labelWidth: G.setWidth(180),
                          maxLength: 11,
                          type: TextInputType.number,
                          inputFormatters: WhitelistingTextInputFormatter(RegExp("[0-9]")),
                          validator: (value) {
                            if (Validate.isNon(errorMsg)) {
                              setState(() {
                                errorMsg = Validate.checkMobile(value);
                              });
                            }
                            print(errorMsg);
                          },
                          onChange: (e) {
                            setState(() {
                              formValidate['mobile'] =
                                  Validate.checkMobile(e) == null;
                            });
                            mobile = e;
                          },
                        ),
                        VInput(
                            type: TextInputType.number,
                            controller: idNoController,
                            hintText: '请输入身份证号',
                            label: '法人身份证',
                            maxLength: 18,
                            labelWidth: G.setWidth(180),
                            onChange: (e) {
                              idNo = e;
                              var reg =
                                  r"(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)";
                              setState(() {
                                formValidate['idNo'] = RegExp(reg).hasMatch(e);
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  child: VButton(
                    disabled: formValidate.containsValue(false),
                    text: '下一步', 
                    fn: () async {
                      if (_formKey.currentState.validate()) {
                        var areaAry = areaName.split(',');
                        print('test');
                        print(areaAry);
                        Map params = {
                          'industryCode': jobCode,
                          'industryName': jobCodeCtrl.text,
                          'registerAddress': addressStr,
                          'enterpriseAreaCode': areaCode,
                          'businessLicensePicture': licenseUrl,
                          'enterpriseName': enterpriseName,
                          'legalPerson': legalName,
                          'registerCode':registerCode,
                          'enterpriseProvince': areaAry[0],
                          'enterpriseCity': areaAry[1],
                          'enterpriseDistrict': areaAry[2],
                          'legalMobile': mobile,
                          'legalIdCard': idNo
                          // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
                        };
                        var legalName2 = FluroConvertUtils.fluroCnParamsEncode(legalName);
                        var stepJson = FluroConvertUtils.object2string(params);
                        print(params);
                        G.navigateTo(
                        context, Routes.perfectEnterprise2 + "?legalName=$legalName2&stepJson=$stepJson");
                        
                      }
                    }
                  )
                )
                // Container(
                //   width: G.setWidth(710),
                //   height: G.setHeight(100),
                //   margin: EdgeInsets.only(top: 20, bottom: 30),
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(colors: [hex('#685AFF'), hex('#69A5FF')]),
                //     borderRadius: BorderRadius.circular(G.setHeight(50))
                //   ),

                //   child: FlatButton(
                //     disabledColor: hex('#666'),
                //     color: Colors.transparent,
                //     shape: StadiumBorder(),
                //     textColor: Colors.white,
                //     onPressed: formValidate.containsValue(false) ? null : () async {
                      
                //       // Validate returns true if the form is valid, otherwise false.
                //       if (_formKey.currentState.validate()) {
                //         var areaAry = areaName.split(',');
                //         print('test');
                //         print(areaAry);
                //         Map params = {
                //           'industryCode': jobCode,
                //           'industryName': jobCodeCtrl.text,
                //           'registerAddress': addressStr,
                //           'areaCode': int.parse(areaCode),
                //           'businessLicensePicture': licenseUrl,
                //           'enterpriseName': enterpriseName,
                //           'legalPerson': legalName,
                //           'registerCode':registerCode,
                //           'province': areaAry[0],
                //           'city': areaAry[1],
                //           'district': areaAry[2],
                //           'legalMobile': mobile,
                //           'idCard': idNo
                //           // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
                //         };
                //         var legalName2 = FluroConvertUtils.fluroCnParamsEncode(legalName);
                //         print(params);
                //         G.navigateTo(
                //         context, Routes.perfectEnterprise2 + "?legalName=$legalName2");
                        
                //       }
                //     },
                //     child: Text('下一步', style: TextStyle(
                //       fontSize: G.setSp(36),
                //       color: Colors.white
                //     )),
                //   ),
                // ),
              ],
            ),
          ),
        )
      );
  }

  

  _showPickerJobs(BuildContext context) {
    List<PickerItem<dynamic>> testArray = jobList.map<PickerItem>((item) => PickerItem(text: Text(item['name']), value: item['code'])).toList();
    Picker picker = new Picker(
      adapter: PickerDataAdapter(data: testArray),
      cancelText: '取消',
      confirmText: '确认',
      // changeToFirst: true,
      // textAlign: TextAlign.left,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues().first);
        formValidate['jobCode'] = true;
        jobCodeCtrl.value = TextEditingValue(text: picker.getSelectedValues().first);
        jobCode = picker.getSelectedValues().first;
        jobCodeCtrl.text = jobList[value.first]['name'];
        print(jobCodeCtrl.text);
      }
    );
    picker.showModal(context);
  }
}
