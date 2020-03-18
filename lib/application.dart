import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Application{
  static Router router;

  static setWidth (double width) {
    return ScreenUtil().setWidth(width);
  }

  static setHeight (double height) {
    return ScreenUtil().setHeight(height);
  }

  static setSp (double fontsize) {
    return ScreenUtil().setSp(fontsize);
  }
}