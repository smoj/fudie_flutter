import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIDisplay1 extends StatelessWidget {
  final String text;
  final Color color;
  TextAlign textAlign;

  UIDisplay1({this.text, this.color, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(this.text, textAlign: this.textAlign, style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        height: 1,
        color: this.color != null ? this.color : (themeProvider.isLight) ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
        fontSize: MediaQuery.of(context).size.width * 0.07
    ),);
  }
}
