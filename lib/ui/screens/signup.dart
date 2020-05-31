import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        iconTheme: IconThemeData(
//            color: Colors.black
//        ),
//        title: Text('Login', style: TextStyle(
//            fontFamily: 'Montserrat',
//            fontWeight: FontWeight.w700,
//            color: Colors.black
//        ),),
//      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.8,-0.95),
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain
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
                  FlatButton(
                    padding: EdgeInsets.zero,
                    child: Switch(
                      value: themeProvider.isLight,
                      onChanged: (boolVal){
                        themeProvider.setTheme(boolVal);
                      },
                    ),
                  ),
                  UIDisplay2(text: 'Welcome', color: Colors.red,),
                  SizedBox(height: 10,),
                  TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                    style: TextStyle(
                        color: (themeProvider.isLight) ? flatBlack : flatWhite,
                        fontFamily: secondaryFont,
                        fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                        labelText: 'Username/Email',
                        labelStyle: TextStyle(
                            color: (themeProvider.isLight) ? flatBlack : flatWhite
                        ),
                        border: InputBorder.none,
                        hintText: 'Your username',
                        hintStyle: TextStyle(
                            color: (themeProvider.isLight) ? flatBlack.withOpacity(0.5) : flatWhite.withOpacity(0.5),
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ),
                  Divider(
                    color: (themeProvider.isLight) ? flatBlack : flatWhite,
                  ),
                  TextField(
//                    controller: TextEditingController(text: 'aries@hades.com'),
                    obscureText: true,
                    style: TextStyle(
                        color: (themeProvider.isLight) ? flatBlack : flatWhite,
                        fontFamily: secondaryFont,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: (themeProvider.isLight) ? flatBlack : flatWhite
                        ),
                        border: InputBorder.none,
                        hintText: 'Min 6 characters',
                        hintStyle: TextStyle(
                            color: (themeProvider.isLight) ? flatBlack.withOpacity(0.5) : flatWhite.withOpacity(0.5),
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.w700
                        )
                    ),
                  ),
                  Divider(
                    color: (themeProvider.isLight) ? flatBlack : flatWhite,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  UIButton(buttonText: 'Login',),
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
