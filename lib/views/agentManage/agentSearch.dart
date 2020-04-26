import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/api/order.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-empty.dart';
import 'package:agent37_flutter/components/v-refresh-header.dart';
import 'package:agent37_flutter/models/agentManage.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:agent37_flutter/views/agentManage/components/agentListItem.dart';
import 'package:agent37_flutter/views/finance/components/finance-item.dart';
import 'package:agent37_flutter/views/finance/search-util.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class AgentManageSearch extends StatefulWidget {
  @override
  _AgentManageSearchState createState() => _AgentManageSearchState();
}

class _AgentManageSearchState extends State<AgentManageSearch> {
  List<String> historyList; // 历史搜索记录列表
  String searchContext;
  int pageNo = 1; // 当前页码
  List<AgentItemModel> itemList = <AgentItemModel>[]; // 订单列表
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
                  hintText: "搜索代理商昵称/手机号",
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
  Widget _agentMemberList() {
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
                      return AgentListItem(itemList[index]);
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
      itemList = <AgentItemModel>[];
    } else {
      ++pageNo;
    }

    AgentResultModel sourceData;
    var params = {
      'pageNo': pageNo,
      'pageSize': 10,
      'searchKey': searchContext
    };
    var result = await MemberApi().getAgentChildren(params);
    var data = result.data['data'];
    if (data == null) return;
    print(data);
    sourceData = AgentResultModel.fromJson(data);

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
        _agentMemberList()
      ],
    ));
  }

  Widget leftTopText(statusCode) {
    String statusStr;
    switch (statusCode) {
      case -3:
        statusStr = '资质审核关闭';
        break;
      case -2:
        statusStr = '资质审核超时';
        break;
      case -1:
        statusStr = '资质审核拒绝';
        break;
      case 0:
        statusStr = '待资质审核提交';
        break;
      case 1:
        statusStr = '资质审核已提交';
        break;
      case 2:
        statusStr = '待资质审核';
        break;
      case 3:
        statusStr = '资质审核延迟申请';
        break;
      case 4:
        statusStr = '资质审核成功';
        break;
      default:
        statusStr = '未知状态';
    }
    if (statusCode == -1) {
      return Row(children: [
        Text(statusStr),
        Container(
          margin: EdgeInsets.only(left: G.setWidth(5)),
          decoration: BoxDecoration(
            color: hex('#E84747'),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.arrow_drop_down, size: G.setSp(40), color: hex('#666666'),)
        )
      ]);
    } else {
      return Text(statusStr, style: TextStyle(color: hex('#333')));
    }
  }

  Widget memberItem(item, {currentTab = 0}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: hex('#FFF'),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: G.setWidth(390),
                  ),
                  child: Text(item.enterpriseName ?? '', 
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis, 
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Image(height: G.setHeight(34),image: item.headSculptureUrl != null ? NetworkImage(item.headSculptureUrl) : AssetImage('lib/assets/images/pic-icon/new-ellipse.png')),
              ]),
              leftTopText(item.qualificationsStatus),
            ]
          ),
        ),
        Offstage( // 控制拒绝原因的显隐
          offstage: item.qualificationsStatus != -1,
          child: Container(
            margin: EdgeInsets.only(bottom: G.setWidth(15)),
            padding: EdgeInsets.symmetric(vertical: G.setWidth(15), horizontal: G.setWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(G.setWidth(10)),
              color: hex('#F3F4F6')
            ),
            constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
            ),
            child: Text(item.qualificationRefuseReason ?? '', style: TextStyle(color: hex('#666666')),),
          ),
        ),
        InkWell(
          onTap: () {
            // print(item["value"].toString());
            var mobile = item.mobile;
            var company = item.enterpriseName ?? '测试企业名称';
            String companyStr = FluroConvertUtils.fluroCnParamsEncode(company);
            G.router.navigateTo(context, Routes.agentVerify + '?mobile=$mobile&company=$companyStr');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: hex('#eee'), width:  G.setWidth(1))),
            ),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 20, 0), 
                child: Image(width: G.setWidth(100),image: AssetImage('lib/assets/images/home/vip.png'))
              ),
              Column(
                children: [
                  Row(children: <Widget>[
                    Text('手机号:'),
                    G.spacingWidth(25),
                    Text(G.hideMobile(item.mobile))
                  ],),
                  Row(children: <Widget>[
                    Text(item.checkStatus == -1 ? '注册时间:' : '购买时间:'),
                    G.spacingWidth(20),
                    Text(G.formatTime(item.registerTime, type: 'date'))
                  ],)
                ]
              )
            ],)
          )
        )
      ])
    );
  }
}