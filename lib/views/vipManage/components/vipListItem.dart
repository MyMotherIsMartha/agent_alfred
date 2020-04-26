import 'package:agent37_flutter/models/vipManage.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/routes/routes.dart';
import 'package:agent37_flutter/utils/global.dart';
class VipListItem extends StatefulWidget {
  final VipItemModel item;

  VipListItem(this.item);
  @override
  _VipListItemState createState() => _VipListItemState();
}

class _VipListItemState extends State<VipListItem> {

  Widget leftTopText(statusCode) {
    String statusStr;
    switch (statusCode) {
      case -1:
        statusStr = '未提交审核';
        break;
      case 1:
        statusStr = '已通过认证';
        break;
      case 0:
        statusStr = '未通过认证';
        break;
      case 2:
        statusStr = '驳回认证';
        break;
      default:
        statusStr = '未知状态';
    }
    if (statusCode == 2) {
      return Row(children: [
        Text(statusStr),
        Container(
          margin: EdgeInsets.only(left: G.setWidth(5)),
          decoration: BoxDecoration(
            color: hex('#E6E6E6'),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.arrow_drop_down, size: G.setSp(40), color: hex('#666666'),)
        )
      ]);
    } else {
      return Text(statusStr);
    }
  }

  @override
  Widget build(BuildContext context) {
    VipItemModel item = widget.item;

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
                Image(height: G.setHeight(34),image: item.headImg != '' ? NetworkImage(item.headImg) : AssetImage('lib/assets/images/pic-icon/new-ellipse.png')),
                Container(
                  margin: EdgeInsets.only(left: G.setWidth(5)),
                  constraints: BoxConstraints(
                    maxWidth: G.setWidth(425),
                  ),
                  child: Text(item.enterpriseName ?? '',
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis, 
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ]),
              leftTopText(item.auditStatus)
            ]
          ),
        ),
        Offstage( // 控制拒绝原因的显隐
          offstage: item.auditStatus != 2,
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
            child: Text(item.rejectReason, style: TextStyle(color: hex('#666666')),),
          ),
        ),
        InkWell(
          onTap: () {
            // print(item["value"].toString());
            String vipId = item.memberId;
            G.router.navigateTo(context, Routes.vipDetail + '?vipId=$vipId');
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
                    Text('注册时间:'),
                    G.spacingWidth(20),
                    Text(G.formatTime(item.registerTime, type: 'date'))
                    // Text(formatDate(DateTime(fromMillisecondsSinceEpoch(item.registerTime)) ,[yyyy,'-',mm,'-',dd]);)
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