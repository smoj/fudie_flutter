import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/theme_meta.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class UIItenary extends StatefulWidget {
  int itemCount;
  double price;
  double totalPrice;
  int maxCount;
  double discount;
  double discountedPrice;
  String itemName;
  String thumbnail;

  UIItenary({this.itemCount, this.price, this.maxCount, this.discountedPrice, this.itemName, this.thumbnail});

  @override
  _UIItenaryState createState() => _UIItenaryState();
}

class _UIItenaryState extends State<UIItenary> {
  void initState(){
    super.initState();
    widget.itemCount = 1;
    widget.price = 4.99;
    widget.maxCount = 10;
    widget.discount = 0.50;
    widget.discountedPrice = widget.price * widget.discount;
    updatePrice(widget.itemCount, widget.price);
  }

  updatePrice(int itemCount, double price){
    setState(() {
      widget.totalPrice = double.parse((price * itemCount).toStringAsFixed(2));
    });
  }

  adjustCount(bool increment){
    widget.itemCount = increment ? widget.itemCount+1 : widget.itemCount-1;
    if(widget.itemCount < 1){
      widget.itemCount = 0;
    }
    if(widget.itemCount >= widget.maxCount){
      widget.itemCount = widget.maxCount;
    }
    updatePrice(widget.itemCount, widget.price);
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
                        image: NetworkImage(widget.thumbnail),
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
                    Text('\$'+widget.totalPrice.toString(), textAlign: TextAlign.right, style: TextStyle(
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
                        UITitle(text: widget.itemCount.toString(), color: Colors.grey.shade700,),
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
