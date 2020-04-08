import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UISubHeader extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;

  UISubHeader({this.text, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(this.text, style: TextStyle(
        fontFamily: 'Poppins',
        height: 0.8,
        fontWeight: this.weight != null ? this.weight : FontWeight.normal,
        color: this.color != null ? this.color : (themeProvider.isLight) ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
        fontSize: MediaQuery.of(context).size.width * 0.05
    ),);
  }
}
