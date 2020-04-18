import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIExtra extends StatefulWidget {
  @override
  _UIExtraState createState() => _UIExtraState();
}

class _UIExtraState extends State<UIExtra> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var backgroundColor = themeProvider.isLight ? Colors.white : darkThemeElevation8;
    return Expanded(
      child: GestureDetector(
        onTap: (){
          print('toggle');
          setState(() {
            backgroundColor = Colors.red;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Extras', style: TextStyle(
                      color: themeProvider.isLight ? flatBlack : flatWhite,
                      fontFamily: primaryFont,
                      fontSize: MediaQuery.of(context).size.width * 0.035
                  ),),
                  Spacer(),
                  Icon(Icons.check, color: themeProvider.isLight ? flatBlack : flatWhite, size: 15,)
                ],
              ),
              Text('Extras', style: TextStyle(
                  color: themeProvider.isLight ? flatBlack : flatWhite,
                  fontFamily: primaryFont,
                  fontSize: MediaQuery.of(context).size.width * 0.05
              ),),
              Text('2.99', style: TextStyle(
                  color: themeProvider.isLight ? flatBlack : flatWhite,
                  fontFamily: primaryFont,
                  fontSize: MediaQuery.of(context).size.width * 0.035
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

