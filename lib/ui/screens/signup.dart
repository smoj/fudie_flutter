import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/auth_bg.png'),
                    fit: BoxFit.fitWidth
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.9,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.09),
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
                    UIDisplay2(text: 'Welcome', color: themeProvider.isLight ? primaryColor : flatWhite,),
                    SizedBox(height: 10,),
                    TextField(
                      style: getTextFieldStyle(true),
                      decoration: getInputDecoration(themeProvider.isLight, 'Username', 'Username here'),
                    ),
                    TextField(
                      style: getTextFieldStyle(true),
                      decoration: getInputDecoration(themeProvider.isLight, 'Password', 'Password here'),
                    ),
                    SizedBox(height: 20,),
                    Spacer(),
                    UIButton(buttonText: 'Login', onTap: (){
                      return;
                    },),
                    SizedBox(height: 20,),
                    Center(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed('/forgot');
                        },
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
                          child: Text('Forgot Password?', textAlign: TextAlign.left, style: TextStyle(
                              color: themeProvider.isLight ? flatBlack: flatWhite,
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
