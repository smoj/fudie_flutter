import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), ()=> Navigator.of(context).pushNamed('/home'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(255, 101, 85, 1), Color.fromRGBO(214, 48, 49, 1)]
                  )
              ),
            ),
            //Image Container
            Align(
              alignment: Alignment(-0.7,-0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  UIDisplay3(text: 'Order', color: Colors.white,),
                  SizedBox(
                    height: 20,
                  ),
                  UIDisplay3(text: 'Eat', color: Colors.white,),
                  SizedBox(
                    height: 20,
                  ),
                  UIDisplay3(text: 'Repeat', color: Colors.white,),
                ],
              )
            ),
            Align(
                alignment: Alignment(-0.7, 0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Fuudie', textAlign: TextAlign.left, style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    UITitle(text: 'Flutter Food UI Kit', color: Colors.white,)
                  ],
                ),
            ),
            Align(
              alignment: Alignment(0.8,0.8),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
