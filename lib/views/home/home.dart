import 'dart:wasm';

import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/components/v-underline_indicator.dart';
import 'package:agent37_flutter/models/userinfo.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import './components/shareWindow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  EasyRefreshController  _refreshController = EasyRefreshController();
  // 获取用户信息
  Future _getUserinfo(context) async {
    await Provider.of<UserProvide>(context).getUserInfo();
    return 'feture end';
  }



  // 头部按钮
  Widget _head() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.dark,
          actionsIconTheme: IconThemeData(color: hex('#FFF')),
          actions: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: G.setWidth(15)),
                child: iconsetting(size: G.setSp(48)),
              ),
              onTap: () {},
            ),
            InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: G.setWidth(15)),
                  child: iconmsg(size: G.setSp(48)),
                ),
                onTap: () {}),
          ],
        ));
  }

  // 用户信息
  Widget _userInfo(UserinfoModel userinfo) {
    return Container(
      height: G.setHeight(120),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(50)),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: G.setWidth(60),
            backgroundImage: AssetImage('${G.imgBaseUrl}logo.png'),
          ),
          Container(width: G.setWidth(20)),
          Column(
            mainAxisAlignment: Validate.isNon(userinfo.parentShareCode)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(userinfo.nickname ?? '未知',
                      style:
                          TextStyle(fontSize: G.setSp(30), color: hex('#FFF'))),
                  Container(width: G.setWidth(10)),
                  Image.asset(
                    '${G.imgBaseUrl}home/check-status_icon.png',
                    width: G.setWidth(140),
                    height: G.setHeight(50),
                  ),
                ],
              ),
              Validate.isNon(userinfo.parentShareCode)
                  ? Container()
                  : Row(
                      children: <Widget>[
                        Text('邀请码：$userinfo.parentShareCode',
                            style: TextStyle(
                                fontSize: G.setSp(30), color: hex('#FFF'))),
                        Container(
                          margin: EdgeInsets.only(left: G.setWidth(10)),
                          padding: EdgeInsets.fromLTRB(G.setWidth(18),
                              G.setHeight(5), G.setWidth(18), G.setHeight(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: hex('#FFF'))),
                          child: InkWell(
                            onTap: () {
                              G.setClipboard('1234143');
                            },
                            child: Text(
                              '复制',
                              style: TextStyle(
                                  fontSize: G.setSp(22), color: hex('#FFF')),
                            ),
                          ),
                        )
                      ],
                    )
            ],
          ),
        ],
      ),
    );
  }

  void openShare() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                // leading: new Icon(Icons.photo_library),
                title: Center(
                  child: Text('会员推荐分享'),
                ),
                onTap: () {
                  // _openGallery();
                  Navigator.pop(context);
                  openShareWindow(context, 'member');
                },
              ),
              new ListTile(
                // leading: new Icon(Icons.photo_library),
                title: Center(
                  child: Text('代理推荐分享'),
                ),
                onTap: () {
                  // _openGallery();
                  Navigator.pop(context);
                  openShareWindow(context, 'agent');
                },
              ),
              new ListTile(
                // leading: new Icon(Icons.photo_library),
                title: Center(
                  child: Text('取消'),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }

  // 任务子项
  Widget _missionItem(String title, int val) {
    return InkWell(
        onTap: () {},
        child: Container(
          width: G.setWidth(325),
          height: G.setHeight(210),
          padding: EdgeInsets.symmetric(
              vertical: G.setHeight(38), horizontal: G.setWidth(30)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('${G.imgBaseUrl}home/subordinate_bg.png'),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      fontSize: G.setSp(30),
                      color: hex('#333'),
                      fontWeight: FontWeight.w500)),
              Container(
                height: G.setHeight(15),
                decoration: BoxDecoration(
                    border: Border.all(color: hex('#6982FF')),
                    borderRadius: BorderRadius.circular(7.5)),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(hex('#6982FF')),
                  value: val / 10,
                ),
              ),
              Text('$val/10',
                  style:
                      TextStyle(fontSize: G.setSp(30), color: hex('#424242')))
            ],
          ),
        ));
  }

  // 资格任务
  Widget _mission() {
    return Container(
      margin: EdgeInsets.only(top: G.setHeight(60), bottom: G.setHeight(20)),
      width: G.setWidth(710),
      height: G.setHeight(380),
      padding: EdgeInsets.symmetric(
          horizontal: G.setWidth(10), vertical: G.setHeight(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: hex('#FFF')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: G.setHeight(80),
                // color: hex('ff0'),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('资格任务',
                        style: TextStyle(
                            fontSize: G.setSp(30), color: hex('#424242'))),
                    Text('距结束：23天5小时23分',
                        style: TextStyle(
                            fontSize: G.setSp(24), color: hex('#686868'))),
                  ],
                ),
              ),
              InkWell(
                onTap: openShare,
                child: Container(
                  height: G.setHeight(80),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('查看细则',
                            style: TextStyle(
                                fontSize: G.setSp(24), color: hex('#0091F0'))),
                        SizedBox(width: G.setWidth(10)),
                        iconarrow(color: hex('#0091F0'), size: G.setSp(24))
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
          G.spacing(25),
          Container(
            // width: G.setWidth(690),
            // height: G.setWidth(230),
            // alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Container(
                  height: G.setHeight(230),
                  width: G.setWidth(690),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _missionItem('开通钻石会员', 3),
                      _missionItem('钻石会员有效订单', 7)
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    width: G.setWidth(690),
                    height: G.setHeight(230),
                    child: Opacity(
                      opacity: 0.6,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: hex('#333'),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: G.setWidth(200),
                              height: G.setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: hex('#fff')),
                                borderRadius:
                                    BorderRadius.circular(G.setWidth(50)),
                              ),
                              child: Text('申请延时',
                                  style: TextStyle(
                                      color: hex('#FFF'),
                                      fontSize: G.setSp(28))),
                            ),
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  // 数据统计
  Widget _statistics() {
    return Container(
        decoration: BoxDecoration(
            color: hex('#FFF'),
            // color: hex('#FFF'),
            borderRadius: BorderRadius.circular(10)),
        // child: Column(
        //   children: <Widget>[]
        child: Column(
          children: <Widget>[
            Container(
                height: G.setHeight(94),
                width: G.setWidth(710),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: hex('#E6E6E6')))),
                child: TabBar(
                  indicator: VUnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: G.setHeight(6), color: hex('#6982FF'))),
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                        icon: Text('今日',
                            style: TextStyle(
                                fontSize: G.setSp(30),
                                color: hex('#262626'),
                                fontWeight: FontWeight.w500))),
                    Tab(
                        icon: Text('本月',
                            style: TextStyle(
                                fontSize: G.setSp(30),
                                color: hex('#262626'),
                                fontWeight: FontWeight.w500))),
                    Tab(
                        icon: Text('上月',
                            style: TextStyle(
                                fontSize: G.setSp(30),
                                color: hex('#262626'),
                                fontWeight: FontWeight.w500))),
                  ],
                )),
                Container(
                  height: G.setHeight(400),
                  width: G.setWidth(710),
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Text('1'),
                      Text('2'),
                      Text('3'),
                    ],
                  ),
                )
          ],
        ));
  }

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: EasyRefresh(
        controller: _refreshController,
        enableControlFinishRefresh: true,
        header: ClassicalHeader( // TODO:: 组件化
          refreshText: '下拉刷新',
          refreshReadyText: '释放以刷新',
          refreshingText: '刷新中……',
          refreshedText: '刷新完成',
          infoText: '更新于 %T'
        ),
        onRefresh: () async {
          await Provider.of<UserProvide>(context).refreshUserinfo();
          _refreshController.finishRefresh(success: true);
          print('1234');
      // ....
      },
      child:SingleChildScrollView(
        child: FutureBuilder(
          future: _getUserinfo(context),
          builder: (context, shapshot) {
            UserinfoModel userinfo = Provider.of<UserProvide>(context).userinfo;
            if (shapshot.hasData && userinfo != null) {
              return Container(
                height: G.setHeight(1334),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image:
                            AssetImage('${G.imgBaseUrl}home/home-banner_1.png'),
                        fit: BoxFit.fitWidth)),
                child: Column(
                  children: <Widget>[
                    _head(),
                    _userInfo(userinfo),
                    _mission(),
                    _statistics()
                  ],
                ),
              );
            } else {
              return Container(
                  height: G.setHeight(1334),
                  width: double.infinity,
                  child: VLoading());
            }
          },
        ),
      )),
    );
  }
}
