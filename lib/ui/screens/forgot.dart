import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class ForgotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        actions: <Widget>[
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
        title: Text('Forgot', style: TextStyle(
            fontFamily: primaryFont,
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: Builder(
        builder: (BuildContext context){
          return SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        UIDisplay2(text: 'Reset', color: themeProvider.isLight ? primaryColor : flatWhite,),
                        SizedBox(height: 10,),
                        TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                          style: getTextFieldStyle(themeProvider.isLight),
                          decoration: getInputDecoration(themeProvider.isLight, 'Email Address', 'youremail@address.com'),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text('Go Back', textAlign: TextAlign.left, style: TextStyle(
                                    color: themeProvider.isLight ? flatBlack : flatWhite,
                                    fontFamily: 'Nunito',
                                    fontSize: 17,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        UIButton(buttonText: 'Reset Password', onTap: (){
                          final snackBar = SnackBar(
                            content: Text('Reset Email Sent!'),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                          Timer(Duration(seconds: 1), ()=> Navigator.of(context).pop());
                        },),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
