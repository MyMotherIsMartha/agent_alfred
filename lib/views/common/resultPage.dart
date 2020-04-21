import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/api/login.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  final String status;
  final String title;
  final String haveExit;

  ResultPage({this.status, this.title: 'no', this.haveExit: 'yes'});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var statusCode = 1;
  var appTitle = '企业信息审核';

  @override
  void initState() {
    super.initState();
   
    statusCode = int.parse(widget.status);
    print(statusCode);
    print(widget.title);
    print(widget.haveExit);
    if (widget.title != 'no') {
      appTitle = FluroConvertUtils.fluroCnParamsDecode(widget.title);
    }
    
  }

  void refreshFunc() async {
    // Provider.of<UserProvide>(context).updateUserAuth();
    var result = await LoginApi().getUserAuth();
    print(result.data['data'].toString());
    int qualificationsStatus = result.data['data']['qualificationsStatus'];
    setState(() {
      statusCode = qualificationsStatus;
    });
  }

  void checkQualification() {
    Map uploadData = {
      'isRequest': true
    };
    var uploadJson = FluroConvertUtils.object2string(uploadData);
    G.router.navigateTo(context, '/uploadLicenseForm?uploadJson=$uploadJson');
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
              onPressed: checkQualification,
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
              onPressed: checkQualification,
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
                  statusCode = 3;
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
              onPressed: refreshFunc,
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
              onPressed: refreshFunc,
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

  //  代理商短信验证
  Widget middleStatusWidgetAgent() {
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
        Text('短信验证成功',
              style: TextStyle(color: hex('#000'), fontWeight: FontWeight.w500,fontSize: G.setSp(32))),
        //   G.spacing(G.setHeight(10)),      
        // Text('已开通代理商，快去完成考核任务吧', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
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
    // 资审状态 -3：资质审核关闭；-2: 资质审核超时; -1: 资质审核拒绝; 0: 待资质审核提交；1: 资质审核已提交 2：待资质审核；3：资质审核延迟申请；4：资质审核成功
    if (statusCode == 1) {
      return middleStatusWidget1();
    } else if (statusCode == 4) {
      return middleStatusWidget2();
    } else if (statusCode == -1) {
      return middleStatusWidget3();
    } else if (statusCode == -2) {
      return middleStatusWidget4();
    } else if (statusCode == -3) {
      return middleStatusWidget5();
    } else if (statusCode == 3) {
      return middleStatusWidget6();
    } else if (statusCode == 11) {
      //  代理商短信验证
      return middleStatusWidgetAgent();
    } else {
      return middleStatusWidget4();
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
              iconTheme: IconThemeData(color: hex('#fff')),
              title: Text(
                appTitle,
                style: TextStyle(color: hex('#fff'), fontSize: G.setSp(36)),
              ),
              actions: <Widget>[
                widget.haveExit == 'yes' ? 
                FlatButton(
                    onPressed: () {},
                    child: Text('退出',
                        style: TextStyle(color: hex('#fff'), fontSize: G.setSp(32)))) : Text('')
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