import 'package:agent37_flutter/provide/currentIndex.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Router router = Router();
  Routes.configureRoutes(router);
  G.router = router;
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
      theme: ThemeData(primaryColor: Colors.white),
      home: SplashPage(),
      navigatorKey: G.key,
    );
  }
}
