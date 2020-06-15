import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/widgets/extra.dart';
import 'package:fudie_ui_flutter/ui/widgets/quote.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class CartScreen extends StatelessWidget {

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
          title: Text('Cart', style: TextStyle(
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
                        Text('Thanks for shopping. Here are your', textAlign: TextAlign.left, style: TextStyle(
                            color: themeProvider.isLight ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5
                        ),),
                        SizedBox(height: 10,),
                        UIDisplay2(text: 'Checkout Items', color: Colors.red,),
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
                              FlatButton(
                                  child: UIItenary(),
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    showDialog(context: context, builder: (BuildContext context){
                                      return Container(
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
                                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                                        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.2, horizontal: MediaQuery.of(context).size.width * 0.06),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                width: 51,
                                                height: 51,
                                                decoration: BoxDecoration(
                                                  borderRadius : BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                  ),
                                                  image : DecorationImage(
                                                      image: AssetImage('assets/images/food4.png'),
                                                      fit: BoxFit.fitWidth
                                                  ),
                                                )
                                            ),
                                            SizedBox(height: 25,),
                                            Text('Old Country burger, salad & fries, olives', textAlign: TextAlign.center, style: TextStyle(
                                                color: Color.fromRGBO(18, 18, 18, 1),
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w600,
                                                height: 1
                                            ),),
                                            SizedBox(height: 25,),
                                            UIButton(buttonText: 'Update'),
                                            SizedBox(height: 10,),
                                            UIButton(buttonText: 'Delete',)
                                          ],
                                        ),
                                      );
                                    });
                                  },
                              ),
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
                                    Text('Delivery', textAlign: TextAlign.left, style: TextStyle(
                                        color: themeProvider.isLight ? flatBlack : flatWhite,
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.3333333333333333
                                    ),),
                                    Spacer(),
                                    Text('\$4.99', textAlign: TextAlign.right, style: TextStyle(
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
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text('Vat', textAlign: TextAlign.left, style: TextStyle(
                                        color: themeProvider.isLight ? flatBlack : flatWhite,
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1.3333333333333333
                                    ),),
                                    Spacer(),
                                    Text('\$2.99', textAlign: TextAlign.right, style: TextStyle(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 6),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Payment Method', textAlign: TextAlign.left, style: TextStyle(
                                              color: themeProvider.isLight ? themeProvider.lightTheme.accentColor : themeProvider.darkTheme.accentColor,
                                              fontFamily: 'Nunito',
                                              fontSize: 12,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1.3333333333333333
                                          ),),
                                          SizedBox(height: 8,),
                                          // Figma Flutter Generator 23434Widget - TEXT
                                          Text('Mastercard', textAlign: TextAlign.left, style: TextStyle(
                                              color: themeProvider.isLight ? flatBlack : flatWhite,
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w600,
                                              height: 1
                                          ),),
                                          Text('XXXX XXXX XXXX 3485', textAlign: TextAlign.left, style: TextStyle(
                                              color: themeProvider.isLight ? themeProvider.lightTheme.accentColor : themeProvider.darkTheme.accentColor,
                                              fontFamily: 'Nunito',
                                              fontSize: 12,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1.3333333333333333
                                          ),),
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
                                          Text('\$450', textAlign: TextAlign.left, style: TextStyle(
                                              color: themeProvider.isLight ? flatBlack : flatWhite,
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
                  child: UIButton(buttonText: 'Checkout'),
                ),
              )
            ],
          ),
        )
    );
  }
}

