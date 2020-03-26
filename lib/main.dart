import 'dart:io';

import 'package:agent37_flutter/provide/currentIndex.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/splash_page.dart';
import 'package:color_dart/color_dart.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Router router = Router();
  Routes.configureRoutes(router);
  G.router = router;
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,  //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: CurrentIndexProvide()),
      // Provider.value(value: '0.0.1'),
      // ChangeNotifierProvider.value(
      //   value: currentIndexProvide,
      // ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '37度管家',
      onGenerateRoute: G.router.generator,
      theme: ThemeData(
        primaryColor: hex('#6982FF'),
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          subhead: TextStyle(textBaseline: TextBaseline.alphabetic)
          // headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          // title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          // body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: SplashPage(),
      navigatorKey: G.key,
    );
  }
}
