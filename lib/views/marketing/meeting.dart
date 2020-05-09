import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MarketMeetingPage extends StatefulWidget {
  final String id;
  MarketMeetingPage(this.id);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<MarketMeetingPage> {
  WebViewController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String url;

  @override
  void initState() {
    super.initState();
    url = EnvConfig.dev['web-address'] + '/#/meeting/' + widget.id;
    print(url);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _share(sence) {
    var model = WeChatShareWebPageModel(
      url,
      title: '会议详情',
      thumbnail: WeChatImage.network("http://img.cixi518.com/ljh_logo.jpeg"),
      scene: sence,
    );
    shareToWeChat(model);
  }

  Widget _showItem(String icon, String name, Function fn) {
    return InkWell(
      onTap: () {
        fn();
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              '${G.imgBaseUrl}$icon.png',
              width: G.setWidth(100),
              height: G.setWidth(100),
            ),
            G.spacing(10),
            Text(name,
                style: TextStyle(fontSize: G.setSp(24), color: hex('#333')))
          ],
        ),
      ),
    );
  }

  _showShareMenu(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: hex('#fff'),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(G.setWidth(50)))),
              height: G.setWidth(370),
              child: Column(
                children: <Widget>[
                  G.spacing(50),
                  Container(
                    width: G.setWidth(750),
                    padding: EdgeInsets.symmetric(horizontal: G.setWidth(125)),
                    height: G.setWidth(149),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _showItem('wechat', '微信好友', () {
                          _share(WeChatScene.SESSION);
                        }),
                        _showItem('pyq', '朋友圈', () {
                          _share(WeChatScene.TIMELINE);
                        }),
                        _showItem('share_link', '复制链接', () {
                          String link = "http://192.168.10.44:8080/#/meeting/" +
                              widget.id;
                          G.setClipboard(link);
                          G.router.pop(context);
                        }),
                      ],
                    ),
                  ),
                  G.spacing(40),
                  Container(height: G.setWidth(10), color: hex('#F5F5F5')),
                  InkWell(
                      onTap: () {
                        G.router.pop(context);
                      },
                      child: Container(
                        height: G.setWidth(100),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text('取消',
                            style: TextStyle(
                                fontSize: G.setSp(36),
                                color: hex('#424242'),
                                height: 50 / 36)),
                      ))
                ],
              ));
        });
    // scaffoldKey.currentState.showBottomSheet((context) {
    //   return Container(
    //       decoration: BoxDecoration(
    //           color: hex('#FFF'),
    //           borderRadius:
    //               BorderRadius.vertical(top: Radius.circular(G.setWidth(50)))),
    //       height: 300,
    //       child: Center(
    //         child: Text('PersistentBottomSheet'),
    //       ));
    // });
  }

  setToken() async {
    String token = await G.getPref('token');
    _controller.evaluateJavascript(
        'window.sessionStorage.setItem("token", "$token");window.refreshMeeting(${widget.id})');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                _showShareMenu(context);
              },
            )
          ],
        ),
        body: Container(
          child: WebView(
            initialUrl: url,
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController wvc) {
              _controller = wvc;
            },
            onPageFinished: (url) {
              setToken();
            },
          ),
        ));
  }
}
