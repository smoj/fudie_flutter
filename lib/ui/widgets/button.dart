import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIButton extends StatefulWidget {
  final String buttonText;
  final IconData buttonIcon;
  final String price;
  final bool outline;
  Function onTap = (){return;};

  UIButton({this.buttonText, this.buttonIcon, this.price, this.outline, this.onTap});

  @override
  _UIButtonState createState() => _UIButtonState();
}

class _UIButtonState extends State<UIButton> {
  handleOnTap(){
    return widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOnTap(),
      child: Container(
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
            Text(widget.buttonText, textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white,
                fontFamily: primaryFont,
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),),
            (widget.price != null || widget.buttonIcon != null) ? Spacer() : SizedBox(width: 0,),
            (widget.price != null) ? Text(widget.price, style: TextStyle(
                color: Colors.white,
                fontFamily: secondaryFont,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),) : SizedBox(width: 0,),
            (widget.buttonIcon != null) ? Icon(widget.buttonIcon, color: Colors.white,): SizedBox(),
          ],
        ),
      ),
    );
  }
}

