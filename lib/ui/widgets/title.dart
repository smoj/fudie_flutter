import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UITitle extends StatelessWidget {
  final String text;
  final Color color;
  final double height;

  UITitle({this.text, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Text(this.text, overflow: TextOverflow.fade, style: TextStyle(
        fontFamily: 'Poppins',
        height: (this.height != null) ? this.height : 0.8,
        fontWeight: FontWeight.w600,
        color: this.color != null ? this.color : (themeProvider.isLight) ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
        fontSize: MediaQuery.of(context).size.width * 0.06
    ),);
  }
}
