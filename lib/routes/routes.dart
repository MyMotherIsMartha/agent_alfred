import 'package:agent37_flutter/views/login/login.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String index = '/index';
  static String loginPage = '/login';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
      return LoginPage();
    });
    router.define(root, handler: splashHandler);
    router.define(index, handler: indexHandler);
    router.define(loginPage, handler: loginHandler);
  }
}
