import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class G {
  static Router router;
  static GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  static SharedPreferences sp;

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }

  // 获取当前的state
  static NavigatorState getCurrentState() => key.currentState;

  // 获取当前的context
  static BuildContext getCurrentContext() => key.currentContext;

  static Future toast(String msg,
          {Color bgColor = Colors.grey, Color color = Colors.white}) =>
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: bgColor,
          textColor: color,
          fontSize: G.setSp(18));

  static setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  static setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  static setSp(double fontsize) {
    return ScreenUtil().setSp(fontsize);
  }

  /// 获取时间戳
  /// 不传值 代表获取当前时间戳
  static int getTime([DateTime time]) {
    if (time == null) {
      return (DateTime.now().millisecondsSinceEpoch / 1000).round();
    } else {
      return (time.millisecondsSinceEpoch / 1000).round();
    }
  }

  static String getPref(key) {
    return sp.getString(key);
  }

  static String setPref(key, value) {
    sp.setString(key, value);
    return value;
  }

  static void removePref(key) {
    sp.remove(key);
  }

  static void clearPref() {
    sp.clear();
  }

  static BuildContext currentContext;

  static setContext(BuildContext context) {
    currentContext = context;
  }

  static GetIt getIt = GetIt.instance;

  // static setupLocator() {
  //   getIt.registerSingleton(NavigateService());
  // }
}
