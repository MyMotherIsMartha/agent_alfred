import 'package:agent37_flutter/api/login.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  // AnimationController _logoController;
  // Tween _scaleTween;
  // CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
    // _scaleTween = Tween(begin: 0, end: 1);
    // _logoController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 500))
    //       ..drive(_scaleTween);
    // Future.delayed(Duration(milliseconds: 500), () {
    //   _logoController.forward();
    // });
    // _logoAnimation =
    //     CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);

    // _logoController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     Future.delayed(Duration(milliseconds: 2000), () {
    //       goPage();
    //     });
    //   }
    // });
    Future.delayed(Duration(milliseconds: 2000), () {
      goPage();
    });
  }

  void goPage() async {
    await G.initSp();
    String token = G.getPref('token');
    if (Validate.isNon(token)) {
      G.router.navigateTo(context, '/login', replace: true);
    } else {
      Provider.of<UserProvide>(context).updateUserAuth();
    }
    
    // UserModel userModel = Provider.of<UserModel>(context);
    // userModel.initUser();
    // if (userModel.user != null) {
    //   await NetUtils.refreshLogin(context).then((value){
    //     if(value.data != -1){
    //       G.router.navigateTo(context, '/index');
    //     }
    //   });
    //   Provider.of<PlayListModel>(context).user = userModel.user;
    // } else {
    //   G.router.navigateTo(context, '/login');
    // }
    G.router.navigateTo(context, '/readPerfectInfo', replace: true);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    G.setContext(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: G.setHeight(100)),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset(
              'lib/assets/images/logo.png',
              width: G.setWidth(120),
            ),
            G.spacing(20),
            Image.asset(
              'lib/assets/images/app_name.png',
              width: G.setWidth(177),
            ),
          ],
        ),
        // child: ScaleTransition(
        //   scale: _logoAnimation,
        //   child: Hero(
        //     tag: 'logo',
        //     child: Image.asset('lib/assets/images/logo.png'),
        //   ),
        // ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _logoController.dispose();
  // }
}
