import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/theme_meta.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIItenary extends StatelessWidget {

  final String name;
  final imageUrl;
  final double price;
  final double discount;

  UIItenary({this.name, this.imageUrl, this.price, this.discount = 0}) : assert(discount >= 0 && discount <= 1, name != null);

  Widget showDiscount(){
    if(this.discount == 0){

    }
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
                    image: NetworkImage('$imageUrl'),
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
                  Text('$name', textAlign: TextAlign.left, style: TextStyle(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('\$$price', textAlign: TextAlign.right, style: TextStyle(
                  color: themeProvider.isLight ? flatBlack : flatWhite,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w600,
                  height: 1
              ),),
              Text((this.discount == 0) ? '' : (this.discount * 100).toString() + '% Discount', textAlign: TextAlign.right, style: TextStyle(
                  color: themeProvider.isLight ? primaryColor : accentColor,
                  fontFamily: 'Nunito',
                  fontSize: 12,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.3333333333333333
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
