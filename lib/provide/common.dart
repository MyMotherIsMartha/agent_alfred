import 'package:agent37_flutter/components/v-loading.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/global.dart';

class CommonProvide with ChangeNotifier {
  bool isLoadingShow = false;

  

  toggleLoadingWindow(bool loadingStatus, context){
    print('isLoadingShow: ');
    print(isLoadingShow);
    print('loadingStatus: ');
    print(loadingStatus);
    if (loadingStatus && !isLoadingShow) {
      isLoadingShow = loadingStatus;
      showDialog(
        barrierDismissible: false,
        context: G.currentContext,
        builder: (BuildContext context) {
          return Center(child: VLoading());
        });
    } else if (!loadingStatus && isLoadingShow) {
      isLoadingShow = loadingStatus;
      Navigator.of(context, rootNavigator: true).pop();
    }
    // notifyListeners();
  }
}