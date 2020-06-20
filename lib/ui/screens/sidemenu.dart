import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class SideMenuScreen extends StatelessWidget {

  String _ThemeText(boolVal){
    return boolVal ? 'Light Theme' : 'Dark Theme';
  }

  @override
  Widget build(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        color: flatBlack,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Hello,', style: TextStyle(
                            color: flatWhite,
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.w300
                        ),),
                        Text('Elizabeth', maxLines: 2, overflow: TextOverflow.fade, style: TextStyle(
                          color: flatWhite,
                          fontFamily: primaryFont,
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w600,
                        ),),
                        Text('Hurley', maxLines: 2, overflow: TextOverflow.fade, style: TextStyle(
                          color: flatWhite,
                          fontFamily: primaryFont,
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                  ],
                )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
              color: darkThemeElevation6.withOpacity(0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                      title: Text(_ThemeText(themeProvider.isLight), style: TextStyle(
                          color: flatWhite,
                          fontWeight: FontWeight.w600,
                          fontFamily: primaryFont,
                          fontSize: 18
                      ),),
                      onTap: (){
                        themeProvider.setTheme(!themeProvider.isLight);
                      },
                      leading: Icon(Icons.settings_brightness, color: flatWhite,),
                      trailing: Switch(
                        value: themeProvider.isLight,
                        onChanged: (boolVal){
                          themeProvider.setTheme(boolVal);
                        },
                      ),
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
//                  ListTile(
//                      title: Text('Cart Items', style: TextStyle(
//                          color: flatWhite,
//                          fontWeight: FontWeight.w600,
//                          fontFamily: primaryFont,
//                          fontSize: 18
//                      ),),
//                      onTap: (){
////                        Navigator.pushNamed(context, '/favourite');
//                      },
//                      leading: Icon(Icons.favorite, color: flatWhite,),
//                      trailing: Container(
//                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
//                          width: 30,
//                          height: 30,
//                          child: Container(
//                            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
//                            decoration: BoxDecoration(
//                                color: Colors.red,
//                                borderRadius: BorderRadius.circular(90)
//                            ),
//                            child: Text('89', textAlign: TextAlign.center, style: TextStyle(
//                                color: flatWhite,
//                                fontSize: 15,
//                                fontFamily: primaryFont,
//                                fontWeight: FontWeight.w600
//                            )),
//                          ))
//                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
