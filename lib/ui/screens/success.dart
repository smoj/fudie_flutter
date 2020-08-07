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

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final shopProvider = Provider.of<ShopProvider>(context);
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
          title: Text('Success', style: TextStyle(
              fontFamily: primaryFont,
              color: (themeProvider.isLight) ? flatBlack : flatWhite
          ),),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color : themeProvider.isLight ? success : darkThemeElevation4,
                    )
                ),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.17),
                      child: UIDisplay1(text: 'Awesome! Your order  is on the way!', textAlign: TextAlign.center, color: themeProvider.isLight ? Colors.white : flatWhite,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                            offset: Offset(0,4),
                            blurRadius: 26
                        )],
                        color : themeProvider.isLight ? Colors.white : Color.fromRGBO(55, 55, 55, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: UIDisplay1(text: 'Order #48548',),
                          ),
                          Container(
                            height: 51,
                            width: 200,
                            child: Center(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index){
                                    return Container(
                                        width: 51,
                                        height: 51,
                                        margin: EdgeInsets.symmetric(horizontal: 7),
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          image : DecorationImage(
                                              image: NetworkImage(shopProvider.items[index].imageUrl),
                                              fit: BoxFit.fitHeight
                                          ),
                                          color: Colors.red,
                                        )
                                    );
                                  },
                                  itemCount: shopProvider.items.length,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue, vertical: 20),
                            child: Text('Your order has been sent for delivery', textAlign: TextAlign.center, style: TextStyle(
                                color: themeProvider.isLight ? flatBlack : flatWhite,
                                fontFamily: 'Nunito',
                                fontSize: 15,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: UIButton(buttonText: 'Continue', onTap: (){
                    Navigator.of(context).pushNamed('/home');
                  },),
                ),
              )
            ],
          ),
        )
    );
  }
}

