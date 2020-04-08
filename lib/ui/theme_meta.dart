import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class AppTheme {
  Color scaffoldBackground;
  Color textColor;
  Color textBrandColor;

  AppTheme({this.scaffoldBackground, this.textColor, this.textBrandColor});

  AppTheme.fromJson(Map<String, dynamic> json) {
    scaffoldBackground = json['scaffoldBackground'];
    textColor = json['textColor'];
    textBrandColor = json['textBrandColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scaffoldBackground'] = this.scaffoldBackground;
    data['textColor'] = this.textColor;
    data['textBrandColor'] = this.textBrandColor;
    return data;
  }
}
