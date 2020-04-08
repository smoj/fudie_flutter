import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/theme_meta.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UITag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Text('Breakfast', style: TextStyle(
          color: Colors.white,
          fontFamily: 'Nunito',
          fontSize: MediaQuery.of(context).size.width * 0.045
      ),),
    );
  }
}
