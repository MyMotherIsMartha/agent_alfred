import 'package:agent37_flutter/models/agentManage.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/global.dart';
class AgentListItem extends StatefulWidget {
  final AgentItemModel item;

  AgentListItem(this.item);
  @override
  _AgentListItemState createState() => _AgentListItemState();
}

class _AgentListItemState extends State<AgentListItem> {

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

  @override
  Widget build(BuildContext context) {
    AgentItemModel item = widget.item;
    int currentTab = item.checkStatus == -1 ? 0 : 1;

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
                item.isNewShowFlag ? Image(height: G.setHeight(34),image: AssetImage('lib/assets/images/pic-icon/new-ellipse.png')) : Text(''),
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
            var sharecode = item.shareCode;
            String companyStr = FluroConvertUtils.fluroCnParamsEncode(company);
            G.navigateTo(context, Routes.agentVerify + '?mobile=$mobile&company=$companyStr&sharecode=$sharecode');
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: hex('#eee'), width:  G.setWidth(1))),
            ),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 20, 0), 
                child: Image(width: G.setWidth(100),image: item.headSculptureUrl != null ? NetworkImage(item.headSculptureUrl) : AssetImage('lib/assets/images/home/vip.png'))
              ),
              Column(
                children: [
                  Row(children: <Widget>[
                    Text('手机号:'),
                    G.spacingWidth(25),
                    Text(item.mobile)
                  ],),
                  Row(children: <Widget>[
                    Text(currentTab == 1 ? '注册时间:' : '购买时间:'),
                    G.spacingWidth(20),
                    Text(G.formatTime(currentTab == 1 ? item.registerTime : item.payTime, type: 'date'))
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