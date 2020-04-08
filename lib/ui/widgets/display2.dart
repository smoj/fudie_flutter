import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIDisplay2 extends StatelessWidget {
  final String text;
  final Color color;

  UIDisplay2({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(this.text, style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        height: 0.8,
        color: this.color != null ? this.color : (themeProvider.isLight) ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
        fontSize: MediaQuery.of(context).size.width * 0.10
    ),);
  }
}
