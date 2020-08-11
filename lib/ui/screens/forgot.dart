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
    final screenHeight = MediaQuery.of(context).size.height;
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
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  height: screenHeight * 1.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/auth_bg.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Spacer(flex: 3,),
                      UIDisplay2(text: 'Reset', color: themeProvider.isLight ? primaryColor : flatWhite,),
                      SizedBox(height: 10,),
                      TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                        style: getTextFieldStyle(themeProvider.isLight),
                        decoration: getInputDecoration(themeProvider.isLight, 'Email Address', 'youremail@address.com'),
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
                      Spacer()
                    ],
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}
