import 'package:flutter/cupertino.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/global.dart';

class PerfectEnterpriseAudit extends StatefulWidget {
  final currentStatus;

  PerfectEnterpriseAudit({this.currentStatus});

  @override
  _PerfectEnterpriseAuditState createState() => _PerfectEnterpriseAuditState();
}

class _PerfectEnterpriseAuditState extends State<PerfectEnterpriseAudit> {
  var statusCode;

  void refreshFunc() {
    print('refresh!!!');
    setState(() {
      statusCode = 2;
    });
  }

  void viewQualifaction() {
    G.navigateTo(context, '/readPerfectInfo');
  }

  Widget middleStatusWidget1() {
    return Column(
      children: <Widget>[
        Container(
          width: G.setWidth(350),
          height: G.setWidth(350),
          margin: EdgeInsets.only(top: G.setHeight(100)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/enterprise/auditing.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        G.spacing(G.setHeight(50)),
        Text('企业信息待审核',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
          G.spacing(G.setHeight(10)),      
        Text('您的企业信息正在审核中，将在24小时内审核完成，请耐心等候', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: refreshFunc,
              elevation: 4.0,
              color: hex('#69A5FF'),
              textColor: Colors.white,
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text('刷新', style: TextStyle(fontSize: G.setSp(36))),
              )
            ),
            RaisedButton(
              onPressed: viewQualifaction,
              elevation: 4.0,
              color: hex('#D6DBFF'),
              textColor: hex('#6982FF'),
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Text('查看资质', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    );
  } 

  Widget middleStatusWidget2() {
    return Column(
      children: <Widget>[
        Container(
          width: G.setWidth(350),
          height: G.setWidth(350),
          margin: EdgeInsets.only(top: G.setHeight(100)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/enterprise/finish.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        G.spacing(G.setHeight(50)),
        Text('提交成功',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
          G.spacing(G.setHeight(10)),      
        Text('您已提交成功，请等待审核', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  statusCode = 3;
                });
              },
              elevation: 4.0,
              color: hex('#69A5FF'),
              textColor: Colors.white,
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text('返回', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    ); 
  }

  Widget getCurrentWidget() {
    print(statusCode);
    if (statusCode == 1) {
      return middleStatusWidget1();
    } else if (statusCode == 2) {
      return middleStatusWidget2();
    } else {
      return middleStatusWidget1();
    }
  }

  @override
  void initState() {
    super.initState();
    statusCode = widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: hex('#F3F4F6'),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: G.setHeight(59)),
              height: G.setHeight(278),
              decoration: BoxDecoration( // 边色与边宽度
                  gradient: LinearGradient(colors: [hex('#685AFF'), hex('#69A5FF')], begin: FractionalOffset(0, 1), end: FractionalOffset(1, 0)),
                  borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(120, 40))
                )
            ),
            AppBar(
              brightness: Brightness.dark,
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              iconTheme: IconThemeData(color: hex('#fff')),
              title: Text(
                '完善企业信息',
                style: TextStyle(color: hex('#fff'), fontSize: G.setSp(36)),
              )
            ),
            Container(
              margin: EdgeInsets.only(left: G.setWidth(50), right: G.setWidth(50), top: G.setHeight(184)),
              padding: EdgeInsets.symmetric(horizontal: G.setWidth(50)),
              decoration: BoxDecoration(
                color: hex('#fff'),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              height: G.setHeight(900),
              child: getCurrentWidget(),
            ),
          ],
        ),
      )
    );
  }
}