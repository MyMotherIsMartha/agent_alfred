import 'package:agent37_flutter/api/llpay.dart';
import 'package:agent37_flutter/components/v-button.dart';
import 'package:agent37_flutter/components/v-field-select.dart';
import 'package:agent37_flutter/components/v-field.dart';
import 'package:agent37_flutter/components/v-input%20copy.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:provider/provider.dart';

class BankFormPage extends StatefulWidget {
  final String status;
  BankFormPage({this.status});
  @override
  _BankFormPageState createState() => _BankFormPageState();
}

class _BankFormPageState extends State<BankFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _enterpriseName = 'test';
  List bankList = [];
  String bankId;
  String formStatus;
  Map _bankInfo;
  final _bankNameCtrl = TextEditingController();
  final _subBankCtrl = TextEditingController();
  final _bankCodeCtrl = TextEditingController();

  Map formValidate = {
    'bankName': false,
    'subBank': false,
    'bankCode': false,
  };

  _showPickerBanks(context) {
    List<PickerItem<dynamic>> testArray = bankList.map<PickerItem>((item) => PickerItem(text: Text(item['bankName']), value: item['bankId'])).toList();
    Picker picker = new Picker(
      adapter: PickerDataAdapter(data: testArray),
      cancelText: '取消',
      confirmText: '确认',
      height: 250,
      // changeToFirst: true,
      // textAlign: TextAlign.left,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues().first);
        print(picker.adapter.text);
        formValidate['bankName'] = true;
        _bankNameCtrl.value = G.setTextEdit(bankList[value.first]['bankName']);
        bankId = picker.getSelectedValues().first;
      }
    );
    picker.showModal(context);
  }

  submitFunc() async {
    Map params = {
      'bankBranchName': _subBankCtrl.value.text,
      'bankId': bankId,
      'bankUserCode': _bankCodeCtrl.value.text,
      'bankUserName': _bankNameCtrl.value.text
    };
    print(params);
    var result = await LLpayApi().bindBankCard(params);
    print(result.data['data']);
    if (result.data['code'] == 200) {
      Provider.of<UserProvide>(context).updateBankCardInfo();
      G.router.pop(context);
    }
  }

  Future _getBankList() async {
    var result = await LLpayApi().getFindBankList();
    if (result.data['code'] == 200) {
      bankList = result.data['data'];
    } else {
      G.toast('获取银行列表失败');
    }
  }

  Future _getUserBankInfo() async{
    var result = await LLpayApi().getUserBankInfo();
    var resultData = result.data['data'];
    setState(() {
      _bankInfo = resultData;
      bankId = _bankInfo['bankId'];
      _bankNameCtrl.value = G.setTextEdit(_bankInfo['bankName']);
      _subBankCtrl.value = G.setTextEdit(_bankInfo['bankBranchName']);
      _bankCodeCtrl.value = G.setTextEdit(_bankInfo['bankUserCode']);
      formValidate = {
        'bankName': true,
        'subBank': true,
        'bankCode': true,
      };
    });
  }

  @override
  void initState() {
    super.initState();
    formStatus = widget.status;
    print(formStatus);
    _getBankList();
    if (formStatus == '1') {
      _getUserBankInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    _enterpriseName = Provider.of<UserProvide>(context).enterpriseInfo.enterpriseName ?? '';

    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: hex('#000')),
        title: Text(
          formStatus == '0' ? '新增银行卡' : '编辑银行卡',
          style: TextStyle(color: hex('#000'), fontSize: G.setSp(36)),
        )
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      VFieldSelect(
                        label: '银行名称', 
                        hintText: '请选择开户银行', 
                        controller: _bankNameCtrl,
                        onTap: () {
                          _showPickerBanks(context);
                        },
                      ),
                      VInput(
                        type: TextInputType.text,
                        controller: _subBankCtrl,
                        hintText: '请选择银行支行',
                        label: '银行支行',
                        onChange: (e) {
                          setState(() {
                            formValidate['subBank'] = !Validate.isNon(e);
                          });
                        },
                      ),
                      VInput(
                        type: TextInputType.number,
                        controller: _bankCodeCtrl,
                        hintText: '请输入银行卡号',
                        label: '银行卡号',
                        onChange: (e) {
                          setState(() {
                            formValidate['bankCode'] = !Validate.isNon(e);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: VButton(
                  text: '保存',
                  disabled: formValidate.containsValue(false), 
                  fn: () {
                    submitFunc();
                  }
                )
              ),
            ]
          ),
        )
      ),
    );
  }
}