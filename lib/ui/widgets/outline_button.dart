import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIOutlineButton extends StatefulWidget {

  final String text;
  Function onTap = (){return;};

  UIOutlineButton({this.text, this.onTap});

  @override
  _UIOutlineButtonState createState() => _UIOutlineButtonState();
}

class _UIOutlineButtonState extends State<UIOutlineButton> {
  handleOnTap(){
    return widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => handleOnTap(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
          child: Text(widget.text, maxLines: 1, textAlign: TextAlign.center, style: TextStyle(
              color: themeProvider.isLight ? flatBlack: flatWhite,
              fontFamily: 'Nunito',
              fontSize: 16,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.5
          ),),
        ),
      ),
    );
  }
}
