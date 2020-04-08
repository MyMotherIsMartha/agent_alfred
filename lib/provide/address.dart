import 'package:agent37_flutter/api/member.dart';
import 'package:agent37_flutter/models/address.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter/material.dart';

class AddressProvide with ChangeNotifier {
  AddressModel address;
  bool needRefresh = true;

  getAddress() async {
    if (needRefresh) {
      needRefresh = false;
      var result = await MemberApi().addressInfo();
      if (result.data['code'] == 200 && result.data['data'] != null) {
        address = AddressModel.fromJson(result.data['data']);
        notifyListeners();
      }
    }
  }

  updateAddress(data) async {
    needRefresh = true;
    var result = await MemberApi().updateAddress(data);
    if (result.data['code'] == 200) {
      G.toast('操作成功');
      notifyListeners();
      getAddress();
    } else {
      print('操作失败');
    }
    return result;
  }
}
