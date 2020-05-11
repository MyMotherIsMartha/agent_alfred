import 'package:flutter/material.dart';

class CommonProvide with ChangeNotifier{
  bool isLoadingShow = false;

  toggleLoadingWindow(bool loadingStatus){
    isLoadingShow = loadingStatus;
    notifyListeners();
  }
}