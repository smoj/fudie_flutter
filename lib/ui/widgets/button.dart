import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIButton extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;
  final String price;
  final bool outline;
  VoidCallback onTap;

  UIButton({this.buttonText, this.buttonIcon, this.price, this.outline, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: brandGradientHorizontal,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this.buttonText, textAlign: TextAlign.center, style: TextStyle(
            color: Colors.white,
            fontFamily: primaryFont,
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),),
          (this.price != null || this.buttonIcon != null) ? Spacer() : SizedBox(width: 0,),
          (this.price != null) ? Text('$price', style: TextStyle(
              color: Colors.white,
              fontFamily: secondaryFont,
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),) : SizedBox(width: 0,),
          (this.buttonIcon != null) ? Icon(this.buttonIcon, color: Colors.white,): SizedBox(),
        ],
      ),
    );
  }
}
