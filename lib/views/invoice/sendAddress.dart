
import 'package:agent37_flutter/api/system.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendAddress extends StatefulWidget {
  @override
  _SendAddressState createState() => _SendAddressState();
}

class _SendAddressState extends State<SendAddress> {
  String addressStr = '浙江省宁波市南部商务区豪如大厦2401';
  String contactName = '';
  String mobile = '';

  @override
  void initState() { 
    super.initState();
    _getCompanyInfo();
  }

  Future _getCompanyInfo() async {
    var result = await SystemApi().getCompanyInfos();
    Map resultData = result.data['data'];
    print(resultData);
    setState(() {
      contactName = resultData['contactName'];
      mobile = resultData['contactMobile'];
      addressStr = resultData['address'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        title: Text(
          '寄票地址',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        ),
      ),
      body: Column(
        children: [
          G.spacing(20),
          VField(label: '收货人', fieldVal: contactName),
          VField(label: '联系方式', fieldVal: mobile),
          VField(label: '收货地址', fieldVal: addressStr),
          Container(
            padding: EdgeInsets.only(bottom: G.setWidth(40)),
            margin: EdgeInsets.only(top: G.setWidth(60)),
            child: VButton(text: '复制地址', fn: () {
              G.setClipboard(addressStr);
            }),
          )
        ],
      )
    );
  }
}