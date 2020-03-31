import 'package:flutter/material.dart';

class UIDisplay2 extends StatelessWidget {
  final String text;
  final Color color;

  UIDisplay2({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        height: 0.8,
        color: this.color != null ? this.color : Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.10
    ),);
  }
}
