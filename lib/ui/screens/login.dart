import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class LoginScreen extends StatelessWidget {
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
        title: Text('Login', style: TextStyle(
            fontFamily: primaryFont,
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.8,-0.95),
              child: Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill
                  )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
//                  FlatButton(
//                    padding: EdgeInsets.zero,
//                    child: Switch(
//                      value: themeProvider.isLight,
//                      onChanged: (boolVal){
//                        themeProvider.setTheme(boolVal);
//                      },
//                    ),
//                  ),
                  UIDisplay2(text: 'Welcome', color: themeProvider.isLight ? primaryColor : flatWhite,),
                  SizedBox(height: 10,),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: Text('Signup', textAlign: TextAlign.left, style: TextStyle(
                              color: themeProvider.isLight ? flatBlack : flatWhite,
                              fontFamily: 'Nunito',
                              fontSize: 17,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed('/forgot');
                          },
                          child: Text('Forgot', textAlign: TextAlign.left, style: TextStyle(
                              color: themeProvider.isLight ? flatBlack : flatWhite,
                              fontFamily: 'Nunito',
                              fontSize: 17,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  UIButton(buttonText: 'Login', onTap: (){
                    Navigator.of(context).pushNamed('/home');
                  },),
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
