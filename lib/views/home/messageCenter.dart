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
  bool init = true;

  @override
  void initState() {
    super.initState();
    url = EnvConfig.dev()['web-address'] + '#/newsCenter?noHeader=yes';
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
        'window.sessionStorage.setItem("token", "$token");window.refreshMessage($init)');
        setState(() {
          init = false;
        });
  }

  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'goToOtherPage',
        onMessageReceived: (JavascriptMessage message) {
          setState(() {
            print(message.message);
            switch (message.message) {
              case 'home':
                G.navigateTo(context, '/index', replace: true);
                break;
              case 'viplist':
                G.navigateTo(context, '/vipManage', replace: true);
                break;
              case 'wallet':
                G.navigateTo(context, '/walletMain', replace: true);
                break;
              case 'invoice':
                G.navigateTo(context, '/invoiceList', replace: true);
                break;
              default:
                break;
            }
          });
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('消息'),
          leading: GestureDetector(
            onTap: () {
              G.router.pop(context);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(G.setWidth(30), G.setWidth(10), G.setWidth(10), G.setWidth(10)),
              child: Text('返回首页', style: TextStyle(fontSize: G.setSp(28)),)
            ),
          ),
        ),
        body: Container(
          child: WebView(
            initialUrl: url,
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController wvc) {
              _controller = wvc;
            },
            javascriptChannels: <JavascriptChannel>[
              _alertJavascriptChannel(context)
            ].toSet(),
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
