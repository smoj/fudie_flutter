import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), ()=> Navigator.of(context).pushNamed('/slider'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/magaza/splash-bg.png'),
                      fit: BoxFit.fitWidth
                  )
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(top:10),
                decoration: BoxDecoration(
//                    color: Colors.white
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment(0,0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text('Reader UI', style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Baloo',
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          height: 0.9,
                          decoration: TextDecoration.none
                      ),),
                      SizedBox(height: 7,),
                      Text('Flutter News App for iOS and Android', textAlign: TextAlign.center, style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.024,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none,
                        color: Colors.white
                      ),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
