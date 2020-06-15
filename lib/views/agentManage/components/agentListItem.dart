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
  bool showRefuse = false;
  String refuseReason = '';
  AgentItemModel item;

  @override
  void initState() { 
    super.initState();
    item = widget.item;
    if (item.voucherStatus == 3) {
      refuseReason = item.voucherRefuseReason.split('##')[0];
    } else if (item.qualificationsStatus == -1) {
      refuseReason = item.qualificationRefuseReason.split('##')[0];
    }
  }

  Widget leftTopText(qualiStatus, role, voucherStatus, checkStatus, settleStatus) {
    String statusStr;
    if (role == -1) {
      switch (voucherStatus) {
        case 1:
          statusStr = '凭证待审核';
          break;
        case 3:
          statusStr = '凭证审核拒绝';
          break;
        default:
          statusStr = '待支付';
      }
    } else {
      switch (qualiStatus) {
        case -2:
          statusStr = '资质审核超时';
          break;
        case -1:
          statusStr = '资质审核拒绝';
          break;
        case 0:
          statusStr = '资质待提交';
          break;
        case 1:
          statusStr = '资质待审核';
          break;
        case 2:
          statusStr = '资质待审核';
          break;
        case 3:
          statusStr = '延时申请';
          break;
        case 4:
          
          switch (checkStatus) {
            case -1: 
              statusStr = '未开始考核';
              break;
            case 0: case 3: case 1:
              statusStr = '考核中';
              break;
            case 2:
              switch (settleStatus) {
                case 0:
                  statusStr = '考察期';
                  break;
                case 1:
                  statusStr = '待结算';
                  break;
                case 2:
                  statusStr = '已结算';
                  break;
                default:
                  statusStr = '未知状态';
              }
              break;
            default:
              statusStr = '未知状态';
          }
          break;
        default:
          statusStr = '未知状态';
      }
    }
    
    if (qualiStatus == -1 || voucherStatus == 3) {
      return GestureDetector(
        onTap: () {
          setState(() {
            showRefuse = !showRefuse;
          });
        },
        child:
          Row(children: [
            Text(statusStr, style: TextStyle(color: hex('#E84747'))),
            Container(
              margin: EdgeInsets.only(left: G.setWidth(5)),
              decoration: BoxDecoration(
                color: hex('#E6E6E6'),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(showRefuse ? Icons.arrow_drop_up : Icons.arrow_drop_down, size: G.setSp(40), color: hex('#666666'),)
            )
          ])
        );
    } else {
      return Text(statusStr, style: TextStyle(color: hex('#333')));
    }
  }

  getRoleImg(role) {
    if (role == -1) {
      return AssetImage('lib/assets/images/home/agent-normal.png');
    } else if (role == 0) {
      return AssetImage('lib/assets/images/home/agent-underway.png');
    } else if (role == 1) {
      return AssetImage('lib/assets/images/home/agent-already.png');
    }
  }

  @override
  Widget build(BuildContext context) {

    int currentTab = item.checkStatus == -1 ? 0 : 1;

    return Container(
      margin: EdgeInsets.only(bottom: G.setHeight(20)),
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
                  child: Text(item.enterpriseName ?? '普通代理', 
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis, 
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                item.isNewShowFlag ? Image(height: G.setHeight(34),image: AssetImage('lib/assets/images/pic-icon/new-ellipse.png')) : Text(''),
              ]),
              leftTopText(item.qualificationsStatus, item.role, item.voucherStatus, item.checkStatus, item.settleStatus),
            ]
          ),
        ),
        Offstage( // 控制拒绝原因的显隐
          offstage: item.qualificationsStatus != -1 && item.voucherStatus != 3 || !showRefuse,
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
            child: Text(refuseReason, style: TextStyle(color: hex('#666666'))),
          ),
        ),
        InkWell(
          onTap: () {
            // print(item["value"].toString());
            var mobile = item.mobile;
            var company = item.enterpriseName ?? '普通代理';
            var sharecode = item.shareCode;
            String companyStr = FluroConvertUtils.fluroCnParamsEncode(company);
            if (item.smsValid || item.role == -1) {
              // G.navigateTo(context, Routes.agentVerify + '?mobile=$mobile&company=$companyStr&sharecode=$sharecode');
              return;
            } else {
              G.navigateTo(context, Routes.agentVerify + '?mobile=$mobile&company=$companyStr&sharecode=$sharecode');
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: hex('#eee'), width:  G.setWidth(1))),
            ),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 20, 0), 
                child: Image(width: G.setWidth(100),image: item.headSculptureUrl != null ? NetworkImage(item.headSculptureUrl) : getRoleImg(item.role))
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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