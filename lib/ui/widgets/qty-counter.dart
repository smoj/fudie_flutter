import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class QtyCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [lightFaintShadow],
              borderRadius: BorderRadius.circular(5)
            ),
            child: Icon(Icons.add),
          ),
        ),
        UITitle(text: '3',),
        FlatButton(
          padding: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [lightFaintShadow],
                borderRadius: BorderRadius.circular(5)
            ),
            child: Icon(Icons.line_style),
          ),
        )
      ],
    );
  }
}
