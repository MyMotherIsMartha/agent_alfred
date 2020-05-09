import 'dart:io';

import 'package:agent37_flutter/provide/address.dart';
import 'package:agent37_flutter/provide/currentIndex.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/ServiceLocator.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/splash_page.dart';
import 'package:color_dart/color_dart.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Router router = Router();
  Routes.configureRoutes(router);
  G.router = router;

  setupLocator();
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: CurrentIndexProvide()),
      ChangeNotifierProvider.value(value: UserProvide()),
      ChangeNotifierProvider.value(value: AddressProvide()),
      // Provider.value(value: '0.0.1'),
      // ChangeNotifierProvider.value(
      //   value: currentIndexProvide,
      // ),
    ],
    child: MyApp(),
  ));
}

String _fontFamily() {
  if (Platform.isIOS) {
    return 'PingFangSC-Regular, sans-serif';
  } else if (Platform.isAndroid) {
    return 'Georgia';
  } else {
    return 'Raleway';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '37度管家',
      locale: Locale('zh', 'CH'),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
      ],
      onGenerateRoute: G.router.generator,
      theme: ThemeData(
        platform: TargetPlatform.android,
        pageTransitionsTheme: PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
        // splashColor: Colors.transparent,
        // primaryColor: hex('#6982FF'),
        primaryColor: hex('#fff'),
        fontFamily: _fontFamily(),
        textTheme: TextTheme(
            subtitle1: TextStyle(textBaseline: TextBaseline.alphabetic)
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
