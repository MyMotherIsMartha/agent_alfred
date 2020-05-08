import 'package:agent37_flutter/api/marketing.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/models/banner.dart';
import 'package:agent37_flutter/models/market-module.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MarketingPage extends StatefulWidget {
  @override
  _MarketingPageState createState() => _MarketingPageState();
}

class _MarketingPageState extends State<MarketingPage> {
  var moduleFuture;
  var bannerFuture;
  bool showToTopBtn = false;
  double screenHeight;
  List<BannerModel> banner = <BannerModel>[];
  List<ModuleModel> moduleList = <ModuleModel>[];
  ScrollController scrollController = new ScrollController();

  // 搜索栏
  Widget _searchHeader() {
    return InkWell(
        onTap: () {
          G.navigateTo(context, '/market/search');
        },
        child: Container(
            width: double.infinity,
            height: G.setWidth(88),
            padding: EdgeInsets.symmetric(
                horizontal: G.setWidth(30), vertical: G.setWidth(12)),
            alignment: Alignment.center,
            child: Container(
              height: G.setWidth(64),
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
              decoration: BoxDecoration(
                  color: hex('#F3F4F6'),
                  borderRadius: BorderRadius.circular(G.setWidth(32))),
              child: Row(
                children: <Widget>[
                  iconsearch(color: hex('#BFBFBF')),
                  G.spacing(20, dir: 'x'),
                  Text(
                    '搜索',
                    style: TextStyle(fontSize: G.setSp(28), color: hex('#999')),
                  )
                ],
              ),
            )));
  }

  // banner子项
  Widget _bannerItem(BannerModel item) {
    return Container(
      width: double.infinity,
      height: G.setWidth(300),
      child: InkWell(
          onTap: () {
            print(item.jumpType);
          },
          child: Container(
            width: double.infinity,
            height: G.setWidth(300),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(item.bannerImg), fit: BoxFit.fitWidth)),
          )),
    );
  }

  // banner
  Widget _banner() {
    return Container(
      width: double.infinity,
      height: G.setWidth(300),
      color: Colors.black54,
      child: FutureBuilder(
        future: bannerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                return _bannerItem(banner[index]);
              },
              autoplay: banner.length > 1 ? true : false,
              itemCount: banner.length,
              pagination: SwiperPagination(
                  margin: new EdgeInsets.all(5.0),
                  builder: DotSwiperPaginationBuilder(
                      size: G.setWidth(12),
                      activeSize: G.setWidth(14),
                      activeColor: hex('#fff'),
                      color: rgba(255, 255, 255, 0.5))),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future _getBanner() async {
    var result = await MarketingApi().bannerList();
    // print(result);
    List data = result.data['data'];
    List<BannerModel> bannerTemp = <BannerModel>[];
    data.forEach((item) {
      bannerTemp.add(BannerModel.fromJson(item));
    });
    setState(() {
      banner = bannerTemp;
    });
    return 'end';
  }

  // 模块子项
  Widget _moduleItem(ModuleModel item) {
    return InkWell(
        onTap: () {
          int type = item.findIndexModuleItemVos[0].moduleContactType;
          String id = item.findIndexModuleItemVos[0].contactId;
          if (type == 2) {
            G.navigateTo(context, '/market/course?id=' + id);
          }
          if (type == 1) {
            G.navigateTo(context, '/market/meeting?id=' + id);
          }
        },
        child: Container(
          width: G.setWidth(690),
          padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
          margin: EdgeInsets.only(bottom: G.setWidth(50)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: G.setWidth(690),
                height: G.setWidth(300),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: item.findIndexModuleItemVos[0].contactImg,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fill,
                    )),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     image: DecorationImage(
                //         image:
                //             NetworkImage(item.findIndexModuleItemVos[0].contactImg),
                //         fit: BoxFit.fill)),
              ),
              G.spacing(30),
              Container(
                width: G.setWidth(690),
                child: Text(
                  item.findIndexModuleItemVos[0].contactName,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: G.setSp(32),
                      color: hex('#333'),
                      height: 45 / 32),
                ),
              ),
              G.spacing(10),
              !Validate.isNon(item.findIndexModuleItemVos[0].tradeName)
                  ? Text('#' + item.findIndexModuleItemVos[0].tradeName + '#',
                      style:
                          TextStyle(color: hex('#999'), fontSize: G.setSp(24)))
                  : Container()
            ],
          ),
        ));
  }

  // 模块列表
  // Widget _module() {
  //   return Expanded(
  //     child: FutureBuilder(
  //       future: moduleFuture,
  //       builder: (context, shapshot) {
  //         if (shapshot.hasData) {
  //           return ListView.builder(
  //               itemCount: moduleList.length,
  //               itemBuilder: (context, index) {
  //                 return _moduleItem(moduleList[index]);
  //               });
  //         } else {
  //           return VEmpty(hintText: '加载中');
  //         }
  //       },
  //     ),
  //   );
  // }

  Future _getModule() async {
    var result = await MarketingApi().moduleList();
    List data = result.data['data'];
    List<ModuleModel> moduleTemp = <ModuleModel>[];
    if (result.data['code'] == 200) {
      if (data != null) {
        data.forEach((item) {
          moduleTemp.add(ModuleModel.fromJson(item));
        });
      } else {
        G.toast('暂无分销管理首页数据');
      }
    } else {}

    setState(() {
      moduleList = moduleTemp;
    });
    return 'end';
  }

  @override
  void initState() {
    super.initState();
    bannerFuture = _getBanner();
    moduleFuture = _getModule();
    scrollController.addListener(() {
      if (scrollController.offset < screenHeight && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (scrollController.offset >= screenHeight &&
          showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.only(top: G.statusHeight),
            child: Container(
                child: Column(
              children: <Widget>[
                _searchHeader(),
                Expanded(
                  child: EasyRefresh(
                    header: vRefreshHeader,
                    onRefresh: () async {
                      await _getModule();
                      await _getBanner();
                    },
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: <Widget>[
                        SliverPadding(
                            padding: const EdgeInsets.all(0.0),
                            sliver: new SliverGrid(
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, //Grid按两列显示
                                childAspectRatio: 2.142,
                              ),
                              delegate: new SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Container(
                                    margin:
                                        EdgeInsets.only(bottom: G.setWidth(50)),
                                    child: _banner(),
                                  );
                                },
                                childCount: 1,
                              ),
                            )),
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return _moduleItem(moduleList[index]);
                          }, childCount: moduleList.length),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
          floatingActionButton: !showToTopBtn
              ? null
              : FloatingActionButton(
                  child: Image.asset(
                    '${G.imgBaseUrl}marketing/backtop.png',
                    width: G.setWidth(110),
                    height: G.setWidth(110),
                  ),
                  onPressed: () {
                    scrollController.animateTo(0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                ),
        ));
  }
}
