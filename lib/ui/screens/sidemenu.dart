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
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: darkThemeElevation6.withOpacity(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Hello,', textAlign: TextAlign.left, style: TextStyle(
                            color: flatWhite,
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.w300
                        ),),
                        Text('Elizabeth Aldezan', maxLines: 2, overflow: TextOverflow.fade, style: TextStyle(
                          color: flatWhite,
                          fontFamily: primaryFont,
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 0)
                  ),
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
                        inactiveTrackColor: Colors.grey,
                      ),
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                      title: Text('Cart Items', style: TextStyle(
                          color: flatWhite,
                          fontWeight: FontWeight.w600,
                          fontFamily: primaryFont,
                          fontSize: 18
                      ),),
                      onTap: (){
                        Navigator.pushNamed(context, '/cart');
                      },
                      leading: Icon(Icons.shopping_cart, color: flatWhite,),
                      trailing: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          width: 30,
                          height: 30,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle
                            ),
                            child: Text('89', textAlign: TextAlign.center, style: TextStyle(
                                color: flatWhite,
                                fontSize: 15,
                                fontFamily: secondaryFont,
                                fontWeight: FontWeight.normal
                            )),
                          ))
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
