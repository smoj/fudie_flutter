import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/theme_meta.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class UIItenary extends StatefulWidget {
  @override
  _UIItenaryState createState() => _UIItenaryState();
}

class _UIItenaryState extends State<UIItenary> {
  int itemCount;
  double price;
  double totalPrice;
  int maxCount;
  double discount;
  double discountedPrice;
  String itemName;

  void initState(){
    super.initState();
    itemCount = 1;
    price = 4.99;
    maxCount = 10;
    discount = 0.50;
    discountedPrice = price * discount;
    updatePrice(itemCount, price);
  }

  updatePrice(int itemCount, double price){
    setState(() {
      totalPrice = double.parse((price * itemCount).toStringAsFixed(2));
    });
  }

  adjustCount(bool increment){
    itemCount = increment ? itemCount+1 : itemCount-1;
    if(itemCount < 1){
      itemCount = 0;
    }
    if(itemCount >= maxCount){
      itemCount = maxCount;
    }
    updatePrice(itemCount, price);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
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
                    image: NetworkImage('http://www.audacitus.com/mobile_app_assets/item-medium.png'),
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
                  Text('Sausage Brunch', textAlign: TextAlign.left, style: TextStyle(
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
                Text('\$58.00', textAlign: TextAlign.right, style: TextStyle(
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
                        return;
                      },
                      child: Icon(Icons.remove_circle_outline, color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite,),
                    ),
                    SizedBox(width: 7,),
                    UITitle(text: '3', color: Colors.grey.shade700,),
                    SizedBox(width: 7,),
                    GestureDetector(
                      onTap:() {
                        return;
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
    );
  }
}
