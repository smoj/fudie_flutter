import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class LoginScreen extends StatelessWidget {
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
        title: Text('Login', style: TextStyle(
            fontFamily: primaryFont,
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/auth_bg.png'),
                fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Container(
                width: 64,
                height: 64,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: AssetImage('assets/images/logo-dark.png'),
//                          fit: BoxFit.cover
//                      )
//                  ),
              ),
              Spacer(),
              UIDisplay2(text: 'Welcome',),
              SizedBox(height: 10,),
              TextField(
                style: getTextFieldStyle(themeProvider.isLight),
                decoration: getInputDecoration(themeProvider.isLight, 'Username', 'Username here'),
              ),
              TextField(
                style: getTextFieldStyle(themeProvider.isLight),
                decoration: getInputDecoration(themeProvider.isLight, 'Password', 'Password here'),
              ),
              SizedBox(height: 20,),
              Spacer(),
              UIButton(buttonText: 'Login', onTap: (){
                Navigator.of(context).pushNamed('/home');
              },),
              SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  UIOutlineButton(text: 'Reset', onTap: (){
                    Navigator.of(context).pushNamed('/forgot');
                  },),
                  SizedBox(width: 20,),
                  UIOutlineButton(text: 'Signup', onTap: (){
                    Navigator.of(context).pushNamed('/register');
                  },),
                ],
              ),
              SizedBox(height: 20,),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
