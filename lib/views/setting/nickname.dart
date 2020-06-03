import 'package:agent37_flutter/api/setting.dart';
import 'package:agent37_flutter/components/Icon.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingNicknamePage extends StatefulWidget {
  @override
  _SettingNicknamePageState createState() => _SettingNicknamePageState();
}

class _SettingNicknamePageState extends State<SettingNicknamePage> {
  TextEditingController _nicknameController = TextEditingController();
  FocusNode _focusNode = new FocusNode();
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _showClear = _nicknameController.value.text != null &&
              _nicknameController.value.text.isNotEmpty;
        });
      } else {
        setState(() {
          _showClear = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String nickname = Provider.of<UserProvide>(context).userAuthInfo?.nickname;
    // _nicknameController.value = G.setTextEdit(nickname);
    _nicknameController = TextEditingController(text: nickname);
    return Scaffold(
      backgroundColor: hex('#F3F4F6'),
      appBar: AppBar(
        title: Text('昵称'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              String nickname = _nicknameController.value.text;
              if (Validate.isNon(nickname)) {
                G.toast('请输入昵称');
                return;
              }
              const regExp = r"[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]";
              if (!RegExp(regExp).hasMatch(nickname)) {
                G.toast('昵称不合法，请重新输入');
                return;
              }
              Map data = {'nickname': nickname};
              var result = await SettingApi().updateNameAndAvatar(data);
              if (result.data['code'] == 200) {
                UserProvide userProvide = Provider.of<UserProvide>(context);
                G.toast('修改成功');
                userProvide.updateUserAuth(isInit: false);
                G.router.pop(context);
              }
            },
            icon: Text('确定'),
          )
          // Container(
          //   alignment: Alignment.center,
          //   child: InkWell(
          //     onTap: () {},
          //     child: Text('确定'),
          //   ),
          // )
        ],
      ),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: G.setWidth(30)),
                  alignment: Alignment.centerLeft,
                  height: G.setWidth(60),
                  child: Text('请输入1-16位，可由中英文、数字组成',
                      style:
                          TextStyle(fontSize: G.setSp(24), color: hex('#999'))),
                ),
                Container(
                  height: G.setWidth(100),
                  child: TextField(
                    
                      focusNode: _focusNode,
                      controller: _nicknameController,
                      // onSubmitted: (e) {
                      //   if (!Validate.isNon(e)) {
                      // setState(() {
                      //   searchContext = e;
                      // });
                      // goSearch();
                      // SearchUtil.setHistoryData(e);
                      // _getHistoryFromPref();
                      //   }
                      // },
                      maxLength: 16,
                      buildCounter: (context, {currentLength = 10, maxLength = 10, isFocused = false}) {
                        return null;
                      },
                      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]"))],
                      style: TextStyle(fontSize: G.setSp(28)),
                      decoration: InputDecoration(
                        fillColor: hex('#fff'),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: G.setWidth(30)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(G.setWidth(0)),
                            borderSide: BorderSide.none),
                        // prefixIcon:
                        //     iconsearch(color: hex('#BFBFBF'), size: G.setSp(36)),
                        hintText: "搜索订单号/购买企业名称",
                        suffixIcon: _showClear
                            ? InkWell(
                                onTap: () {
                                  _nicknameController.value = G.setTextEdit('');
                                },
                                child: iconclose(),
                              )
                            : SizedBox(
                                width: 0,
                              ),
                        hintMaxLines: 1,
                        hintStyle: TextStyle(
                            color: hex('#BFBFBF'), fontSize: G.setSp(28)),
                      )),
                )
              ],
            ),
          )),
    );
  }
}
