import 'package:agent37_flutter/api/marketing.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/models/marketing-search.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:agent37_flutter/views/marketing/search-util.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MarketSearchPage extends StatefulWidget {
  @override
  _MarketSearchPageState createState() => _MarketSearchPageState();
}

class _MarketSearchPageState extends State<MarketSearchPage> {
  String searchContext;
  List<MarketingSearchItemModel> itemList = [];
  List<String> historyList; // 历史搜索记录列表
  final TextEditingController _searchController = TextEditingController();
  EasyRefreshController _refreshController = EasyRefreshController();
  int pageNo = 1;
  int total;

  void _getHistoryFromPref() {
    List list = MarketingSearchUtil.getHistoryList() ?? [];
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
        height: G.setWidth(64),
        // padding: EdgeInsets.symmetric(horizontal: G.setWidth(20)),
        // margin: EdgeInsets.only(bottom: G.setWidth(30)),
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //     border: Border(
        //         bottom: BorderSide(color: hex('#E5E6E5'), width: G.setWidth(1)))),
        child: Container(
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
                  MarketingSearchUtil.setHistoryData(e);
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
                hintText: "搜索名称/导师",
                hintMaxLines: 1,
                hintStyle:
                    TextStyle(color: hex('#BFBFBF'), fontSize: G.setSp(28)),
              )),
        ));
  }

  Widget _searchBar() {
    return AppBar(
        titleSpacing: 0,
        elevation: 0,
        centerTitle: true,
        title: _searchHeader());
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
          FocusScope.of(context).requestFocus(FocusNode());
          _getList(refresh: true);
        },
        child: Text(content,
            style: TextStyle(fontSize: G.setSp(24), color: hex('#666'))),
      ),
    );
  }

  // 历史记录
  Widget _searchHistory() {
    return historyList != null && historyList.length > 0
        ? Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: G.setWidth(30)),
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('历史记录',
                          style: TextStyle(
                              fontSize: G.setSp(28), color: hex('#999'))),
                      InkWell(
                        onTap: () {
                          // TODO:: 删除警告
                          MarketingSearchUtil.removeHistoryList();
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
            ))
        : Container();
  }

  Future _getList({bool refresh = false}) async {
    if (refresh) {
      _refreshController?.finishLoad(success: true, noMore: false);
      pageNo = 1;
      itemList = <MarketingSearchItemModel>[];
    } else {
      ++pageNo;
    }

    MarketingSearchModel sourceData;
    var result = await MarketingApi().searchModule(searchContext, pageNo);
    var data = result.data['data'];
    sourceData = MarketingSearchModel.fromJson(data);

    setState(() {
      total = sourceData.total;
    });
    itemList.addAll(sourceData.records);

    if (itemList.length >= total) {
      _refreshController?.finishLoad(success: true, noMore: true);
    }
  }

  // 搜索结果单项
  Widget _courseItem(MarketingSearchItemModel item) {
    return InkWell(
      onTap: () {
        int type = item.moduleContactType;
        String id = item.contactId;
        if (type == 2) {
          G.navigateTo(context, '/market/course?id=' + id);
        }
        if (type == 1) {
            G.navigateTo(context, '/market/meeting?id=' + id);
          }
      },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: G.setWidth(30)),
      height: G.setWidth(260),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: G.setWidth(1), color: hex('#eee')))),
      child: Row(
        children: <Widget>[
          Container(
            width: G.setWidth(300),
            height: G.setWidth(200),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(item.contactImg), fit: BoxFit.fill)),
          ),
          G.spacing(20, dir: 'x'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  maxWidth: G.setWidth(370)
                ),
                child: Text(item.contactName),
              ),
              // Text(item.createTime.toString())
            ],
          )
        ],
      ),
    ));
  }

  // 搜索结果
  Widget _courseList() {
    return Expanded(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
            child: itemList.length > 0
            ? EasyRefresh(
              controller: _refreshController,
              header: vRefreshHeader,
              footer: vRefreshFooter,
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return _courseItem(itemList[index]);
                  }),
              onLoad: () async {
                await _getList();
              },
            )
            : Container(
                margin: EdgeInsets.only(top: G.setWidth(200)),
                child: VEmpty(hintText: '暂无相关记录~'),
              ))
            // ListView.builder(
            //   itemCount: itemList.length,
            //   itemBuilder: (context, index) {
            //     return _courseItem(itemList[index]);
            //   }
            // ),
            );
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
        // Container(height: G.statusHeight),
        _searchBar(),
        Validate.isNon(searchContext) || (itemList.length == 0)
            ? _searchHistory()
            : Container(),
        _courseList()
      ],
    ));
  }
}
