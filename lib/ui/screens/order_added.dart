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

class OrderAddedScreen extends StatelessWidget {

  Item item;

  OrderAddedScreen(this.item);

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
          title: Text('Order Placed', style: TextStyle(
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
                      color : themeProvider.isLight ? primaryColor.shade400 : darkThemeElevation4,
                    )
                ),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: UIDisplay1(text: 'Your order  has been added!', textAlign: TextAlign.center, color: themeProvider.isLight ? Colors.white : flatWhite,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
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
                        children: <Widget>[
                          TransitionToImage(
                            image: AdvancedNetworkImage(
                              this.item.imageUrl,
                              loadedCallback: () => print('Network Image loaded.'),
                              loadFailedCallback: () => print('Oh, no! Image failed! Timeout and Retry limit exceeded'),
                              timeoutDuration: Duration(seconds: 60),
                              retryLimit: 2,
                            ),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20,),
                          Text(this.item.itemName, maxLines: 3, textAlign: TextAlign.left, style: TextStyle(
                              color: themeProvider.isLight ? flatBlack : flatWhite,
                              fontFamily: primaryFont,
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                          ),)
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
                  child: UIButton(buttonText: 'Continue Shopping', onTap: (){
                    Navigator.of(context).pushReplacementNamed('/home');
                  },),
                ),
              )
            ],
          ),
        )
    );
  }
}

