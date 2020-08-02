import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class RegisterScreen extends StatelessWidget {
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
        title: Text('Register', style: TextStyle(
            fontFamily: primaryFont,
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.09),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/auth_bg.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenWidth * 0.28,),
              Row(
                children: <Widget>[
                  UIDisplay2(text: 'Register',),
                ],
              ),
              SizedBox(height: screenWidth * 0.07,),
              TextField(
                style: getTextFieldStyle(themeProvider.isLight),
                decoration: getInputDecoration(themeProvider.isLight, 'Your Name', 'Name here'),
              ),
              TextField(
                style: getTextFieldStyle(themeProvider.isLight),
                decoration: getInputDecoration(themeProvider.isLight, 'email', 'youralias@youremail.com'),
              ),
              TextField(
                style: getTextFieldStyle(themeProvider.isLight),
                decoration: getInputDecoration(themeProvider.isLight, 'Password', 'Min 6 characters'),
              ),
              TextField(
                style: getTextFieldStyle(themeProvider.isLight),
                decoration: getInputDecoration(themeProvider.isLight, 'Confirm Password', 'confirm same password'),
              ),
              SizedBox(height: 20,),
              UIButton(buttonText: 'Register', onTap: (){
                Navigator.of(context).pushNamed('/home');
              },),
            ],
          ),
        ),
      ),
    );
  }
}
