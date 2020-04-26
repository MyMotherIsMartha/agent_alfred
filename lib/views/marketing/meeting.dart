import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class MarketMeetingPage extends StatefulWidget {
  final String id;   //web地址
  // final String title;//标题
  MarketMeetingPage(this.id);

  // MarketMeetingPage(
  //     {this.id,
  //     this.title="详情",});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<MarketMeetingPage> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    print("web url == ${widget.id}");

    flutterWebviewPlugin.close();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {});
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {

    });
    _onHttpError = flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }


  @override
  void dispose() {
    _onStateChanged.cancel();
    _onUrlChanged.cancel();
    _onHttpError.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('webview'),
      ),
      body: WebviewScaffold(
        url: 'https://www.baidu.com',
        withZoom: false,
        hidden: true,
        initialChild: Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        ignoreSSLErrors: true,
      ),
    );
  }
}