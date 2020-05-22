import 'dart:convert';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:provider/provider.dart';
 
class MarketingSearchUtil {
  static final historyKey = 'marketing-searchList' + Provider.of<UserProvide>(G.currentContext).userAuthInfo.shareCode;

  static setHistoryData(keywords) {
    /**
     * 1.获取本地存储里面的数据。(searchList)
     * 2.判断本地存储是否有数据
     * 2.1如果有数据：
     *  1.读取本地存储的数据。
     * 2.判断本地存储中有没有当前数据；
     * 3.如果有不做操作
     * 如果没有当前数据，本地存储的数据和当前数据拼接后重新写入。
     * 2.2如果没有数据：
     * 直接把当前数据放在数组中写入到本地存储。
     *
     *
     *  */
    try {
      List searchListData = json.decode(G.getPref(historyKey));
      // print(searchListData);
      var hasData = searchListData.any((v) {
        return v == keywords;
      });
      if (!hasData) {
        searchListData.add(keywords);
        G.setPref(historyKey, json.encode(searchListData));
      }
    } catch (e) {
      List tempList = new List();
      tempList.add(keywords);
      G.setPref(historyKey, json.encode(tempList));
    }
  }
 
  static getHistoryList() {
    try {
      List searchListData = json.decode(G.getPref(historyKey));
      return searchListData;
    } catch (e) {
      return [];
    }
  }
 
  static removeHistoryList() {
    G.removePref(historyKey);
  }
}