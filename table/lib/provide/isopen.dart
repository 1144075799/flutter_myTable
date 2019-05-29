import 'package:flutter/material.dart';

class isOpenProvide with ChangeNotifier{
  bool isopen=false;

  open(){
    isopen=!isopen;
    print(isopen);
    notifyListeners();
  }

}