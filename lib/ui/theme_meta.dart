import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  Color scaffoldBackground;
  Color textColor;
  Color textBrandColor;
  Color accentColor;

  AppTheme({this.scaffoldBackground, this.textColor, this.textBrandColor, this.accentColor});

  AppTheme.fromJson(Map<String, dynamic> json) {
    scaffoldBackground = json['scaffoldBackground'];
    textColor = json['textColor'];
    textBrandColor = json['textBrandColor'];
    accentColor = json['accentColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scaffoldBackground'] = this.scaffoldBackground;
    data['textColor'] = this.textColor;
    data['textBrandColor'] = this.textBrandColor;
    data['accentColor'] = this.accentColor;
    return data;
  }
}
