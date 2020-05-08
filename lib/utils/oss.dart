import 'package:agent37_flutter/api/oss.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Oss {
  static selectSource(cb, {Function uploadApi}) {
    showModalBottomSheet(
        context: G.currentContext,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("拍照"),
                onTap: () {
                  uploadPic(ImageSource.camera, cb, uploadApi);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("相册"),
                onTap: () {
                  uploadPic(ImageSource.gallery, cb, uploadApi);
                },
              ),
            ],
          );
        });
  }

  /*相册*/
  static uploadPic(ImageSource source, Function cb, Function uploadApi) async {
    Navigator.pop(G.currentContext);
    // TODO:: LOADING弹窗
    G.showLoading(G.currentContext);
    var image = await ImagePicker.pickImage(source: source);
    if (image == null) return;
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename: name + '.' + suffix)
    });
    var resultInfo = uploadApi == null ? await OssApi().uploadFile(data) : await uploadApi(data);
    G.closeLoading();
    if (resultInfo.data['code'] == 200) {
      Map uploadData = resultInfo.data['data'];
      cb(uploadData['filePath']);
      return uploadData['filePath'];
    }
  }
}
