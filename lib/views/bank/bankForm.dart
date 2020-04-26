import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/components/v-input%20copy.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';

class BankFormPage extends StatefulWidget {
  @override
  _BankFormPageState createState() => _BankFormPageState();
}

class _BankFormPageState extends State<BankFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _enterpriseName = 'test';
  TextEditingController _bankNameCtrl;
  TextEditingController _subBankCtrl;
  TextEditingController _bankCodeCtrl;


  _showPickerJobs(context) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        title: Text(
          '编辑银行卡',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          color: hex('#F3F4F6'),
          child: Column(
            children: [
              Container(
                height: G.setHeight(20)
              ),
              Container(
                color: hex('#FFF'),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      VField(label: '企业名称', fieldVal: _enterpriseName),
                      Container(
                          height: G.setHeight(100),
                          padding: EdgeInsets.symmetric(
                            horizontal: G.setWidth(30)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: hex('#eee'), width:  G.setWidth(1)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: G.setWidth(160),
                                child: Text('所属行业', style: TextStyle(
                                  fontSize: G.setSp(30),
                                  color: hex('#666')
                                ))
                              ),
                              Expanded(
                                child: InkWell(
                                    onTap: () {
                                      _showPickerJobs(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField(
                                            controller: _bankNameCtrl,
                                            // initialValue: '1234',
                                            onTap: () {
                                              _showPickerJobs(context);
                                            },
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                border: InputBorder.none, hintText: '请选择行业'),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return '请选择行业';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        // Text(city ?? '请选择'),
                                        iconarrow(size: G.setWidth(35))
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ]
          ),
        )
      ),
    );
  }
}