import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class RegisterScreen extends StatelessWidget {
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
        title: Text('Register', style: TextStyle(
            fontFamily: primaryFont,
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    UIDisplay2(text: 'Register', color: themeProvider.isLight ? primaryColor : flatWhite,),
                    SizedBox(height: 10,),
                    TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                      style: getTextFieldStyle(themeProvider.isLight),
                      decoration: getInputDecoration(themeProvider.isLight, 'Name', 'Your Name'),
                    ),
                    TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                      style: getTextFieldStyle(themeProvider.isLight),
                      decoration: getInputDecoration(themeProvider.isLight, 'Username Email', 'Your username'),
                    ),
                    TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                      obscureText: true,
                      style: getTextFieldStyle(themeProvider.isLight),
                      decoration: getInputDecoration(themeProvider.isLight, 'Password', 'Min 6 Characters'),
                    ),
                    TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                      obscureText: true,
                      style: getTextFieldStyle(themeProvider.isLight),
                      decoration: getInputDecoration(themeProvider.isLight, 'Confirm Password', 'Confirm Password'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    UIButton(buttonText: 'Register',),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
