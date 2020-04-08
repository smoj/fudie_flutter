import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'theme_meta.dart';

var primaryColor = Colors.red;
var accentColor = Colors.yellow;
var flatBlack = Color.fromRGBO(18, 18, 18, 1);
var flatWhite = Color.fromRGBO(223, 230, 233, 1);

var lightFaintShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    offset: Offset(0,0),
    spreadRadius: 4,
    blurRadius: 4
);

var ScreenGapValue = 0.07;

var primaryFont = 'Poppins';
var secondaryFont = 'Nunito';

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