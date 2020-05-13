import 'package:agent37_flutter/api/marketing.dart';
import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MessageCenterPage extends StatefulWidget {

  @override
  _WebViewState createState() => _WebViewState();
}




class _WebViewState extends State<MessageCenterPage> {
  WebViewController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String url;
  String title;
  String thumb;

  @override
  void initState() {
    super.initState();
    url = EnvConfig.dev['web-address'] + '#/newsCenter';
    print(url);
  }

  @override
  void dispose() {
    super.dispose();
  }

  setToken() async {
    String token = await G.getPref('token');
    print(token);
    _controller.evaluateJavascript(
        'window.sessionStorage.setItem("token", "$token");window.refreshMessage()');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          child: WebView(
            initialUrl: url,
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController wvc) {
              _controller = wvc;
            },
            // onPageStarted: (url) {
            //   setToken();
            // },
            onPageFinished: (url) {
              setToken();
            },
          ),
        ));
  }
}
