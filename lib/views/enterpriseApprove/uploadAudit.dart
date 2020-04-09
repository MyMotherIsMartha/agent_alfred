import 'package:flutter/cupertino.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/global.dart';

class UploadLicenseAudit extends StatefulWidget {
  UploadLicenseAudit({Key key}) : super(key: key);

  @override
  _UploadLicenseAuditState createState() => _UploadLicenseAuditState();
}

class _UploadLicenseAuditState extends State<UploadLicenseAudit> {
  var statusCode = 1;

  void refreshFunc() {
    print('refresh!!!');
    setState(() {
      statusCode = 2;
    });
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
              onPressed: refreshFunc,
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
        Text('企业信息审核通过',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
          G.spacing(G.setHeight(10)),      
        Text('已开通代理商，快去完成考核任务吧', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
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
                child: Text('返回首页', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    ); 
  }

  Widget middleStatusWidget3() {
    return Column(
      children: <Widget>[
        Container(
          width: G.setWidth(350),
          height: G.setWidth(350),
          margin: EdgeInsets.only(top: G.setHeight(100)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/enterprise/reject.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        G.spacing(G.setHeight(50)),
        Text('企业信息审核未通过',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
          G.spacing(G.setHeight(10)),      
        Text('您的企业信息审核未通过，请重新填写', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Text('原因：营业执照模糊', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  statusCode = 4;
                });
              },
              elevation: 4.0,
              color: hex('#69A5FF'),
              textColor: Colors.white,
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text('修改信息', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    ); 
  }

  Widget middleStatusWidget4() {
    return Column(
      children: <Widget>[
        Container(
          width: G.setWidth(350),
          height: G.setWidth(350),
          margin: EdgeInsets.only(top: G.setHeight(100)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/enterprise/overdate.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        G.spacing(G.setHeight(50)),
        Text('提审窗口期已到期',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
          G.spacing(G.setHeight(10)),      
        Text('您的企业信息提交窗口期日期已到期，可申请延期，客服电话：40021345678', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  statusCode = 5;
                });
              },
              elevation: 4.0,
              color: hex('#69A5FF'),
              textColor: Colors.white,
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text('延期申请', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    ); 
  }

  Widget middleStatusWidget5() {
    return Column(
      children: <Widget>[
        Container(
          width: G.setWidth(350),
          height: G.setWidth(350),
          margin: EdgeInsets.only(top: G.setHeight(100)),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/enterprise/refund.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        G.spacing(G.setHeight(50)),
        Text('已申请退款',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
          G.spacing(G.setHeight(10)),      
        Text('您的退款申请已同意，工作人员将在48小时内为您打款', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  statusCode = 6;
                });
              },
              elevation: 4.0,
              color: hex('#69A5FF'),
              textColor: Colors.white,
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text('刷新', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    ); 
  }

  Widget middleStatusWidget6() {
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
        Text('已申请延时',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
          G.spacing(G.setHeight(10)),      
        Text('您已申请延时，由工作人员审核通过后可继续提交信息', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  statusCode = 1;
                });
              },
              elevation: 4.0,
              color: hex('#69A5FF'),
              textColor: Colors.white,
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text('刷新', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    ); 
  }

  Widget getCurrentWidget() {
    if (statusCode == 1) {
      return middleStatusWidget1();
    } else if (statusCode == 2) {
      return middleStatusWidget2();
    } else if (statusCode == 3) {
      return middleStatusWidget3();
    } else if (statusCode == 4) {
      return middleStatusWidget4();
    } else if (statusCode == 5) {
      return middleStatusWidget5();
    } else if (statusCode == 6) {
      return middleStatusWidget6();
    } else {
      return middleStatusWidget1();
    }
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
              iconTheme: IconThemeData(color: hex('#E7D1A8')),
              title: Text(
                '企业信息审核',
                style: TextStyle(color: hex('#fff'), fontSize: G.setSp(36)),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {},
                    child: Text('退出',
                        style: TextStyle(color: hex('#fff'), fontSize: G.setSp(32))))
              ],
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