import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CustomerServicePage extends StatefulWidget {
  final String shareCode;
  final String nickname;
  final String mobile;

  CustomerServicePage({this.shareCode, this.nickname, this.mobile});

  @override
  _WebViewState createState() => _WebViewState();
}




class _WebViewState extends State<CustomerServicePage> {
  WebViewController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String url;
  String title;
  String thumb;

  @override
  void initState() {
    super.initState();
    var nickname = FluroConvertUtils.fluroCnParamsDecode(widget.nickname).toString();
    var shareCode = widget.shareCode;
    var mobile = widget.mobile;
    print(nickname);
    print(widget.shareCode);
    print(widget.mobile);
    url = 'https://chat.sobot.com/chat/h5/v2/index.html?sysnum=0d4cde44b19a41e38b81e7f33457721c&partnerid=' + shareCode + '&tel=' + mobile;
    // url = 'https://chat.sobot.com/chat/h5/v2/index.html?sysnum=0d4cde44b19a41e38b81e7f33457721c&partnerid=$shareCode&uname=$nickname&tel=$mobile';
    print(url);
  }

  @override
  void dispose() {
    super.dispose();
  }

  setToken() async {
    String token = await G.getPref('token');
    _controller.evaluateJavascript(
        'window.sessionStorage.setItem("token", "$token");');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('在线客服'),
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
            // onPageFinished: (url) {
            //   setToken();
            // },
          ),
        ));
  }
}
