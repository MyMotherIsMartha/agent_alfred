import 'package:agent37_flutter/api/dic.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:color_dart/hex_color.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-address.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:agent37_flutter/api/member.dart';

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
  bool btnCanClick = true;

  List<dynamic> jobList;

  // 获取职业数据
  Future<List> getJobList() async {
    var response = await DicApi().getOccupations();
    List<dynamic> tempList = response.data['data'];
    return tempList;
  }


  Map uploadData;

  final jobCodeCtrl = TextEditingController();
  final _enterpriseNameCtrl = TextEditingController();
  final _registerCodeCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _legalPersonCtrl = TextEditingController();
  final areaCtrl = TextEditingController();

  String jobCode;
  String areaCode;
  String areaName;
  String addressStr;
  String enterpriseName;
  String registerCode;
  String legalPerson;

  Map formValidate = {
    'jobCode': false,
    'areaCode': false,
    'registerCode': false,
    'enterpriseName': false,
    'addressStr': false,
    'legalPerson': false
  };

  @override
  void initState() {
    super.initState();
    uploadData =  FluroConvertUtils.string2map(widget.uploadJson);
    if (uploadData['isRequest'] == true) {
      _getEnterpriseInfo();
    } else {
      enterpriseName = _enterpriseNameCtrl.text = uploadData['enterpriseName'];
      registerCode = _registerCodeCtrl.text = uploadData['registerCode'];
      addressStr = _addressCtrl.text = uploadData['address'];
      legalPerson = _legalPersonCtrl.text = uploadData['legalPerson'];
      formValidate['enterpriseName'] = enterpriseName != null;
      formValidate['registerCode'] = registerCode != null;
      formValidate['addressStr'] = addressStr != null;
      formValidate['legalPerson'] = legalPerson != null;
    }
    _getJobList();
  }

  _getJobList() async {
    var response = await DicApi().getOccupations();
    jobList = response.data['data'];
  }

  _getEnterpriseInfo() async {
    var result = await MemberApi().getEnterpriseInfo();
    var resultData = result.data['data'];
    print(result.data.toString());
    
    setState(() {
      uploadData =  resultData;
      uploadData['businessLicenseUrl'] = uploadData['businessLicensePicture'];
      jobCode = resultData['industryCode'];
      jobCodeCtrl.text = resultData['industryName'];
      enterpriseName = _enterpriseNameCtrl.text = resultData['enterpriseName'];
      areaName = areaCtrl.text = resultData['province'] + ',' + resultData['city'] + ',' + resultData['district'];
      areaCode = resultData['areaCode'];
      registerCode = _registerCodeCtrl.text = resultData['registerCode'];
      addressStr = _addressCtrl.text = resultData['registerAddress'];
      legalPerson = _legalPersonCtrl.text = resultData['legalPerson'];
      formValidate['enterpriseName'] = enterpriseName != null;
      formValidate['registerCode'] = registerCode != null;
      formValidate['addressStr'] = addressStr != null;
      formValidate['legalPerson'] = legalPerson != null;
      formValidate['areaCode'] = areaCode != null;
      formValidate['jobCode'] = jobCode != null;
    });
  }

  


  

  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: hex('#f3f4f6'),
      appBar: AppBar(
        title: Text('企业认证'),
        centerTitle: true,
        
        leading: BackButton(onPressed: () {
          G.navigateTo(context, '/resultPage?status=1', replace: true, transition: TransitionType.inFromLeft);
        },),
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
              Container(
                height: G.setHeight(20)
              ),
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
                                width: G.setWidth(160),
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
                              width: G.setWidth(160),
                              child: Text('企业名称', style: TextStyle(
                                fontSize: G.setSp(30),
                                color: hex('#666')
                              ))
                            ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration:
                                    InputDecoration(border: InputBorder.none, hintText: '请输入企业名称'),
                                controller: _enterpriseNameCtrl,
                                onChanged: (e) {
                                  
                                  setState(() {
                                    enterpriseName = e;
                                    formValidate['enterpriseName'] = !Validate.isNon(e);
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
                              padding: EdgeInsets.only(right: G.setWidth(20)),
                              child: Text('营业执照号', style: TextStyle(
                                fontSize: G.setSp(30),
                                color: hex('#666')
                              ))
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(border: InputBorder.none, hintText: '请输入统一社会信用代码'),
                                controller: _registerCodeCtrl,
                                onChanged: (e) {
                                  
                                  setState(() {
                                    registerCode = e;
                                    formValidate['registerCode'] = !Validate.isNon(e);
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
                        areaId: areaCode,
                        controller: areaCtrl,
                        cb: (value, areaStr) {
                          print('areaId');
                          print(areaStr.split(',').toString());
                          print(value);
                          setState(() {
                            areaCode = value;
                            areaName = areaStr;
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
                              width: G.setWidth(160),
                              child: Text('注册地址', style: TextStyle(
                                fontSize: G.setSp(30),
                                color: hex('#666')
                              ))
                            ),
                            Expanded(
                              child: TextFormField(
                                // maxLines: 3,
                                keyboardType: TextInputType.text,
                                decoration:
                                    InputDecoration(border: InputBorder.none, hintText: '请输入详细注册地址'),
                                controller: _addressCtrl,
                                onChanged: (e) {
                                  
                                  setState(() {
                                    addressStr = e;
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
                              width: G.setWidth(160),
                              child: Text('法人姓名', style: TextStyle(
                                fontSize: G.setSp(30),
                                color: hex('#666')
                              ))
                            ),
                            Expanded(
                              child: TextFormField(
                                // keyboardType: TextInputType.number,
                                // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
                                decoration:
                                    InputDecoration(border: InputBorder.none, hintText: '请输入企业法人名称'),
                                controller: _legalPersonCtrl,
                                onChanged: (e) {
                                  setState(() {
                                    legalPerson = e;
                                    formValidate['legalPerson'] = !Validate.isNon(e);
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
                margin: EdgeInsets.only(top: 60, bottom: 30),
                child: VButton(
                  disabled: formValidate.containsValue(false),
                  text: '提交审核', 
                  fn: () async {
                    // Validate returns true if the form is valid, otherwise false.
                    if (!btnCanClick) {
                      return;
                    }
                    G.showLoading(context);
                    btnCanClick = false;
                    if (_formKey.currentState.validate()) {
                      print('test1121');
                      var areaAry = areaName.split(',');
                      Map params = {
                        'industryCode': jobCode,
                        'industryName': jobCodeCtrl.text,
                        'registerAddress': addressStr,
                        'areaCode': areaCode,
                        'businessLicensePicture': uploadData['businessLicenseUrl'],
                        'enterpriseName': enterpriseName,
                        'legalPerson': legalPerson,
                        'registerCode': registerCode,
                        'province': areaAry[0],
                        'city': areaAry[1],
                        'district': areaAry[2]
                        // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
                      };
                      var result = await MemberApi().updateEnterpriseInfo(params);

                      G.closeLoading();
                      
                      if (result.data['code'] == 200) {
                        print('test');
                        if (result.data['isPopup']) {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return CupertinoAlertDialog(
                                title: Text('资质审核已通过'),
                                // content:Text('我是content'),
                                actions:<Widget>[
                                  
                                  CupertinoDialogAction(
                                    child: Text('取消', style: TextStyle(color: hex('#85868A')),),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  ),
                              
                                  CupertinoDialogAction(
                                    child: Text('确定'),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      G.navigateTo(context, '/index');
                                    },
                                  )
                                ]
                              );
                            },
                          );
                        } else {
                          G.navigateTo(context, '/resultPage?status=1');
                        }
                      } else {
                        print('出错');
                      }
                      Future.delayed(Duration(seconds: 2), () {
                        btnCanClick = true;
                      });
                      
                    }
                  }
                )
              ),
              // Container(
              //   width: G.setWidth(710),
              //   height: G.setHeight(100),
              //   margin: EdgeInsets.only(top: 60),
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(colors: [hex('#685AFF'), hex('#69A5FF')]),
              //     borderRadius: BorderRadius.circular(G.setHeight(50))
              //   ),
              //   child: FlatButton(
              //     color: Colors.transparent,
              //     textColor: Colors.white,
              //     onPressed: () async {
              //       // Validate returns true if the form is valid, otherwise false.
              //       if (!btnCanClick) {
              //         return;
              //       }
              //       G.showLoading(context);
              //       btnCanClick = false;
              //       if (_formKey.currentState.validate()) {
              //         print('test1121');
              //         var areaAry = areaName.split(',');
              //         Map params = {
              //           'industryCode': jobCode,
              //           'industryName': jobCodeCtrl.text,
              //           'registerAddress': addressStr,
              //           'areaCode': areaCode,
              //           'businessLicensePicture': uploadData['businessLicenseUrl'],
              //           'enterpriseName': enterpriseName,
              //           'legalPerson': legalPerson,
              //           'registerCode': registerCode,
              //           'province': areaAry[0],
              //           'city': areaAry[1],
              //           'district': areaAry[2]
              //           // 'memberId': Provider.of<UserinfoProvide>(context).userinfo.id
              //         };
              //         var result = await MemberApi().updateEnterpriseInfo(params);

              //         G.closeLoading();
                      
              //         if (result.data['code'] == 200) {
              //           print('test');
              //           if (result.data['isPopup']) {
              //             showDialog(
              //               context: context,
              //               builder: (ctx) {
              //                 return CupertinoAlertDialog(
              //                   title: Text('资质审核已通过'),
              //                   // content:Text('我是content'),
              //                   actions:<Widget>[
                                  
              //                     CupertinoDialogAction(
              //                       child: Text('取消', style: TextStyle(color: hex('#85868A')),),
              //                       onPressed: (){
              //                         Navigator.of(context).pop();
              //                       },
              //                     ),
                              
              //                     CupertinoDialogAction(
              //                       child: Text('确定'),
              //                       onPressed: (){
              //                         Navigator.of(context).pop();
              //                         G.navigateTo(context, '/index');
              //                       },
              //                     )
              //                   ]
              //                 );
              //               },
              //             );
              //           } else {
              //             G.navigateTo(context, '/resultPage?status=1');
              //           }
              //         } else {
              //           print('出错');
              //         }
              //         Future.delayed(Duration(seconds: 2), () {
              //           btnCanClick = true;
              //         });
                      
              //       }
              //     },
              //     child: Text('提交审核', style: TextStyle(
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
        jobCodeCtrl.value = TextEditingValue(text: picker.getSelectedValues().first);
        jobCode = picker.getSelectedValues().first;
        jobCodeCtrl.text = jobList[value.first]['name'];
        setState(() {
          formValidate['jobCode'] = true;
        });
        print(jobCodeCtrl.text);
      }
    );
    picker.showModal(context);
  }
}
