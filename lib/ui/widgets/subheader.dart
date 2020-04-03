import 'package:flutter/material.dart';

class UISubHeader extends StatelessWidget {
  final String text;
  final Color color;

  UISubHeader({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(
        fontFamily: 'Poppins',
        height: 0.8,
        fontWeight: FontWeight.w600,
        color: this.color != null ? this.color : Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.05
    ),);
  }
}
