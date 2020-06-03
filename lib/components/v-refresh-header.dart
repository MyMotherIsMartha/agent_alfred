import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

Header vRefreshHeader = ClassicalHeader(
    refreshText: '下拉刷新',
    refreshReadyText: '释放以刷新',
    refreshingText: '刷新中……',
    refreshedText: '刷新完成',
    infoText: '更新于 %T');

Footer vRefreshFooter = MaterialFooter();
// ClassicalFooter(
//     loadingText: '加载中',
//     loadReadyText: '上拉加载',
//     loadedText: '加载成功',
//     noMoreText: '已加载全部',
//     infoText: '更新于 %T');
