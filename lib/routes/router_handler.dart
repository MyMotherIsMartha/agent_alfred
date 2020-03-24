import 'package:agent37_flutter/views/index.dart';
import 'package:agent37_flutter/views/login/login.dart';
import 'package:agent37_flutter/views/splash_page.dart';
import 'package:agent37_flutter/views/enterpriseApprove/uploadPic.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// splash 页面
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return SplashPage();
    });

Handler indexHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return IndexPage();
  }
);



Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  }
);

Handler uploadEnterPrisePicHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return UploadEnterprisePic();
  }
);