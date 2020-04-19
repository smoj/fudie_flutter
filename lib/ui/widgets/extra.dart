import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIExtra extends StatefulWidget {

  final String title;
  final String price;

  UIExtra({@required this.title, @required this.price});

  @override
  _UIExtraState createState() => _UIExtraState();
}

class _UIExtraState extends State<UIExtra> {
  bool selected = false;
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: GestureDetector(
        onTap: (){
          print('toggle');
          setState(() {
            if(selected){
              selected = false;
            }
            else{
              selected = true;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? primaryColor : (themeProvider.isLight ? Colors.white : darkThemeElevation8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Extra', style: TextStyle(
                      color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite),
                      fontFamily: primaryFont,
                      fontSize: MediaQuery.of(context).size.width * 0.035
                  ),),
                  Spacer(),
                  Icon(selected ? Icons.check : Icons.check_box_outline_blank, color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite), size: 15,)
                ],
              ),
              Text('${widget.title}', style: TextStyle(
                  color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite),
                  fontFamily: primaryFont,
                  fontSize: MediaQuery.of(context).size.width * 0.05
              ),),
              Text('2.99', style: TextStyle(
                  color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite),
                  fontFamily: primaryFont,
                  fontSize: MediaQuery.of(context).size.width * 0.035
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

