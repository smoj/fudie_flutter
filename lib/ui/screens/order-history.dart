import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/shop.dart';

class OrderHistory extends StatelessWidget {

  List<Item> orderList = [
    Item(
        itemKey: 'DLX234',
        imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail.png',
        quantity: 1,
        price: 4.99,
        totalPrice: 4.99,
        itemName: 'Heavenly Burgers'
    ),
    Item(
        itemKey: 'DLX873',
        imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail2.png',
        quantity: 1,
        price: 14.99,
        totalPrice: 4.99,
        itemName: 'Scotch Bread'
    ),
    Item(
      imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail3.png',
      quantity: 1,
      price: 4.99,
      totalPrice: 4.99,
      itemName: 'Pizza',
      itemKey: 'DLX159',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.filter, color: (themeProvider.isLight) ? flatBlack : flatWhite,),
//            onPressed: (){
//              Navigator.pushNamed(context, '/cart');
//            },
//          ),
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
        title: Text('History', style: TextStyle(
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
                                  color: themeProvider.isLight ? Colors.white : darkThemeElevation8,
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
                                    hintText: 'Search History...',
                                    hintStyle: TextStyle(
                                      color: themeProvider.isLight ? Color.fromRGBO(0, 0, 0, 0.5) : flatWhite,
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
                SizedBox(height: 30,),
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Last 7 Days", style: TextStyle(
                          color: themeProvider.isLight ? flatBlack : flatWhite,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,),
                        ),
                      ),
                      Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, int index)=>GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed("/detail", arguments: orderList[index]);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              UIItenary(
                                imageUrl: orderList[index].imageUrl,
                                price: orderList[index].price,
                                name: orderList[index].itemName,
                              ),
                              Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                            ],
                          ),
                        ),
                        itemCount: orderList.length,
                      ),
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



