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

class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String itemKey;

  int itemCount;

  double price;

  double totalPrice;

  int maxCount = 10;

  double discount;

  double discountedPrice;

  String itemName;

  String thumbnail;

  updatePrice(String itemKey, int itemCount, double price){
    totalPrice = double.parse((price * itemCount).toStringAsFixed(2));
    Provider.of<ShopProvider>(context).updateItem(itemKey, itemCount);
  }

  adjustCount(bool increment, int qty, double subTotal, String itemKey){
    print('adjustCount($increment): itemCount is:'+qty.toString());
    qty = increment ? qty+1 : qty-1;
    if(qty < 1){
      qty = 1;
    }
    if(qty > maxCount){
      qty = maxCount;
    }
    updatePrice(itemKey, qty, subTotal);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final metaFontSize = screenWidth * 0.045;
    final horizontalPadding = screenWidth * 0.045;
    final headingPadding = EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.01);
    final shopProvider = Provider.of<ShopProvider>(context);
    print('Cart Details: '+shopProvider.items.toString());
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
                        Text('Thanks for ordering. Here are your', textAlign: TextAlign.left, style: TextStyle(
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
                        Container(
                          height: screenHeight * 0.6,
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
                          child: (shopProvider.items.length > 0) ? ListView.builder(
                            itemBuilder: (_, int index)=>GestureDetector(
                              onTap: (){
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          FlatButton(
                                            child: Text('Delete'),
                                            onPressed: (){
                                              shopProvider.removeFromCart(shopProvider.items[index].itemKey);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical:0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 12,),
                                    Row(
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
                                                  image: NetworkImage(shopProvider.items[index].imageUrl),
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
                                                Text(shopProvider.items[index].itemName.toString(), textAlign: TextAlign.left, style: TextStyle(
                                                    color: themeProvider.isLight ? flatBlack : flatWhite,
                                                    fontFamily: 'Nunito',
                                                    fontSize: 15,
                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.normal,
                                                    height: 1.3333333333333333
                                                ),)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Text('\$'+shopProvider.items[index].totalPrice.toString(), maxLines: 1, textAlign: TextAlign.right, style: TextStyle(
                                                  color: themeProvider.isLight ? flatBlack : flatWhite,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1
                                              ),),
                                              SizedBox(height: 7,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap:() {
                                                      adjustCount(false, shopProvider.items[index].quantity, shopProvider.items[index].totalPrice, shopProvider.items[index].itemKey);
                                                    },
                                                    child: Icon(Icons.remove_circle_outline, color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite,),
                                                  ),
                                                  SizedBox(width: 7,),
                                                  Text(shopProvider.items[index].quantity.toString(), style: bodyRegularText.copyWith(
                                                    fontSize: MediaQuery.of(context).size.width * 0.06,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.3,
                                                    color: themeProvider.isLight ? flatBlack : flatWhite
                                                  ),),
                                                  SizedBox(width: 7,),
                                                  GestureDetector(
                                                    onTap:() {
                                                      adjustCount(true, shopProvider.items[index].quantity, shopProvider.items[index].totalPrice, shopProvider.items[index].itemKey);
                                                    },
                                                    child: Icon(Icons.add_circle_outline, color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite,),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12,),
                                    Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: shopProvider.items.length,
                          ) : Column(
                            children: <Widget>[
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add_shopping_cart, color: themeProvider.isLight ? flatBlack : flatWhite, size: screenWidth * 0.15,),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Cart is empty', style: bodyRegularText.copyWith(
                                      color: themeProvider.isLight ? flatBlack : flatWhite,
                                      fontSize: screenWidth * 0.085,
                                      fontWeight: FontWeight.w600
                                  ),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Select anything you like and click 'order'", textAlign: TextAlign.center, maxLines: 3, overflow: TextOverflow.fade, style: bodyRegularText.copyWith(
                                          color: themeProvider.isLight ? flatBlack : flatWhite,
                                          fontSize: screenWidth * 0.05
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                              Spacer()
                            ],
                          )
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
                  child: (shopProvider.items.length > 0) ? UIButton(buttonText: 'Pay', price: '\$'+shopProvider.sum.totalPrice.toString(), onTap: (){
                    Navigator.of(context).pushNamed('/success');
                  },) : UIButton(buttonText: 'Go Back', onTap: (){
                    Navigator.of(context).pop();
                  },),
                ),
              )
            ],
          ),
        )
    );
  }
}

