import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// 初始化dio
Dio service() {
  BaseOptions _baseOptions =
      BaseOptions(
        baseUrl: EnvConfig.dev['api'],
        headers: {'platform': 'agent_app'}
      );

  Dio dio = Dio(_baseOptions);

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    String token = G.getPref('token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = token;
    }
    return options;
  }, onResponse: (Response response) async {
    if (response.data['code'] == 401) {
      G.clearPref();
      G.toast('请重新登录');
      BuildContext context = G.currentContext;
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
      G.router.navigateTo(context, '/login', replace: true);
      return;
    }
    if (response.data['code'] != 200) {
      G.toast(response.data['message'] ?? '接口错误');
    }
    return response.data;
    // String dataStr = json.encode(response.data);
    // Map<String, dynamic> dataMap = json.decode(dataStr);

    // return response.data;
  }, onError: (DioError e) async {
    G.toast(e.message);
    throw Exception('接口异常');
    // 当请求失败时做一些预处理
    // return e; //continue
  }));
  // dio.interceptors.add(
  //   LogInterceptor(requestBody: true, responseBody: true),
  // );
  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //     (client) {
  //   // config the http client
  //   client.findProxy = (uri) {
  //     //proxy all request to localhost:8888
  //     return "PROXY 192.168.10.44:8888";
  //   };
  //   // you can also create a HttpClient to dio
  //   // return HttpClient();
  // };

  return dio;
}
// import 'package:agent37_flutter/utils/global.dart';
// import 'package:agent37_flutter/views/login/login.dart';
// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// // import 'package:flutter_points/pages/login.dart';
// // import 'package:flutter_points/utils/global.dart';
// // 初始化dio
// Dio request() {
//   BaseOptions _baseOptions =
//       BaseOptions(
//         baseUrl: "http://api-uat-37agent.woouo.com/",
//         headers: {'platform': 'agent_h5'}
//       );

//   Dio dio = Dio(_baseOptions);

//   dio.interceptors
//       .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
//     String token = G.getPref('token');
//     if (token != null && token.isNotEmpty) {
//       options.headers['Authorization'] = token;
//     } else {
//       options.headers['Authorization'] = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJBdXRob3JpemF0aW9uIjoiIiwibmJmIjoxNTg0OTU4MTI2LCJpc3MiOiIzN2R1bGlnb3UiLCJtb2JpbGUiOiIxODg5MjY2MzAyNSIsImV4cCI6MTU4NTU2MjkyNiwiaWF0IjoxNTg0OTU4MTI2LCJ1c2VySWQiOjEyMDQ1ODkwNDYxNjM5MDI0NjYsInVzZXJuYW1lIjoiMTg4OTI2NjMwMjUifQ.I6ZCYQTWoWTYBLM8wohiE10WeigOmqLGm4PXLhWunmQ';
//     }
//     return options;
//   }, onResponse: (Response response) async {
//     if (response.data['code'] == 401) {
//       G.toast(response.data['message'] ?? '请重新登录');
//       G.clearPref();
//       BuildContext context = G.currentContext;
//       return Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
//     }
//     if (response.data['code'] != 200) {
//       G.toast(response.data['message'] ?? '接口错误');
//     }
//     return response.data;
//   }, onError: (DioError e) async {
//     G.toast(e.message);
//     print(e);
//     // 当请求失败时做一些预处理
//     return e; //continue
//   }));

//   // dio.interceptors.add(
//   //   LogInterceptor(responseBody: true),
//   // );
//   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//       (client) {
//     // config the http client
//     client.findProxy = (uri) {
//       //proxy all request to localhost:8888
//       return "PROXY localhost:8888";
//     };
//     // you can also create a HttpClient to dio
//     // return HttpClient();
//   };

//   return dio;
// }
