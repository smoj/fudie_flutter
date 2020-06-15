import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UICardItem extends StatelessWidget {
  final String vendor;
  final String logo;

  UICardItem({this.vendor, this.logo});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 46,
                      height: 24,
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/$logo'),
                              fit: BoxFit.fitHeight
                          )
                      ),
                    ),
                    Text(this.vendor, textAlign: TextAlign.right, style: TextStyle(
                        color: themeProvider.isLight ? flatBlack : flatWhite,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w600,
                        height: 1
                    ),),
                  ],
                ),
                SizedBox(height: 4,),
                Text('XXXX XXXX XXXX 3485', textAlign: TextAlign.left, style: TextStyle(
                    color: themeProvider.isLight ? flatBlack : flatWhite,
                    fontFamily: 'Nunito',
                    fontSize: 12,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.3333333333333333
                ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
