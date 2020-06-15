import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/widgets/extra.dart';
import 'package:fudie_ui_flutter/ui/widgets/quote.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class CardDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final metaFontSize = screenWidth * 0.045;
    final horizontalPadding = screenWidth * 0.045;
    final headingPadding = EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.01);
    return Scaffold(
        backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
        drawer: SideMenuScreen(),
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
          title: Text('Card Detail', style: TextStyle(
              fontFamily: primaryFont,
              color: (themeProvider.isLight) ? flatBlack : flatWhite
          ),),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * ScreenGapValue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Existing Card', textAlign: TextAlign.left, style: TextStyle(
                            color: themeProvider.isLight ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),),
                        SizedBox(height: 10,),
                        UIDisplay2(text: 'MasterCard', color: Colors.red,),
                        SizedBox(height: 30,),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow : [lightFaintShadow],
                              color : themeProvider.isLight ? Color.fromRGBO(255, 255, 255, 1) : darkThemeElevation2,
                            ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                                child: TextField(
    //                              obscureText: true,
                                  style: TextStyle(
                                      color: themeProvider.isLight ? flatBlack : flatWhite
                                  ),
                                  decoration: InputDecoration(
                                      labelText: 'Name on Card',
                                      labelStyle: TextStyle(
                                          color: themeProvider.isLight ? flatBlack : flatWhite
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Master Bradley',
                                      hintStyle: TextStyle(
                                          color: themeProvider.isLight ? flatBlack.withOpacity(0.8) : flatWhite.withOpacity(0.8),
                                          fontFamily: primaryFont,
                                          fontWeight: FontWeight.normal
                                      )
                                  ),
                                )
                            ),
                              Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                                  child: TextField(
    //                              obscureText: true,
                                    style: TextStyle(
                                        color: themeProvider.isLight ? flatBlack : flatWhite
                                    ),
                                    decoration: InputDecoration(
                                        labelText: 'Card Number',
                                        labelStyle: TextStyle(
                                            color: themeProvider.isLight ? flatBlack : flatWhite
                                        ),
                                        border: InputBorder.none,
                                        hintText: '0000 0000 0000 0000',
                                        hintStyle: TextStyle(
                                            color: themeProvider.isLight ? flatBlack.withOpacity(0.8) : flatWhite.withOpacity(0.8),
                                            fontFamily: primaryFont,
                                            fontWeight: FontWeight.normal
                                        )
                                    ),
                                  )
                              ),
                              Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: TextField(
                                        style: TextStyle(
                                            color: themeProvider.isLight ? flatBlack : flatWhite
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'Card Expiry',
                                            labelStyle: TextStyle(
                                                color: themeProvider.isLight ? flatBlack : flatWhite
                                            ),
                                            border: InputBorder.none,
                                            hintText: '3/23',
                                            hintStyle: TextStyle(
                                                color: themeProvider.isLight ? flatBlack.withOpacity(0.8) : flatWhite.withOpacity(0.8),
                                                fontFamily: primaryFont,
                                                fontWeight: FontWeight.normal
                                            )
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        style: TextStyle(
                                            color: themeProvider.isLight ? flatBlack : flatWhite
                                        ),
                                        decoration: InputDecoration(
                                            labelText: 'CVV',
                                            labelStyle: TextStyle(
                                                color: themeProvider.isLight ? flatBlack : flatWhite
                                            ),
                                            border: InputBorder.none,
                                            hintText: '429',
                                            hintStyle: TextStyle(
                                                color: themeProvider.isLight ? flatBlack.withOpacity(0.8) : flatWhite.withOpacity(0.8),
                                                fontFamily: primaryFont,
                                                fontWeight: FontWeight.normal
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        UIButton(buttonText: 'Delete Card'),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: UIButton(buttonText: 'Save Card'),
                ),
              )
            ],
          ),
        )
    );
  }
}

