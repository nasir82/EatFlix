import 'package:flutter/material.dart';
import 'package:play/themes/dark_mode.dart';
import 'package:play/themes/light_mood.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themdata = lightMode;
  ThemeData get themeData => _themdata;
  bool get isDarkMode => _themdata == darkmode;

  set themedata(ThemeData themeData){
    _themdata = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themdata == lightMode){
      _themdata = darkmode;

    }else{
      _themdata = lightMode;
    }
     notifyListeners();
  }
  
}