import 'package:flutter/cupertino.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/utils/global.dart';

class ReadPerfectInfo extends StatefulWidget {
  ReadPerfectInfo({Key key}) : super(key: key);

  @override
  _ReadPerfectInfoState createState() => _ReadPerfectInfoState();
}

class _ReadPerfectInfoState extends State<ReadPerfectInfo>
 with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;

  var licenseUrl = 'https://static37.woouo.com/agent/20200408/22b14781819d49ab98a9e9d547f9e48f.jpg';
  List tabs = ["企业信息", "证件信息"];
  Widget formDataWrap1;
  Widget formDataWrap2 = Text('加载中...');

  @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this)
    ..addListener(() {
        if(_tabController.indexIsChanging){
          setState(() {
            tabIndex = _tabController.index;
          });
        }
      });
    G.setContext(context);
    G.setPref('token', 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJBdXRob3JpemF0aW9uIjoiIiwibmJmIjoxNTg2MzI2MjE0LCJpc3MiOiIzN2R1bGlnb3UiLCJtb2JpbGUiOiIxODg5MjY2MzAyNSIsImV4cCI6MTU4NjkzMTAxNCwiaWF0IjoxNTg2MzI2MjE0LCJ1c2VySWQiOjEyMDQ1ODkwNDYxNjM5MDI0NjYsInVzZXJuYW1lIjoiMTg4OTI2NjMwMjUifQ.FwMvr15n_TU7kmJwKCSGO97gx5qcwtQCFIn0-tEv65c');
    
    _getEnterpriseInfo();
    _getPerfectInfo();
  }

  _getEnterpriseInfo() async {
    var result = await MemberApi().getEnterpriseInfo();
    var resultData = result.data['data'];
    print(result.data.toString());
    licenseUrl = resultData['businessLicensePicture'];
    formData1['jobName']['val'] = resultData['industryName'];
    formData1['enterpriseName']['val'] = resultData['enterpriseName'];
    formData1['registerCode']['val'] = resultData['registerCode'];
    formData1['areaName']['val'] = resultData['province'] + resultData['city'] + resultData['district'];
    formData1['addressStr']['val'] = resultData['registerAddress'];
    formData1['legalName']['val'] = resultData['legalPerson'];
    formData1['legalMobile']['val'] = resultData['mobile'];
    formData1['legalIdNo']['val'] = resultData['legalIdCard'];

    List<Widget> fieldWidgetAry1 = [];
    formData1.forEach((key, val) {
      print(val);
      fieldWidgetAry1.add(
        VField(
          label: val['label'],
          fieldVal: val['val'],
        )
      );
    });
    setState(() {
      formDataWrap1 = Column(
        children: fieldWidgetAry1
      );
    });
  }

  Map formData1 = {
    'jobName': {'label': '所属行业', 'val': ''},
    'enterpriseName': {'label': '企业名称', 'val': ''},
    'registerCode': {'label': '营业执照号', 'val': ''},
    'areaName': {'label': '注册地区', 'val': ''},
    'addressStr': {'label': '注册地址', 'val': ''},
    'legalName': {'label': '法人姓名', 'val': ''},
    'legalMobile': {'label': '法人手机号', 'val': ''},
    'legalIdNo': {'label': '法人身份证', 'val': ''}
  };

    Widget enterpriseInfo() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: G.setHeight(20)),
          decoration: BoxDecoration(
            // color: Colors.black26,
            image: DecorationImage(
              image: NetworkImage(licenseUrl),
              fit: BoxFit.cover,
            ),
          ),
          // alignment: Alignment.center,
          width: G.setWidth(709),
          height: G.setHeight(396),
        ),
        Container(
          color: hex('#fff'),
          child: formDataWrap1
        )]
    );
  }


  _getPerfectInfo() async {
    var result = await MemberApi().getPerfectInfo();
    var resultData = result.data['data'];
    print(result.data.toString());
    resultData2['legalName'] = resultData['name'];
    resultData2['frontIdCard1'] = resultData['legalIdCardFront'];
    resultData2['backIdCard1'] = resultData['legalIdCardBack'];
    resultData2['frontIdCard2'] = resultData['idCardFront'];
    resultData2['backIdCard2'] = resultData['idCardBack'];

    formData2['principalName']['val'] = resultData['name'];
    formData2['mobile']['val'] = resultData['mobile'];
    formData2['email']['val'] = resultData['email'];
    formData2['areaName']['val'] = resultData['province'] + resultData['city'] + resultData['district'];
    formData2['addressStr']['val'] = resultData['address'];

    List<Widget> fieldWidgetAry2 = [];
    formData2.forEach((key, val) {
      print(val);
      fieldWidgetAry2.add(
        VField(
          label: val['label'],
          fieldVal: val['val'],
        )
      );
    });

    setState(() {
      formDataWrap2 = Column(
        children: fieldWidgetAry2
      );
    });
  }

  

  Map resultData2 = {
    'legalName': '',
    'frontIdCard1': null,
    'backIdCard1': null,
    'frontIdCard2': null,
    'backIdCard2': null
  };

  Map formData2 = {
    'principalName': {'label': '姓名', 'val': ''},
    'mobile': {'label': '手机号', 'val': ''},
    'email': {'label': '邮箱', 'val': ''},
    'areaName': {'label': '工作地区', 'val': ''},
    'addressStr': {'label': '详细地址', 'val': ''}
  };


  Widget titleWidget(padding, size, String text) {
    return Padding(padding: EdgeInsets.only(left: padding), child: Text(text, textAlign: TextAlign.left, style: TextStyle(fontSize: size, height: 2.4, color: hex('#666'))));
  }

  idCardImg(String url) {
    return url != null ? NetworkImage(url) : AssetImage('lib/assets/images/enterprise/idCardFront.png');
  }

  Widget idCardInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleWidget(G.setWidth(30), G.setSp(24), '法人信息'),
        Container(
          color: hex('#fff'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              VField(
                label: '姓名',
                fieldVal: resultData2['legalName'],
              ),
              titleWidget(G.setWidth(30), G.setSp(30), '身份证上传'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setHeight(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: G.setWidth(330),
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                                  // color: Colors.black26,
                          image: DecorationImage(
                            image: idCardImg(resultData2['frontIdCard1']),
                            fit: BoxFit.contain,
                          ),
                        ),
                        width: G.setWidth(330),
                        height: G.setHeight(206),
                        // child: Image(image: new AssetImage('lib/assets/images/enterprise/idCardFront.png')),
                      ),
                    ),
                    Container(
                      width: G.setWidth(330),
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                                  // color: Colors.black26,
                          image: DecorationImage(
                            image: idCardImg(resultData2['backIdCard1']),
                            fit: BoxFit.contain,
                          ),
                        ),
                        width: G.setWidth(330),
                        height: G.setHeight(206),
                        // child: Image(image: new AssetImage('lib/assets/images/enterprise/idCardFront.png')),
                      ),
                    )
                  ]
                ),
              )
            ],
          )
        ),
        titleWidget(G.setWidth(30), G.setSp(24), '负责人信息'),
        Container(
          color: hex('#FFF'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              formDataWrap2,
              titleWidget(G.setWidth(30), G.setSp(30), '身份证上传'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: G.setWidth(30), vertical: G.setHeight(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: G.setWidth(330),
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                                  // color: Colors.black26,
                          image: DecorationImage(
                            image: idCardImg(resultData2['frontIdCard2']),
                            fit: BoxFit.contain,
                          ),
                        ),
                        width: G.setWidth(330),
                        height: G.setHeight(206),
                        // child: Image(image: new AssetImage('lib/assets/images/enterprise/idCardFront.png')),
                      ),
                    ),
                    Container(
                      width: G.setWidth(330),
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                                  // color: Colors.black26,
                          image: DecorationImage(
                            image: idCardImg(resultData2['backIdCard2']),
                            fit: BoxFit.contain,
                          ),
                        ),
                        width: G.setWidth(330),
                        height: G.setHeight(206),
                        // child: Image(image: new AssetImage('lib/assets/images/enterprise/idCardFront.png')),
                      ),
                    )
                  ]
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#E7D1A8')),
        title: Text(
          '企业信息',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                G.router.navigateTo(context, '/perfectEnterprise1');
              },
              child: Text('编辑',
                  style: TextStyle(color: hex('#000'), fontSize: G.setSp(32))))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: hex('#F3F4F6'),
          child: Column(
            children: <Widget>[
              Container(
                color: hex('#CABEA6'),
                padding: EdgeInsets.symmetric(vertical: 5),
                width: G.setWidth(750),
                child: Text('拒绝原因：营业执照拍摄不够清晰，请在右上角点击编辑后再提交',
                textAlign: TextAlign.center,
                  style: TextStyle(fontSize: G.setSp(24),color: hex('#fff'))
                )
              ),
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  tabs: tabs.map((e) => Tab(text: e)).toList()
                )
              ),
              tabIndex == 0 ? enterpriseInfo() :idCardInfo()
            ],
          ),
        ),
      )
    );
  }
}