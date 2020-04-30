import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
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
      G.key.currentState.pushNamed('/login');
    } else if (response.data['code'] != 200) {
      G.toast(response.data['message'] ?? '接口错误');
    }
    return response.data;
  }, onError: (DioError e) async {
    G.toast(e.message);
    throw Exception('接口异常');
    // 当请求失败时做一些预处理
    // return e; //continue
  }));
  // dio.interceptors.add(
  //   LogInterceptor(requestBody: true, responseBody: true),
  // );
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    // config the http client
    client.findProxy = (uri) {
      //proxy all request to localhost:8888
      return "PROXY 192.168.10.44:8888";
    };
    // you can also create a HttpClient to dio
    // return HttpClient();
  };

  return dio;
}