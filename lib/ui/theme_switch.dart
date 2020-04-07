import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'theme_meta.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight;

  final lightTheme = AppTheme(
    primaryColor: Color.fromRGBO(215, 41, 41, 1),
    accentColor: Color.fromRGBO(255, 221, 161, 1),
    flatBlack: Color.fromRGBO(18, 18, 18, 1),
  );

  final darkTheme = AppTheme(
    primaryColor: Color.fromRGBO(0, 0, 0, 1),
    accentColor: Color.fromRGBO(255, 221, 161, 1),
    flatBlack: Color.fromRGBO(18, 18, 18, 1),
  );

  ThemeProvider({this.isLight});

  get getTheme => isLight ? lightTheme : darkTheme;

  setTheme(bool val){
    if(val){
      isLight = true;
    }
    else{
      isLight = false;
    }
    notifyListeners();
  }
}