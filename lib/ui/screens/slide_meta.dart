import 'package:flutter/cupertino.dart';

class SlideMeta {
  String title;
  String message;
  Color backgroundColor;
  String backgroundImage;
  Color textColor;
  IconData iconType;

  SlideMeta(
      {
        this.title,
        this.message,
        this.backgroundColor,
        this.backgroundImage,
        this.textColor,
        this.iconType
      });

  SlideMeta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    backgroundColor = json['backgroundColor'];
    backgroundImage = json['backgroundImage'];
    textColor = json['textColor'];
    iconType = json['iconType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['backgroundColor'] = this.backgroundColor;
    data['backgroundImage'] = this.backgroundImage;
    data['textColor'] = this.textColor;
    data['iconType'] = this.iconType;
    return data;
  }
}
