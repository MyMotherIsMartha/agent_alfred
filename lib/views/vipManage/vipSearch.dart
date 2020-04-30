import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/models/vipManage.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:agent37_flutter/views/finance/search-util.dart';
import 'package:agent37_flutter/views/vipManage/components/vipListItem.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class VipManageSearch extends StatefulWidget {
  @override
  _VipManageSearchState createState() => _VipManageSearchState();
}

class _VipManageSearchState extends State<VipManageSearch> {
  List<String> historyList; // 历史搜索记录列表
  String searchContext;
  int pageNo = 1; // 当前页码
  List<VipItemModel> itemList = <VipItemModel>[]; // 订单列表
  int total; // 总条数
  final TextEditingController _searchController = TextEditingController();
  EasyRefreshController _refreshController = EasyRefreshController();
  int listCount = 0;
  var getFuture;

  void _getHistoryFromPref() {
    List list = SearchUtil.getHistoryList();
    List<String> tempList = [];
    list.forEach((item) {
      tempList.add(item.toString());
    });
    setState(() {
      historyList = tempList;
    });
  }

  Future goSearch() async {
    await _getList(refresh: true);
  }

  // 搜索栏
  Widget _searchHeader() {
    return Container(
      width: double.infinity,
      height: G.setWidth(80),
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
      margin: EdgeInsets.only(bottom: G.setWidth(30)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: hex('#E5E6E5'), width: G.setWidth(1)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: G.setWidth(64),
            width: G.setWidth(614),
            child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onSubmitted: (e) {
                  if (!Validate.isNon(e)) {
                    setState(() {
                      searchContext = e;
                    });
                    goSearch();
                    SearchUtil.setHistoryData(e);
                    _getHistoryFromPref();
                  }
                },
                onChanged: (e) {
                  setState(() {
                    itemList = [];
                  });
                },
                style: TextStyle(fontSize: G.setSp(28)),
                decoration: InputDecoration(
                  fillColor: hex('#F3f4f6'),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(G.setWidth(32)),
                      borderSide: BorderSide.none),
                  prefixIcon:
                      iconsearch(color: hex('#BFBFBF'), size: G.setSp(36)),
                  hintText: "搜索会员昵称/手机号",
                  hintMaxLines: 1,
                  hintStyle:
                      TextStyle(color: hex('#BFBFBF'), fontSize: G.setSp(28)),
                )),
          ),
          InkWell(
            onTap: () {
              G.router.pop(context);
            },
            child: Text('取消'),
          )
        ],
      ),
    );
  }

  // 历史记录单项
  Widget _searchItem(String content) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: G.setWidth(20), vertical: G.setWidth(7)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(G.setWidth(24)),
          color: hex('#f3f4f6')),
      child: InkWell(
        onTap: () {
          _searchController.value = G.setTextEdit(content);
          setState(() {
            searchContext = _searchController.value.text;
          });
          _getList(refresh: true);
        },
        child: Text(content,
            style: TextStyle(fontSize: G.setSp(24), color: hex('#666'))),
      ),
    );
  }

  // 历史记录
  Widget _searchHistory() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: G.setWidth(30)),
        padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('历史记录',
                      style:
                          TextStyle(fontSize: G.setSp(28), color: hex('#999'))),
                  InkWell(
                    onTap: () {
                      // TODO:: 删除警告
                      SearchUtil.removeHistoryList();
                      _getHistoryFromPref();
                    },
                    child: icondelete(color: hex('#999')),
                  )
                ]),
            G.spacing(25),
            Container(
                alignment: Alignment.topLeft,
                child: Wrap(
                    spacing: G.setWidth(20),
                    runSpacing: G.setWidth(20),
                    alignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    children: historyList.map<Widget>((String item) {
                      return _searchItem(item);
                    }).toList()
                    // ],
                    ))
          ],
        ));
  }

  // 财务列表
  Widget _vipMemberList() {
    return Expanded(
        flex: 1,
        child: itemList.length > 0
            ? EasyRefresh(
                controller: _refreshController,
                header: vRefreshHeader,
                footer: vRefreshFooter,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: G.setHeight(20),
                          color: Colors.transparent,
                        ),
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return VipListItem(itemList[index]);
                    }),
                onRefresh: () async {
                  await _getList(refresh: true);
                },
                onLoad: () async {
                  await _getList();
                },
              )
            : Container(
                margin: EdgeInsets.only(top: G.setWidth(200)),
                child: VEmpty(hintText: '暂无相关记录~'),
              ));
  }

  Future _getList({bool refresh = false}) async {
    if (refresh) {
      _refreshController?.finishLoad(success: true, noMore: false);
      pageNo = 1;
      itemList = <VipItemModel>[];
    } else {
      ++pageNo;
    }

    VipResultModel sourceData;
    var params = {
      'pageNo': pageNo,
      'pageSize': 10,
      'searchKey': searchContext
    };
    var result = await OrderApi().getAppMemberInfos(params);
    var data = result.data['data'];
    if (data == null) return;
    print(data);
    sourceData = VipResultModel.fromJson(data);

    setState(() {
      total = sourceData.total;
    });
    itemList.addAll(sourceData.records);

    if (itemList.length >= total) {
      _refreshController?.finishLoad(success: true, noMore: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _getHistoryFromPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(height: G.statusHeight),
        _searchHeader(),
        Validate.isNon(searchContext) || itemList.length == 0 ? _searchHistory() : Container(),
        _vipMemberList()
      ],
    ));
  }
}