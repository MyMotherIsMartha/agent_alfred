import 'package:agent37_flutter/api/oss.dart';
import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../utils/global.dart';

class UploadEnterprisePic extends StatefulWidget {
  UploadEnterprisePic({Key key}) : super(key: key);

  @override
  _UploadEnterprisePicState createState() => _UploadEnterprisePicState();
}

class _UploadEnterprisePicState extends State<UploadEnterprisePic> {
  static bool haveUpload = false;
  var _imgPath;

  final haveUploadArea = Container(
    child: Text('haveUpload')
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
            image: AssetImage("lib/assets/images/enterprise/camera.png"),
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

   /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text(""),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

  
  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _uploadImage(image);
      setState(() {
        _imgPath = image;
      });
    }
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    if (image != null) {
      _uploadImage(image);
      setState(() {
        _imgPath = image;
      });
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
    var result = await OssApi().uploadEnterpriseLicense(data);
    print(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("企业认证"),
        centerTitle: true
      ),
      body: Container(
        width: G.setWidth(750),
        height: G.setHeight(1206),
        padding: EdgeInsets.only(top: G.setHeight(150)),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => {
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
                )
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
            _ImageView(_imgPath)
          ],
        )
      ),
    );
  }
}