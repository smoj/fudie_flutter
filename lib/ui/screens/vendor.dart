import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/widgets/extra.dart';
import 'package:fudie_ui_flutter/ui/widgets/quote.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/shop.dart';

class VendorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final metaFontSize = screenWidth * 0.045;
    final horizontalPadding = screenWidth * 0.045;
    final headingPadding = EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.01);
    return Scaffold(
        backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
        appBar: AppBar(
          brightness: Brightness.light,
          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.search, color: (themeProvider.isLight) ? flatBlack : flatWhite,),
//              onPressed: (){
//                Navigator.pushNamed(context, '/search');
//              },
//            )
          FlatButton(
            padding: EdgeInsets.zero,
            child: Switch(
              value: themeProvider.isLight,
              onChanged: (boolVal){
                themeProvider.setTheme(boolVal);
              },
            ),
          )
          ],
          backgroundColor: (themeProvider.isLight) ? Colors.white : Color.fromRGBO(66, 66, 66, 1),
          iconTheme: IconThemeData(
              color: (themeProvider.isLight) ? flatBlack : flatWhite
          ),
          title: Text('Vendor', style: TextStyle(
              fontFamily: primaryFont,
              color: (themeProvider.isLight) ? flatBlack : flatWhite
          ),),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(screenWidth * ScreenGapValue),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryColor,
                              width: 3,
                              style: BorderStyle.solid
                            ),
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color : Color.fromRGBO(196, 196, 196, 1),
                            image : DecorationImage(
                                image: AssetImage('assets/images/food5.png'),
                                fit: BoxFit.fitWidth
                            ),
                          )
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Akure Fried Chicken', overflow: TextOverflow.ellipsis, maxLines: 1, textAlign: TextAlign.left, style: TextStyle(
                                color: themeProvider.isLight ? primaryColor : flatWhite,
                                fontFamily: 'Poppins',
                                fontSize: 19,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1.3333333333333333
                            ),),
                            Text('Gourmet food for the native mind', overflow: TextOverflow.ellipsis, maxLines: 1, textAlign: TextAlign.left, style: TextStyle(
                                color: themeProvider.isLight ? flatBlack: flatWhite,
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: screenWidth * 0.04),
                  child: UITitle(text: 'New Deals', color: themeProvider.isLight ? flatBlack: flatWhite,),
                ),
                UIItemLarge(vendor: 'Naruto Shop', price: 15.99, url: 'http://www.audacitus.com/mobile_app_assets/item-large2.png', description: 'Chilli Soul Food',),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Average Delivery Time', textAlign: TextAlign.center, style: TextStyle(
                              color: themeProvider.isLight ? flatBlack : flatWhite,
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.3333333333333333
                          ),),
                          Text('35 Minutes', textAlign: TextAlign.center, style: TextStyle(
                              color: themeProvider.isLight ? flatBlack : flatWhite,
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.3333333333333333
                          ),)
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Overall Rating', textAlign: TextAlign.center, style: TextStyle(
                              color: themeProvider.isLight ? flatBlack : flatWhite,
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.3333333333333333
                          ),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('3.5', overflow: TextOverflow.ellipsis, maxLines: 1, textAlign: TextAlign.left, style: TextStyle(
                                  color: themeProvider.isLight ? primaryColor : flatWhite,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3333333333333333
                              ),),
                              Icon(Icons.star, color: primaryColor, size: 30,),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue),
                  child: Container(
                      width: 372,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Menu (Continued)', textAlign: TextAlign.left, style: TextStyle(
                                color: themeProvider.isLight ? flatBlack : flatWhite,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w600,
                                height: 1
                            ),),
                          ),
                          Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite.withOpacity(0.5), height: 1,),
                          UIItenary(),
                          Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite.withOpacity(0.5), height: 1,),
                          UIItenary(),
                          Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite.withOpacity(0.5), height: 1,),
                          UIItenary(),
                          Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite.withOpacity(0.5), height: 1,),
                          UIItenary(),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color : themeProvider.isLight ? Colors.white : darkThemeElevation8,
                        border : Border.all(
                          color: themeProvider.isLight ? Color.fromRGBO(223, 230, 233, 1) :  Color.fromRGBO(223, 230, 233, 0),
                          width: 1,
                        ),
                      )
                  ),
                )
              ],
            ),
          )
        )
    );
  }
}

