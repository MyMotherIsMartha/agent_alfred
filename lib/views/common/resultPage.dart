import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/api/login.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/ServiceLocator.dart';
import 'package:agent37_flutter/utils/TelAndSmsService.dart';

class ResultPage extends StatefulWidget {
  final String status;
  final String haveExit;
  final String refuseReason;

  ResultPage({this.status, this.haveExit, this.refuseReason});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String refuseReason = '';
  var statusCode = 1;
  var appTitle = '企业信息审核';
  final TelAndSmsService _service = locator<TelAndSmsService>();
  Widget middleArea;

  @override
  void initState() {
    super.initState();
   
    middleArea = middleStatusWidget4();
    statusCode = int.parse(widget.status);
    refuseReason = widget.refuseReason;
    print(statusCode);
    print(widget.haveExit);
    _getCurrentWidgetAndTitle();
  }

  void refreshFunc() async {
    // Provider.of<UserProvide>(context).updateUserAuth();
    var result = await LoginApi().getUserAuth();
    print(result.data['data'].toString());
    int qualificationsStatus = result.data['data']['qualificationsStatus'];
    
    setState(() {
      statusCode = qualificationsStatus;
      refuseReason = result.data['data']['auditRefuseReason'] ?? '';
      _getCurrentWidgetAndTitle();
    });
  }

  void checkQualification() {
    Map uploadData = {
      'isRequest': true
    };
    var uploadJson = FluroConvertUtils.object2string(uploadData);
    G.navigateTo(context, '/uploadLicenseForm?uploadJson=$uploadJson');
  }

  void modifyInfo() {
    G.navigateTo(context, '/uploadEnterPrisePic?isFirstUpload=false');
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
                  G.router.navigateTo(context, '/index', replace: true);
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
        Text('原因：$refuseReason', style: TextStyle(color: hex('#666'), fontSize: G.setSp(28)),),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: modifyInfo,
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
        Text.rich(TextSpan(
          children: [
            TextSpan(
              text: '您的企业信息提交窗口期日期已到期，可申请延期，客服电话：',
              style: TextStyle(color: hex('#666'), fontSize: G.setSp(28))
            ),
            TextSpan(
              text: '18758365673',
              style: TextStyle(color: hex('#0091F0'), fontSize: G.setSp(28)),
              recognizer: TapGestureRecognizer()..onTap = () async {
                _service.call('18758365673');
                print('testetstes');
              }
            ),
            
          ]
        )),
        Container(
          height: G.setHeight(265),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            RaisedButton(
              onPressed: () async {
                var result = await MemberApi().applyQualificationsDelayAudit();
                if (result.data['code'] == 200) {
                  setState(() {
                    statusCode = 3;
                    _getCurrentWidgetAndTitle();
                  });
                }
                
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

  //  发票提交审核成功
  Widget middleStatusWidgetInvoice() {
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
        Text('发票提交成功，请尽快寄出发票',
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
            ),
            RaisedButton(
              onPressed: () {
                G.navigateTo(context, '/sendAdress');
              },
              elevation: 4.0,
              color: hex('#D6DBFF'),
              textColor: hex('#6982FF'),
              shape: StadiumBorder(),
              child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Text('寄票地址', style: TextStyle(fontSize: G.setSp(36))),
              )
            )
          ],)
        )
      ],
    ); 
  }

  void _getCurrentWidgetAndTitle() {
    // 资审状态 -3：资质审核关闭；-2: 资质审核超时; -1: 资质审核拒绝; 0: 待资质审核提交；1: 资质审核已提交 2：待资质审核；3：资质审核延迟申请；4：资质审核成功
    appTitle = '企业信息审核';
    if (statusCode == 1 || statusCode == 2) {
      middleArea = middleStatusWidget1();
    } else if (statusCode == 4) {
      middleArea = middleStatusWidget2();
    } else if (statusCode == -1) {
      middleArea = middleStatusWidget3();
    } else if (statusCode == -2) {
      appTitle = '提审窗口到期';
      middleArea = middleStatusWidget4();
    } else if (statusCode == -3) {
      appTitle = '退款待审核';
      middleArea = middleStatusWidget5();
    } else if (statusCode == 3) {
      appTitle = '提审延时申请';
      middleArea = middleStatusWidget6();
    } else if (statusCode == 11) {
      //  代理商短信验证
      appTitle = '验证完成';
      middleArea = middleStatusWidgetAgent();
    } else if (statusCode == 12) {
      //  发票提交审核成功
      appTitle = '上传发票';
      middleArea = middleStatusWidgetInvoice();
    } else {
      middleArea = middleStatusWidget1();
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
                    onPressed: () {
                      G.removePref('token');
                      G.router.navigateTo(context, '/login', replace: true);
                    },
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
              child: middleArea,
            ),
          ],
        ),
      )
    );
  }
}