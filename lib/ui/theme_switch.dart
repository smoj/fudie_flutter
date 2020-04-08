import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'theme_meta.dart';

class ThemeProvider with ChangeNotifier {
  bool isLight;

  final lightTheme = AppTheme(
    scaffoldBackground: Color.fromRGBO(246, 245, 250, 1),
    textColor: flatBlack,
    textBrandColor: primaryColor
  );

  final darkTheme = AppTheme(
    scaffoldBackground: flatBlack,
    textColor: flatWhite
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