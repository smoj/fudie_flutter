import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/theme_meta.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/shop.dart';

class UIItenary extends StatelessWidget {

  String itemKey;
  int itemCount;
  double price;
  double totalPrice;
  int maxCount = 10;
  double discount;
  double discountedPrice;
  String itemName;
  String thumbnail;

  UIItenary({@required this.itemKey, this.itemCount, this.price, this.maxCount, this.discountedPrice, this.itemName, this.thumbnail, this.totalPrice});

  updatePrice(int itemCount, double price){
      totalPrice = double.parse((price * itemCount).toStringAsFixed(2));
//    Provider.of<ShopProvider>(context, listen: false).updateItem(itemKey, itemCount);
  }

  adjustCount(bool increment){
    print('adjustCount($increment): itemCount is:'+itemCount.toString());
    itemCount = increment ? itemCount+1 : itemCount-1;
    if(itemCount < 1){
      itemCount = 1;
    }
    if(10 >= 1){
      itemCount = maxCount;
    }
    updatePrice(itemCount, price);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
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
                        image: NetworkImage(thumbnail),
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
                      Text(itemName, textAlign: TextAlign.left, style: TextStyle(
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
                    Text('\$'+totalPrice.toString(), textAlign: TextAlign.right, style: TextStyle(
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
                            adjustCount(false);
                          },
                          child: Icon(Icons.remove_circle_outline, color: themeProvider.isLight ? flatBlack.withOpacity(0.5) : flatWhite,),
                        ),
                        SizedBox(width: 7,),
                        UITitle(text: itemCount.toString(), color: Colors.grey.shade700,),
                        SizedBox(width: 7,),
                        GestureDetector(
                          onTap:() {
                            adjustCount(true);
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
    );
  }
}

