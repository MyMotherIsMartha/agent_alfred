import 'package:agent37_flutter/api/oss.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
    bool flag;
    // print(await Permission.photos.request().isGranted);
    // var pre;
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
      // flag = statuses[Permission.storage] == PermissionStatus.granted;
      // pre = await Permission.photos.status;
    }
    Navigator.pop(G.currentContext);
    if (!flag) {
      G.toast('请在设置中打开权限');
      return;
    }
    //  LOADING弹窗
    G.showLoading(G.currentContext);
    var image = await ImagePicker.pickImage(source: source);
    if (image == null) {
      G.closeLoading();
      return;
    }
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
