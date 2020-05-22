import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
 
class WebPage extends StatelessWidget {
  final String url;
  final String title;
  WebPage(this.url, {this.title});

  @override
  Widget build(BuildContext context) {
    Map obj = FluroConvertUtils.string2map(url);
    String titleCn;
    switch (title) {
      case 'userAgreement':
        titleCn = '代理协议';
        break;
      case 'privacyAgreement':
        titleCn = '隐私协议';
        break;
      default:
    }
    print(titleCn);
    print(title);
    print('标题去哪里了');
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      "关于我们",
      style: new TextStyle(color: Colors.white),
    ));
    titleContent.add(new Container(width: 50.0));
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return new WebviewScaffold(
      url: obj['url'], // url
      // 登录的URL
      appBar: AppBar(
        title: Text(titleCn??'网页详情'),
        centerTitle: true,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: titleContent,
        // ),
        // iconTheme: new IconThemeData(color: Colors.white),
      ),
      withZoom: false,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}