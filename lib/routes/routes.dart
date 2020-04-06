import 'package:agent37_flutter/views/login/login.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String index = '/index';
  static String loginPage = '/login';
  static String registerPage = '/register';
  static String forgetPage = '/forget';
  static String updateUserPage = '/update-user';
  static String createAccountPage = '/create-account';
  static String addressPage = '/address';
  static String createOrderPage = '/create-order';
  static String uploadEnterPrisePic = '/uploadEnterPrisePic';
  static String uploadLicenseForm = '/uploadLicenseForm';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
      return LoginPage();
    });
    router.define(root, handler: splashHandler);
    router.define(index, handler: indexHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(registerPage, handler: registerHandler);
    router.define(forgetPage, handler: forgetHandler);
    router.define(updateUserPage, handler: updateUserHandler);
    router.define(createAccountPage, handler: createAccountHandler);
    router.define(addressPage, handler: addressHandler);
    router.define(createOrderPage, handler: createOrderHandler);
    router.define(uploadEnterPrisePic, handler: uploadEnterPrisePicHandler);
    router.define(uploadLicenseForm, handler: uploadLicenseFormHandler);
  }
}
