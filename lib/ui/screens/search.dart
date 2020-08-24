import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter, color: (themeProvider.isLight) ? flatBlack : flatWhite,),
            onPressed: (){
              Navigator.pushNamed(context, '/cart');
            },
          ),
          Switch(
            value: themeProvider.isLight,
            onChanged: (boolVal){
              themeProvider.setTheme(boolVal);
            },
          )
        ],
        backgroundColor: (themeProvider.isLight) ? Colors.white : Color.fromRGBO(66, 66, 66, 1),
        iconTheme: IconThemeData(
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),
        title: Text('Search', style: TextStyle(
            fontFamily: primaryFont,
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),),
      ),
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * ScreenGapValue),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [lightFaintShadow]
                              ),
                              child: TextField(
//                        controller: TextEditingController(text: ''),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: 'Nunito'
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'What do you want to order?',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                      fontFamily: 'Nunito',
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/detail-search-breakfast.png'),
                                fit: BoxFit.fill
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Breakfast', textAlign: TextAlign.center, style: bodyRegularText.copyWith(
                          color: themeProvider.isLight ? flatBlack : flatWhite
                        ),),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/detail-search-lunch.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Lunch', textAlign: TextAlign.center, style: bodyRegularText.copyWith(
                            color: themeProvider.isLight ? flatBlack : flatWhite
                        ),),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/detail-search-dinner.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Dinner', textAlign: TextAlign.center, style: bodyRegularText.copyWith(
                            color: themeProvider.isLight ? flatBlack : flatWhite
                        ),),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Search Results", style: TextStyle(
                          color: themeProvider.isLight ? flatBlack : flatWhite,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,),
                        ),
                      ),
                      Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



