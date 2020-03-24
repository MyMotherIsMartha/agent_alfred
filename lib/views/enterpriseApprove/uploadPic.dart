import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';

class UploadEnterprisePic extends StatefulWidget {
  UploadEnterprisePic({Key key}) : super(key: key);

  @override
  _UploadEnterprisePicState createState() => _UploadEnterprisePicState();
}

class _UploadEnterprisePicState extends State<UploadEnterprisePic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("企业认证"),
        centerTitle: true
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              height: 400,
              color: Colors.red,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('请拍摄或上传清晰完整的营业执照图片，否则影响审核结果', style: TextStyle(
                  color: hex('#666'),
                  fontSize: 16.0
                )
              ),
            )
          ],
        )
      ),
    );
  }
}