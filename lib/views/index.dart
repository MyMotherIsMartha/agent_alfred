import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/dashboard/dashboard.dart';
import 'package:agent37_flutter/views/home/home.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Image.asset('lib/assets/images/pic-icon/user.png', width: G.setWidth(44)), 
      title: Container(
        margin: EdgeInsets.only(top: G.setHeight(8)),
        child: Text('我的管家'),
      ),
      activeIcon: Image.asset('lib/assets/images/pic-icon/user_active.png', width: G.setWidth(44))
    ),
    BottomNavigationBarItem(
      icon: Image.asset('lib/assets/images/pic-icon/dashboard.png', width: G.setWidth(44)), 
      title: Container(
        margin: EdgeInsets.only(top: G.setHeight(8)),
        child: Text('分销管理'),
      ),
      activeIcon: Image.asset('lib/assets/images/pic-icon/dashboard_active.png', width: G.setWidth(44))
    ),
  ];
  final List<Widget> tabBodies = [HomePage(), DashboardPage()];
  int curIndex = 0;
  // tabBodies
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: curIndex,
        children: tabBodies
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            primaryColor: Colors.black87,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: BottomNavigationBar(
          selectedFontSize: G.setSp(20),
          unselectedFontSize: G.setSp(20),
          currentIndex: curIndex,
          type: BottomNavigationBarType.fixed,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              curIndex = index;
            });
          },
        ),
      ),
    );
  }
}