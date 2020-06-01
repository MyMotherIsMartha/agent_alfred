import 'dart:async';
import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-avatar.dart';
import 'package:agent37_flutter/components/v-loading.dart';
import 'package:agent37_flutter/components/v-net-error.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/components/v-underline_indicator.dart';
import 'package:agent37_flutter/models/home-info.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/resttime.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:badges/badges.dart';
import 'package:color_dart/color_dart.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import './components/shareWindow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  EasyRefreshController _refreshController = EasyRefreshController();
  HomeInfoModel homeinfo;
  var messageCountInfo;
  String nickname;
  var nicknameForUrl;
  String shareCode;
  String mobile;
  var msgFuture;
  var homeFuture;
  bool showCheck = true;
  bool goInfo = false;
  Timer _timer;
  String _countdownTime = '';
  bool isSpecialAccount;

  checkInfo(BuildContext context) {
    if (Provider.of<UserProvide>(context).userAuthInfo.prefectStatus != -1) {
      return;
    }
    return YYDialog().build(context)
      ..width = G.setWidth(440)
      ..borderRadius = G.setWidth(20)
      ..text(
        padding: EdgeInsets.all(G.setWidth(60)),
        alignment: Alignment.center,
        text: "尚未完善企业信息",
        color: hex('#333'),
        fontSize: G.setSp(36),
        fontWeight: FontWeight.w500,
      )
      ..divider()
      ..doubleButton(
        padding: EdgeInsets.only(top: 10.0),
        gravity: Gravity.center,
        withDivider: true,
        text1: "取消",
        color1: hex('#85868A'),
        fontSize1: G.setSp(36),
        onTap1: () {
          print("取消");
        },
        text2: "去完善",
        color2: hex('##0091F0'),
        fontSize2: G.setSp(36),
        onTap2: () {
          print("去完善");
          goInfo = true;
        },
      )
      ..dismissCallBack = () {
        if (goInfo) {
          goInfo = false;
          Future.delayed(Duration(microseconds: 100), () {
            G.navigateTo(context, '/perfectEnterprise1');
          });
        }
      }
      ..show();
  }

  Future _getHomeinfo() async {
    try {
      var result = await MemberApi().getHomeInfo();
      var result2;
      if (result.data['data'] != null) {
        result2 = await MemberApi().getMessageCount();
      }
      if (result.data['data'] != null) {
        setState(() {
          homeinfo = homeInfoModelFromJson(result.data['data']);
          print('homeinfo');
          print(result.data['data']);
        });
        countDown();
      }
      if (result2.data['data'] != null) {
        messageCountInfo = result2.data['data'];
        print('messageCountInfo');
        print(messageCountInfo);
      }
      nickname = Provider.of<UserProvide>(context).userAuthInfo.nickname;
      nicknameForUrl = FluroConvertUtils.fluroCnParamsEncode(Provider.of<UserProvide>(context).userAuthInfo.nickname.toString());
      shareCode = Provider.of<UserProvide>(context).userAuthInfo.shareCode;
      mobile = Provider.of<UserProvide>(context).userAuthInfo.mobile;
      return 'future end';
    } catch (e) {
      return 'future error';
    }
  }

  Future _getMsgCount() async {
    var result = await MemberApi().getMessageCount();
    return result.data['data'];
  }

  // 头部按钮
  Widget _head() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
        child: AppBar(
          leading: Container(),
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
              onTap: () {
                G.navigateTo(context, '/setting');
              },
            ),
            InkWell(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: G.setWidth(15)),
                    child: FutureBuilder(
                      future: homeFuture,
                      builder: (context, shapshot) {
                        if (shapshot.hasData) {
                          return messageCountInfo > 0
                              ? Badge(
                                  badgeContent: Text(messageCountInfo.toString(),
                                      style: TextStyle(
                                          fontSize: G.setWidth(18),
                                          color: hex('#fff'))),
                                  child: iconmsg(size: G.setSp(48)),
                                  position: BadgePosition.topRight(
                                      top: G.setWidth(16),
                                      right: G.setWidth(-14)),
                                )
                              : iconmsg(size: G.setSp(48));
                          // ;
                        } else {
                          return Container();
                        }
                      },
                    )),
                onTap: () {
                  G.navigateTo(context, '/messageCenter');
                }),
          ],
        ));
  }

  // 用户信息
  Widget _userInfo() {
    return Container(
      height: G.setWidth(120),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(50)),
      margin: EdgeInsets.only(bottom: G.setWidth(40)),
      child: Row(
        children: <Widget>[
          VAvatar(
            null,
            homeinfo.role,
            width: 120,
          ),
          // CircleAvatar(
          //   radius: G.setWidth(60),
          //   backgroundImage: AssetImage('${G.imgBaseUrl}logo.png'),
          // ),
          Container(width: G.setWidth(20)),
          Column(
            mainAxisAlignment: Validate.isNon(homeinfo.shareCode)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    // width: G.setWidth(360),
                    constraints: BoxConstraints(
                      maxWidth: G.setWidth(360),
                    ),
                    child: Text(homeinfo.nickname ?? '未知',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: G.setSp(30), color: hex('#FFF'))),
                  ),
                  Container(width: G.setWidth(10)),
                  isSpecialAccount ? Container() :
                  Image.asset(
                    homeinfo.role == 0
                        ? '${G.imgBaseUrl}home/check-status_icon.png'
                        : '${G.imgBaseUrl}home/agent_status_icon.png',
                    width: G.setWidth(140),
                    height: G.setWidth(50),
                  ),
                ],
              ),
              Validate.isNon(homeinfo.shareCode)
                  ? Container()
                  : Row(
                      children: <Widget>[
                        Text('邀请码：${homeinfo.shareCode}',
                            style: TextStyle(
                                fontSize: G.setSp(30), color: hex('#FFF'))),
                        Container(
                          margin: EdgeInsets.only(left: G.setWidth(10)),
                          padding: EdgeInsets.fromLTRB(G.setWidth(18),
                              G.setWidth(5), G.setWidth(18), G.setWidth(5)),
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
        builder: (BuildContext context) {
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
                  openShareWindow(context, 'member', homeinfo.role);
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
                  openShareWindow(context, 'agent', homeinfo.role);
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
        });
  }

  // 任务子项
  Widget _missionItem(String title, int val, int denominator) {
    return InkWell(
        onTap: () {
          // if (homeinfo.checkStatus == 1) {
          //   return;
          // } else {
          //   G.navigateTo(context, '/fine-point');
          // }
        },
        child: Container(
          width: G.setWidth(325),
          height: G.setWidth(210),
          padding: EdgeInsets.symmetric(
              vertical: G.setWidth(38), horizontal: G.setWidth(30)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: title == '开通企业会员'
                      ? AssetImage('${G.imgBaseUrl}home/subordinate_bg.png')
                      : AssetImage('${G.imgBaseUrl}home/order-num_bg.png'),
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
                height: G.setWidth(15),
                decoration: BoxDecoration(
                    border: Border.all(color: hex('#6982FF')),
                    borderRadius: BorderRadius.circular(7.5)),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(hex('#6982FF')),
                  value: val / denominator,
                ),
              ),
              Text('$val/$denominator',
                  style:
                      TextStyle(fontSize: G.setSp(30), color: hex('#424242')))
            ],
          ),
        ));
  }

  countDown() {
    setState(() {
      _countdownTime = restTime(homeinfo.checkEndTime);
    });
    _timer = Timer.periodic(Duration(seconds: 30), (timer) async {
      setState(() {
        _countdownTime = restTime(homeinfo.checkEndTime);
      });
    });
  }

  // 资格任务
  Widget _mission() {
    return homeinfo.checkStatus == 1 // 2
        ? Container()
        : Container(
            margin: EdgeInsets.only(bottom: G.setWidth(20)),
            width: G.setWidth(710),
            height: G.setWidth(380),
            padding: EdgeInsets.symmetric(
                horizontal: G.setWidth(20), vertical: G.setWidth(15)),
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
                      height: G.setWidth(80),
                      // color: hex('ff0'),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('资格任务',
                              style: TextStyle(
                                  fontSize: G.setSp(30),
                                  color: hex('#424242'))),
                          isSpecialAccount ? 
                          Container() :        
                          Row(
                            children: <Widget>[
                              Text(
                                  homeinfo.checkStatus == 1
                                      ? '考核时间已过期，未完成考核无法获得服务费'
                                      // : '距结束：${restTime(homeinfo.checkEndTime)}',
                                      : '距服务费减少：$_countdownTime',
                                  style: TextStyle(
                                      fontSize: G.setSp(24),
                                      color: hex('#686868'))),
                              G.spacing(10, dir: 'x'),
                              InkWell(
                                onTap: () {
                                  statisticsDialog(
                                      context, '服务费减少说明', '倒计时结束后，前3个会员开通的居间服务费会减半哦！');
                                },
                                child: Image.asset(
                                  '${G.imgBaseUrl}pic-icon/info_icon.png',
                                  width: G.setWidth(36),
                                  height: G.setWidth(36),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    isSpecialAccount ? 
                    Container() : 
                    Container(
                        height: G.setWidth(80),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            G.navigateTo(context, '/fine-point');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('查看细则',
                                  style: TextStyle(
                                      fontSize: G.setSp(24),
                                      color: hex('#0091F0'))),
                              SizedBox(width: G.setWidth(10)),
                              iconarrow(
                                  color: hex('#0091F0'), size: G.setSp(24))
                            ],
                          ),
                        ))
                  ],
                ),
                G.spacing(25),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: G.setWidth(230),
                        width: G.setWidth(690),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _missionItem(
                                '开通企业会员',
                                homeinfo.openedDiamondMemberNum,
                                homeinfo.checkDiamondMemberNum),
                            _missionItem('企业会员有效订单', homeinfo.effectiveOrderNum,
                                homeinfo.checkEffectiveOrderNum)
                          ],
                        ),
                      ),
                      homeinfo.checkStatus == 1
                          ? Positioned(
                              top: 0,
                              left: 0,
                              width: G.setWidth(690),
                              height: G.setWidth(230),
                              child: Opacity(
                                opacity: 0.6,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: hex('#333'),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                      onTap: () {
                                        yyAlertDialog(context);
                                      },
                                      child: Container(
                                        width: G.setWidth(200),
                                        height: G.setWidth(60),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: hex('#fff')),
                                          borderRadius: BorderRadius.circular(
                                              G.setWidth(50)),
                                        ),
                                        child: Text('申请延时',
                                            style: TextStyle(
                                                color: hex('#FFF'),
                                                fontSize: G.setSp(28))),
                                      ),
                                    )),
                              ))
                          : SizedBox()
                    ],
                  ),
                )
              ],
            ),
          );
  }

  // 数据统计tabbar选项栏
  List<Widget> _statisticsTabItem() {
    List<String> types = ['今日', '本月', '上月'];
    return types.map((type) {
      return Tab(
          icon: Text(type,
              style: TextStyle(
                  fontSize: G.setSp(30),
                  color: hex('#262626'),
                  fontWeight: FontWeight.w500)));
    }).toList();
  }

  // 数据统计子项内容
  Widget _statisticsContentItem(String type) {
    List data;
    List title = [
      '预估商品销售分佣',
      '预估会员居间服务费',
      '预估礼包销售分佣',
      '订单数',
      '会员注册数',
      '代理商注册数',
    ];

    List<String> statTitle = [
      '预估商品销售分佣',
      '预估会员居间服务费',
      '预估礼包销售分佣',
    ];

    List<String> desc = [
      '代理商通过服务会员，从而促使会员在37度礼购APP采购，即可获得会员采购总额的2%作为产品销售分佣。',
      '代理商推荐的会员成为企业会员，获得企业会员软件信息技术服务费的60%作为居间服务费奖励。',
      '代理商通过销售产品礼包，获得产品礼包总额的30%作为销售分佣。',
    ];
    switch (type) {
      case 'today':
        data = [
          homeinfo.todayPendingPurchaseServiceFee,
          homeinfo.todayPendingMemberServiceFee,
          homeinfo.todayPendingGiftPackageServiceFee,
          homeinfo.todayIncreasedOrderNum,
          homeinfo.todayIncreasedAppMemberNum,
          homeinfo.todayIncreasedAgentNum,
        ];
        break;
      case 'thisMonth':
        data = [
          homeinfo.thisMonthPendingPurchaseServiceFee,
          homeinfo.thisMonthPendingMemberServiceFee,
          homeinfo.thisMonthPendingGiftPackageServiceFee,
          homeinfo.thisMonthIncreasedOrderNum,
          homeinfo.thisMonthIncreasedAppMemberNum,
          homeinfo.thisMonthIncreasedAgentNum,
        ];
        break;
      case 'lastMonth':
        data = [
          homeinfo.lastMonthPendingPurchaseServiceFee,
          homeinfo.lastMonthPendingMemberServiceFee,
          homeinfo.lastMonthPendingGiftPackageServiceFee,
          homeinfo.lastMonthIncreasedOrderNum,
          homeinfo.lastMonthIncreasedAppMemberNum,
          homeinfo.lastMonthIncreasedAgentNum,
        ];
        break;
      default:
    }
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //横轴三个子widget
                    childAspectRatio: 1.2
                    // childAspectRatio: 237 / 200 //宽高比为1时，子widget
                    ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (index < 3) {
                          G.navigateTo(
                              context,
                              '/finance?type=' +
                                  type +
                                  '&index=' +
                                  index.toString());
                        }
                        if (index == 3) {
                          G.navigateTo(
                              context, '/finance?type=' + type + '&index=0');
                        }
                        if (index == 4) {
                          G.navigateTo(
                              context,
                              '/vipManage?type=' +
                                  type +
                                  '&index=' +
                                  index.toString());
                        }
                        if (index == 5) {
                          G.navigateTo(context, '/agentManage');
                        }
                      },
                      child: Container(
                          height: G.setWidth(200),
                          width: G.setWidth(237),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: index < 3
                                ? BorderSide(color: hex('#E6E6E6'))
                                : BorderSide.none,
                            right: (index + 1) % 3 != 0
                                ? BorderSide(color: hex('#E6E6E6'))
                                : BorderSide.none,
                          )),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  index < 3 ? G.spacing(18) : Container(),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: index < 3 ? "￥" : '',
                                          style: TextStyle(
                                              color: hex('#333'),
                                              fontSize: G.setSp(24))),
                                      TextSpan(
                                          text: index < 3 ? data[index].toStringAsFixed(2) : data[index].toString(),
                                          style: TextStyle(
                                              color: hex('#333'),
                                              fontSize: G.setSp(36))),
                                    ])),
                                  ),
                                  G.spacing(15),
                                  Text(title[index],
                                      style: TextStyle(
                                          fontSize: G.setSp(24),
                                          color: hex('#999')))
                                ],
                              ),
                              index < 3
                                  ? Positioned(
                                      top: G.setWidth(14),
                                      right: G.setWidth(10),
                                      child: InkWell(
                                        onTap: () {
                                          statisticsDialog(context,
                                              statTitle[index], desc[index]);
                                        },
                                        child: Image.asset(
                                          '${G.imgBaseUrl}pic-icon/info_icon.png',
                                          width: G.setWidth(36),
                                          height: G.setWidth(36),
                                        ),
                                      )
                                      // ToolTip(
                                      //   desc: desc[index],
                                      //     direction: (index + 1) % 3 == 0
                                      //         ? 'left'
                                      //         : 'down'),
                                      )
                                  : isNew(index)
                                      ? Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            width: G.setWidth(65),
                                            height: G.setWidth(65),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      '${G.imgBaseUrl}pic-icon/new-tri_icon.png')),
                                            ),
                                          ))
                                      : Container()
                            ],
                          )));
                })));
  }

  bool isNew(int index) {
    bool flag;
    switch (index) {
      case 3:
        flag = homeinfo.newlyIncreasedShowOrderFlag;
        break;
      case 4:
        flag = homeinfo.newlyIncreasedShowMemberFlag;
        break;
      case 5:
        flag = homeinfo.newlyIncreasedShowAgentFlag;
        break;
      default:
        flag = false;
    }
    return flag;
  }

  // 数据统计
  Widget _statistics() {
    return Container(
        height: G.setWidth(500),
        decoration: BoxDecoration(
            color: hex('#FFF'), borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            Container(
                height: G.setWidth(94),
                width: G.setWidth(710),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: hex('#E6E6E6')))),
                child: TabBar(
                    indicator: VUnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: G.setWidth(6), color: hex('#6982FF'))),
                    controller: _tabController,
                    tabs: _statisticsTabItem())),
            Container(
                height: G.setWidth(400),
                width: G.setWidth(710),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    _statisticsContentItem('today'),
                    _statisticsContentItem('thisMonth'),
                    _statisticsContentItem('lastMonth'),
                  ],
                ))
          ],
        ));
  }

  Widget _menu() {
    List<Map> menuList = [];
    if (isSpecialAccount) {
      menuList = [
        {
          'title': '邀请分享',
          'icon': '${G.imgBaseUrl}home/share.png',
          'url': '/',
          'isShare': true
        },
        {
          'title': '会员管理',
          'icon': '${G.imgBaseUrl}home/agent.png',
          'url': '/vipManage'
        },
        {
          'title': '客户服务',
          'icon': '${G.imgBaseUrl}home/contact.png',
          'url': 
              '/customerService?nickname=$nicknameForUrl&shareCode=$shareCode&mobile=$mobile'
        },
      ];
    } else {
      menuList = [
        {
          'title': '财务管理',
          'icon': '${G.imgBaseUrl}home/finance.png',
          'url': '/finance?type=thisMonth&index=0'
        },
        {
          'title': '邀请分享',
          'icon': '${G.imgBaseUrl}home/share.png',
          'url': '/',
          'isShare': true
        },
        {
          'title': '我的钱包',
          'icon': '${G.imgBaseUrl}home/wallet.png',
          'url': '/walletMain'
        },
        {
          'title': '会员管理',
          'icon': '${G.imgBaseUrl}home/agent.png',
          'url': '/vipManage'
        },
        {
          'title': '代理商管理',
          'icon': '${G.imgBaseUrl}home/vip.png',
          'url': '/agentManage'
        },
        {
          'title': '客户服务',
          'icon': '${G.imgBaseUrl}home/contact.png',
          'url': 
              '/customerService?nickname=$nicknameForUrl&shareCode=$shareCode&mobile=$mobile'
        },
      ];
    }
    return Container(
        margin: EdgeInsets.symmetric(vertical: G.setWidth(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(G.setWidth(10)),
            color: hex('#FFF')),
        width: G.setWidth(710),
        height: isSpecialAccount ? G.setWidth(200): G.setWidth(390),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // mainAxisSpacing: G.setWidth(20),
                // crossAxisSpacing: G.setWidth(20),
                crossAxisCount: 3, //横轴三个子widget
                childAspectRatio: isSpecialAccount ? 1 : 1.2 //宽高比为1时，子widget
                ),
            itemCount: isSpecialAccount ? 3:6,
            itemBuilder: (context, index) {
              Map item = menuList[index];
              return InkWell(
                onTap: () {
                  if (item['isShare'] == true) {
                    openShare();
                  } else {
                    G.navigateTo(context, item['url']);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(item['icon'],
                        width: G.setWidth(80), height: G.setWidth(80)),
                    G.spacing(15),
                    Text(item['title'],
                        style: TextStyle(
                            fontSize: G.setSp(28), color: hex('#666')))
                  ],
                ),
              );
            },
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    // msgFuture = _getMsgCount();
    homeFuture = _getHomeinfo();
    Future.delayed(Duration.zero, () {
      checkInfo(context);
    });
    // checkInfo(context);
  }

  @override
  void didChangeDependencies() {
    print('test');
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      // msgFuture = _getMsgCount();
      homeFuture = _getHomeinfo();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    isSpecialAccount = Provider.of<UserProvide>(context).specialAccount;

    return Scaffold(
      body: EasyRefresh(
          controller: _refreshController,
          // enableControlFinishRefresh: true,
          header: vRefreshHeader,
          onRefresh: () async {
            setState(() {
              // msgFuture = _getMsgCount();
              homeFuture = _getHomeinfo();
            });
          },
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: homeFuture,
              builder: (context, shapshot) {
                if (shapshot.data == 'future error') {
                  return Container(
                    height: G.setWidth(1334),
                    width: double.infinity,
                    child: VNetError(() {
                      // msgFuture = _getMsgCount();
                      homeFuture = _getHomeinfo();
                    }));
                }
                if (shapshot.hasData && homeinfo != null) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: homeinfo.checkStatus == 2
                                ? AssetImage(
                                    '${G.imgBaseUrl}home/home-banner_2.png')
                                : AssetImage(
                                    '${G.imgBaseUrl}home/home-banner_1.png'),
                            fit: BoxFit.fitWidth)),
                    child: Column(
                      children: <Widget>[
                        _head(),
                        _userInfo(),
                        _mission(),
                        isSpecialAccount ? 
                        Container() :
                        _statistics(),
                        _menu()
                      ],
                    ),
                  );
                } else {
                  return Container(
                    height: G.setWidth(1334),
                    width: double.infinity,
                    child: VLoading());
                }
              },
            ),
          )),
    );
  }
}

// tooltip 如有需要可封装成组件
class ToolTip extends StatefulWidget {
  final String direction;
  final String desc;
  ToolTip({@required this.direction, @required this.desc});
  @override
  _ToolTipState createState() => _ToolTipState();
}

class _ToolTipState extends State<ToolTip> {
  bool show = false;
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (show == false) {
            setState(() {
              show = !show;
            });
            if (show) {
              _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
                setState(() {
                  show = false;
                });
                _timer?.cancel();
              });
            }
          } else {
            _timer?.cancel();
            setState(() {
              show = false;
            });
          }
        },
        child: SimpleTooltip(
          arrowTipDistance: G.setWidth(10),
          backgroundColor: rgba(0, 0, 0, 0.6),
          ballonPadding: EdgeInsets.all(0),
          borderRadius: G.setWidth(10),
          customShadows: [],
          borderWidth: 0,
          borderColor: Colors.transparent,
          arrowBaseWidth: G.setWidth(20),
          arrowLength: G.setWidth(20),
          animationDuration: Duration(seconds: 0),
          show: show,
          tooltipDirection: widget.direction == 'down'
              ? TooltipDirection.down
              : TooltipDirection.left,
          child: Image.asset(
            '${G.imgBaseUrl}pic-icon/info_icon.png',
            width: G.setWidth(36),
            height: G.setWidth(36),
          ),
          content: Text(widget.desc,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                fontSize: G.setSp(24),
                color: hex('#FFF'),
              )),
        ));
  }
}

YYDialog statisticsDialog(BuildContext context, String title, String desc) {
  return YYDialog().build(context)
    // ..gravity = Gravity()
    ..width = G.setWidth(670)
    ..borderRadius = G.setWidth(10)
    ..barrierColor = hex('#fff').withOpacity(0)
    ..backgroundColor = hex('#333').withOpacity(.8)
    ..widget(Container(
      padding: EdgeInsets.all(G.setWidth(20)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: hex('#FFF'),
                    fontSize: G.setSp(26),
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close, size: 22, color: hex('#FFF')),
              )
            ],
          ),
          G.spacing(10),
          Container(
            child: Text(
              desc,
              style: TextStyle(color: hex('#FFF'), fontSize: G.setSp(24)),
            ),
          )
        ],
      ),
    ))
    ..show();
}

YYDialog yyAlertDialog(BuildContext context) {
  return YYDialog().build(context)
    ..width = G.setWidth(440)
    ..borderRadius = G.setWidth(20)
    ..text(
      padding: EdgeInsets.all(G.setWidth(60)),
      alignment: Alignment.center,
      text: "是否申请延长考核时间？",
      color: hex('#333'),
      fontSize: G.setSp(36),
      fontWeight: FontWeight.w500,
    )
    ..divider()
    ..doubleButton(
      padding: EdgeInsets.only(top: 10.0),
      gravity: Gravity.center,
      withDivider: true,
      text1: "取消",
      color1: hex('#85868A'),
      fontSize1: G.setSp(36),
      onTap1: () {
        print("取消");
      },
      text2: "确定",
      color2: hex('##0091F0'),
      fontSize2: G.setSp(36),
      onTap2: () async {
        var result = await MemberApi().applyCheckDelayAudit();
        print("确定");
        if (result.data['code'] == 200) {
          G.toast('操作成功');
        }
      },
    )
    ..show();
}
