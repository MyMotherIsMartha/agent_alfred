import 'package:agent37_flutter/api/oss.dart';
import 'package:agent37_flutter/utils/oss.dart';
import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/global.dart';

class UploadEnterprisePic extends StatefulWidget {
  final String isFirstUpload;

  UploadEnterprisePic({this.isFirstUpload});

  @override
  _UploadEnterprisePicState createState() => _UploadEnterprisePicState();
}

class _UploadEnterprisePicState extends State<UploadEnterprisePic> {
  static bool haveUpload = false;
  bool goNextPage = false;
  Map uploadData;

  final Widget haveUploadArea = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('点击重新上传营业执照', style: TextStyle(color: hex('#434343'), fontSize: G.setSp(30), fontWeight: FontWeight.w500))
    ],
  );

  final Widget noUploadArea = Column(
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
      ),
      Text('点击上传营业执照', style: TextStyle(
        color: hex('#434343'),
        fontSize: G.setSp(30)
      ))
    ],
  );
  
  @override
  void initState() { 
    super.initState();
    haveUpload = widget.isFirstUpload != 'yes';
  }
  /*拍照*/
  _takePhoto(source) async {
    bool flag;
    if (source == ImageSource.camera) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
      ].request();
      flag = statuses[Permission.camera] == PermissionStatus.granted;
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.photos
      ].request();
      flag = statuses[Permission.storage] == PermissionStatus.granted && statuses[Permission.photos] == PermissionStatus.granted;
      // pre = await Permission.photos.status;
    }
    Navigator.pop(context);
    print(flag);
    // print(pre);
    // print('权限啊权限');
    if (!flag) {
      G.toast('请在设置中打开权限');
      return;
    }
    var image = await ImagePicker.pickImage(source: source);
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
    G.showLoading(context);
    var resultInfo = await OssApi().uploadLicenseCanFail(data);
    G.closeLoading();
    if (resultInfo.data['success'] == true) {
      print('success');
      var licenseInfo = resultInfo.data['data']['licenseInfo'];
      if (licenseInfo == null) {
        uploadData = {
          'businessLicenseUrl': resultInfo.data['data']['businessLicenseUrl']
        };
        goNextPage = false;
        yyAlertDialog(context);
      } else {
        uploadData = licenseInfo;
        uploadData['businessLicenseUrl'] = resultInfo.data['data']['businessLicenseUrl'];
        var uploadJson = FluroConvertUtils.object2string(uploadData);
        setState(() {
          haveUpload = true;
        });
        G.navigateTo(
          context, Routes.uploadLicenseForm + "?uploadJson=$uploadJson");
      }
      
    } else {
      print(resultInfo.data['message']);
    }
    
  }

  YYDialog yyAlertDialog(BuildContext context) {
  return YYDialog().build(context)
    ..width = G.setWidth(500)
    ..height = G.setWidth(215)
    ..borderRadius = G.setWidth(20)
    ..text(
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20), vertical: G.setWidth(40)),
      alignment: Alignment.center,
      text: "未识别出营业执照信息",
      color: hex('#333'),
      fontSize: G.setSp(36),
      fontWeight: FontWeight.w500,
    )
    ..divider()
    ..doubleButton(
      // padding: EdgeInsets.only(top: G.setWidth(25.0), left: G.setWidth(50), right: G.setWidth(500)),
      gravity: Gravity.center,
      withDivider: true,
      text1: "重新上传",
      color1: hex('#85868A'),
      fontSize1: G.setSp(36),
      fontWeight1: FontWeight.w400,
      onTap1: () {
        print("取消");
      },
      text2: "手动输入",
      color2: hex('#0091F0'),
      fontSize2: G.setSp(36),
      fontWeight2: FontWeight.w400,
      onTap2: () {
        goNextPage = true;
      },
    )
    ..show()
    ..dismissCallBack = () {
      if (goNextPage) {
        var uploadJson = FluroConvertUtils.object2string(uploadData);
        print(uploadJson);
        Future.delayed(Duration(microseconds: 100), () {
            G.navigateTo(context, '/uploadLicenseForm?uploadJson=$uploadJson');
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    // G.setContext(context);
    // G.setPref('token', 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJBdXRob3JpemF0aW9uIjoiIiwibmJmIjoxNTg2MzI2MjE0LCJpc3MiOiIzN2R1bGlnb3UiLCJtb2JpbGUiOiIxODg5MjY2MzAyNSIsImV4cCI6MTU4NjkzMTAxNCwiaWF0IjoxNTg2MzI2MjE0LCJ1c2VySWQiOjEyMDQ1ODkwNDYxNjM5MDI0NjYsInVzZXJuYW1lIjoiMTg4OTI2NjMwMjUifQ.FwMvr15n_TU7kmJwKCSGO97gx5qcwtQCFIn0-tEv65c');
    // Provider.of<UserProvide>(context).updateUserAuth();

    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("企业认证"),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                G.removePref('token');
                G.router.navigateTo(context, '/login', replace: true);
              },
              child: Text('退出',
                  style: TextStyle(color: hex('#333333'), fontSize: G.setSp(32))))
        ],
      ),
      body: Container(
        width: G.setWidth(750),
        height: G.setHeight(1206),
        padding: EdgeInsets.only(top: G.setHeight(150)),
        child: Column(
          children: <Widget>[
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
                              _takePhoto(ImageSource.camera);
                            },
                          ),
                          new ListTile(
                            leading: new Icon(Icons.photo_library),
                            title: new Text("相册"),
                            onTap: () {
                              _takePhoto(ImageSource.gallery);
                            },
                          ),
                        ],
                      );
                    }
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/enterprise/uploadLicence.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                // alignment: Alignment.center,
                width: G.setWidth(410),
                height: G.setWidth(592),
                child: haveUpload ? haveUploadArea : noUploadArea,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: G.setHeight(50)),
              child: Text('请拍摄或上传清晰完整的营业执照图片，否则影响审核结果', style: TextStyle(
                  color: hex('#85868A'),
                  fontSize: G.setSp(24)
                )
              ),
            ),
            haveUpload ?
            Container(
              margin: EdgeInsets.only(top: G.setHeight(50)),
              child: InkWell(
                onTap: () {
                  // yyAlertDialog(context);
                  Map uploadData = {
                    'isRequest': true
                  };
                  var uploadJson = FluroConvertUtils.object2string(uploadData);
                  G.navigateTo(context, '/uploadLicenseForm?uploadJson=$uploadJson');
                },
                child: Text('跳过这步 >', style: TextStyle(
                  color: hex('#0091F0'),
                  fontSize: G.setSp(28)
                )),
              )
            ) : Text('')
            // _ImageView(_imgPath)
          ],
        )
      ),
    );
  }
}