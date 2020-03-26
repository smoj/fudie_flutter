import 'package:flutter/material.dart';

class UITitle extends StatelessWidget {
  final String text;
  final Color color;

  UITitle({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(
        fontFamily: 'Poppins',
        height: 0.8,
        color: this.color != null ? this.color : Colors.black,
        fontSize: MediaQuery.of(context).size.width * 0.06
    ),);
  }
}
