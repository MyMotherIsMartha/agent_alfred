import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class PackageInfoProvide with ChangeNotifier{
  PackageInfo packageInfo;

  initInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo.appName);
    print(packageInfo.version);
    print(packageInfo);
    print('packageInfopackageInfopackageInfopackageInfo');
    notifyListeners();
  }
}