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

  List<Order> orderList = [
    Order(
        orderKey: 'DLX234',
        imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail.png',
        totalPrice: 20.99,
        orderName: 'Order #3353',
        items: [
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
        ]
    ),
    Order(
        orderKey: 'DLX453',
        imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail3.jpg',
        totalPrice: 16.39,
        orderName: 'Order #3423',
        items: [
          Item(
              itemKey: 'DLX873',
              imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail2.png',
              quantity: 1,
              price: 14.99,
              totalPrice: 4.99,
              itemName: 'Scotch Bread'
          ),
          Item(
              itemKey: 'DLX234',
              imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail.png',
              quantity: 1,
              price: 4.99,
              totalPrice: 4.99,
              itemName: 'Heavenly Burgers'
          ),
        ]
    ),
    Order(
        orderKey: 'DLX234',
        imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail2.jpg',
        totalPrice: 20.99,
        orderName: 'Order #2476',
        items: [
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
        ]
    ),
  ];

  String showItems(List<Item> items) {
    if (items != null && items.length > 0) {
      Item text = items.reduce((Item curr, Item next) {
        return Item(
            itemName: curr.itemName + ', ' + next.itemName
        );
      });
      return text.itemName;
    }
    else {
      return '-';
    }
  }
  
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
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width: 56,
                                        height: 56,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          image : DecorationImage(
                                              image: NetworkImage(orderList[index].imageUrl),
                                              fit: BoxFit.fill
                                          ),
                                        )
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(orderList[index].orderName, style: bodyRegularText.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: themeProvider.isLight ? flatBlack : flatWhite,
                                              fontSize: 18,
                                            ),),
                                            Text(showItems(orderList[index].items), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: TextStyle(
                                                color: themeProvider.isLight ? flatBlack.withOpacity(0.8) : flatWhite,
                                                fontFamily: 'Nunito',
                                                fontSize: 13,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.3333333333333333
                                            ),)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text('\$'+orderList[index].totalPrice.toString(), textAlign: TextAlign.right, style: TextStyle(
                                            color: themeProvider.isLight ? flatBlack : flatWhite,
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w600,
                                            height: 1
                                        ),),
//                                        Text((this.discount == 0) ? '' : (this.discount * 100).toString() + '% Discount', textAlign: TextAlign.right, style: TextStyle(
//                                            color: themeProvider.isLight ? primaryColor : accentColor,
//                                            fontFamily: 'Nunito',
//                                            fontSize: 12,
//                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                                            fontWeight: FontWeight.normal,
//                                            height: 1.3333333333333333
//                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
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



