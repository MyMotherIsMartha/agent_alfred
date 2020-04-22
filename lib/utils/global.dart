import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:agent37_flutter/components/v-loading.dart';

class G {
  static Router router;
  static GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  static SharedPreferences sp;

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }

  // 获取当前的state
  // static NavigatorState getCurrentState() => key.currentState;

  // 获取当前的context
  // static BuildContext getCurrentContext() => key.currentContext;

  static Future toast(String msg,
          {Color bgColor = Colors.grey, Color color = Colors.white}) =>
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: bgColor,
          textColor: color,
          fontSize: G.setSp(32));

  static setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  static setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  static setSp(double fontsize) {
    return ScreenUtil().setSp(fontsize);
  }

  // 状态栏高度 刘海屏会更高  单位px
  static double statusHeight = ScreenUtil.statusBarHeight;
  // 底部安全区距离，适用于全面屏下面有按键的
  static double bottomHeight = ScreenUtil.bottomBarHeight;

  /// 获取时间戳
  /// 不传值 代表获取当前时间戳
  static int getTime([DateTime time]) {
    if (time == null) {
      return (DateTime.now().millisecondsSinceEpoch / 1000).round();
    } else {
      return (time.millisecondsSinceEpoch / 1000).round();
    }
  }

  static getPref(key) {
    return sp.getString(key);
  }

  static setPref(key, value) {
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

  static Widget spacing(double height, {Color color, String dir = 'y'}) {
    return Container(
      height: dir == 'y' ? G.setHeight(height) : 0,
      width: dir == 'x' ? G.setWidth(height) : 0,
      color: color,
    );
  }

  static Widget spacingWidth(double width, {Color color}) {
    return Container(
      width: G.setWidth(width),
      color: color,
    );
  }

  static Widget horizontalLine(double width, {Color color}) {
    return Container(
      width: G.setWidth(width),
      color: color,
      height: G.setHeight(1),
    );
  }

  static Widget verticalLine(double height, {Color color}) {
    return Container(
      height: G.setWidth(height),
      color: color,
      width: G.setHeight(1),
    );
  }

  static setTextEdit(String val) {
    return TextEditingValue(
        text: val,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: val.length)));
  }

  static String imgBaseUrl = 'lib/assets/images/';

  static setClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    toast('复制成功');
  }

  static showLoading(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: VLoading()
        );
      }
    );
  }

  static closeLoading(context) {
    Navigator.pop(context);
  }

  static formatTime(int unix, {String type = 'time'}) {
    return formatDate(
      DateTime.fromMicrosecondsSinceEpoch(unix * 1000),
      type == 'time'
       ? [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]
       : [yyyy, '-', mm, '-', dd]
    );
    // return formatDate(new Date(item.payTime), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss])
  }
}
