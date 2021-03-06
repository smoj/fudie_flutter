import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/widgets/extra.dart';
import 'package:fudie_ui_flutter/ui/widgets/quote.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class OrderDetailScreen extends StatelessWidget {
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
          title: Text('Order Detail', style: TextStyle(
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
                        Text('Here???s what you bought for', textAlign: TextAlign.left, style: TextStyle(
                            color: themeProvider.isLight ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),),
                        SizedBox(height: 10,),
                        UIDisplay2(text: 'Order #45334', color: Colors.red,),
                        SizedBox(height: 30,),
                        // Figma Flutter Generator Rectangle37Widget - RECTANGLE
                        Container(
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow : [BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                                  offset: Offset(0,4),
                                  blurRadius: 26
                              )],
                              color : themeProvider.isLight ? Color.fromRGBO(255, 255, 255, 1) : darkThemeElevation2,
                            ),
                          child: Column(
                            children: <Widget>[
                              UIItenary(),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                              ),
                              UIItenary(),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                              ),
                              UIItenary(),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text('Sub Total', textAlign: TextAlign.left, style: TextStyle(
                                        color: themeProvider.isLight ? flatBlack : flatWhite,
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.3333333333333333
                                    ),),
                                    Spacer(),
                                    Text('5% or \$10', textAlign: TextAlign.right, style: TextStyle(
                                        color: themeProvider.isLight ? flatBlack : flatWhite,
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w600,
                                        height: 1
                                    ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 6),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Grand Total', textAlign: TextAlign.left, style: TextStyle(
                                              color: themeProvider.isLight ? themeProvider.lightTheme.accentColor : themeProvider.darkTheme.accentColor,
                                              fontFamily: 'Nunito',
                                              fontSize: 12,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1.3333333333333333
                                          ),),
                                          SizedBox(height: 8,),
                                          // Figma Flutter Generator 23434Widget - TEXT
                                          Text('\$234.34', textAlign: TextAlign.left, style: TextStyle(
                                              color: Color.fromRGBO(18, 18, 18, 1),
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w600,
                                              height: 1
                                          ),)
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 6),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text('Date of order', textAlign: TextAlign.left, style: TextStyle(
                                              color: themeProvider.isLight ? themeProvider.lightTheme.accentColor : themeProvider.darkTheme.accentColor,
                                              fontFamily: 'Nunito',
                                              fontSize: 12,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1.3333333333333333
                                          ),),
                                          SizedBox(height: 8,),
                                          // Figma Flutter Generator 23434Widget - TEXT
                                          Text('13 Jan 2020', textAlign: TextAlign.left, style: TextStyle(
                                              color: Color.fromRGBO(18, 18, 18, 1),
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w600,
                                              height: 1
                                          ),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                  padding: const EdgeInsets.all(16.0),
                  child: UIButton(buttonText: 'Order', price: '\$349.99',),
                ),
              )
            ],
          ),
        )
    );
  }
}

