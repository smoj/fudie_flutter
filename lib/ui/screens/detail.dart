import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/widgets/extra.dart';
import 'package:fudie_ui_flutter/ui/widgets/quote.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final metaFontSize = MediaQuery.of(context).size.width * 0.045;
    final horizontalPadding = MediaQuery.of(context).size.width * 0.045;
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
          title: Text('Home', style: TextStyle(
              fontFamily: primaryFont,
              color: (themeProvider.isLight) ? flatBlack : flatWhite
          ),),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.grey.shade800,
                    constraints: BoxConstraints(
                        minHeight: 300
                    ),
                    height: 300,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: TransitionToImage(
                              image: AdvancedNetworkImage(
                                'https://i.picsum.photos/id/384/300/300.jpg',
                                loadedCallback: () => print('Network Image loaded.'),
                                loadFailedCallback: () => print('Oh, no! Image failed! Timeout and Retry limit exceeded'),
                                timeoutDuration: Duration(seconds: 60),
                                retryLimit: 2,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment(0,0.1),
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.5)]
                                )
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.9,-0.87),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            padding: EdgeInsets.fromLTRB(18, 9, 18, 8),
                            child: Text('Available', style: TextStyle(
                              fontSize: metaFontSize,
                              height: 1
                            ),),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.9,-0.87),
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: 100
                            ),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            padding: EdgeInsets.fromLTRB(18, 9, 18, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.star_border, color: Colors.white, size: metaFontSize,),
                                Icon(Icons.star_border, color: Colors.white, size: metaFontSize,),
                                Icon(Icons.star, color: Colors.white, size: metaFontSize,),
                                Icon(Icons.star, color: Colors.white, size: metaFontSize,),
                                Icon(Icons.star, color: Colors.white, size: metaFontSize,),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.7,0.8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text('BBQ Ribs in Mushroom gravy', maxLines: 3, textAlign: TextAlign.left, style: TextStyle(
                              color: Colors.white,
                              fontFamily: primaryFont,
                              fontWeight: FontWeight.w900,
                              fontSize: MediaQuery.of(context).size.width * 0.065
                            ),),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.7,0.8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('4.99', maxLines: 3, textAlign: TextAlign.right, style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: secondaryFont,
                                    height: 1,
                                    fontSize: MediaQuery.of(context).size.width * 0.05
                                ),),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('4.99', maxLines: 3, textAlign: TextAlign.right, style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w900,
                                    height: 1,
                                    fontSize: MediaQuery.of(context).size.width * 0.065
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.03,
                    decoration: BoxDecoration(
                      gradient: brandGradientHorizontal
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: MediaQuery.of(context).size.width * 0.065),
                    color: (themeProvider.isLight) ? Colors.white : darkThemeElevation16,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              UICaption(text: 'Average Delivery Time',),
                              SizedBox(
                                height: 10,
                              ),
                              UIHeadline(text: '35 Minutes',)
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap:() {},
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: themeProvider.isLight ? Colors.white : darkThemeElevation8,
                                          boxShadow: [lightFaintShadow],
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Icon(Icons.add_circle_outline, color: themeProvider.isLight ? flatBlack : flatWhite,),
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  UITitle(text: '33',),
                                  SizedBox(width: 20,),
                                  GestureDetector(
                                    onTap:() {},
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: themeProvider.isLight ? Colors.white : darkThemeElevation8,
                                          boxShadow: [lightFaintShadow],
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Icon(Icons.remove_circle_outline, color: themeProvider.isLight ? flatBlack : flatWhite,),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.045, vertical: MediaQuery.of(context).size.width * 0.065),
                    child: Text('Minim irure fugiat aliqua velit Lorem esse sunt aliquip. Lorem occaecat culpa amet eu consequat nostrud cillum ipsum ut Lorem veniam laborum. Occaecat nisi labore in ea', style: TextStyle(
                      fontFamily: secondaryFont,
                      color: themeProvider.isLight ? flatBlack : flatWhite,
                      height: 1.5
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: UITitle(text: 'Extras',),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.045, vertical: MediaQuery.of(context).size.width * 0.065),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        UIExtra(),
                        SizedBox(width: 10,),
                        UIExtra(),
                        SizedBox(width: 10,),
                        UIExtra(),
                      ],
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}

