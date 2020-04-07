import 'package:flutter/cupertino.dart';

class AppTheme {
  Color primaryColor;
  Color accentColor;
  Color flatBlack;
  Color flatLight;
  Color success;
  String brandGradientHorizontal;
  String brandGradientVertical;

  AppTheme(
      {this.primaryColor,
        this.accentColor,
        this.flatBlack,
        this.flatLight,
        this.success,
        this.brandGradientHorizontal,
        this.brandGradientVertical});

  AppTheme.fromJson(Map<String, dynamic> json) {
    primaryColor = json['primaryColor'];
    accentColor = json['accentColor'];
    flatBlack = json['flatBlack'];
    flatLight = json['flatLight'];
    success = json['success'];
    brandGradientHorizontal = json['brandGradientHorizontal'];
    brandGradientVertical = json['brandGradientVertical'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primaryColor'] = this.primaryColor;
    data['accentColor'] = this.accentColor;
    data['flatBlack'] = this.flatBlack;
    data['flatLight'] = this.flatLight;
    data['success'] = this.success;
    data['brandGradientHorizontal'] = this.brandGradientHorizontal;
    data['brandGradientVertical'] = this.brandGradientVertical;
    return data;
  }
}
