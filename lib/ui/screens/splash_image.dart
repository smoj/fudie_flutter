import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';

import 'package:flutter/widgets.dart';

class SplashScreenImage extends StatefulWidget {
  @override
  _SplashScreenImageState createState() => _SplashScreenImageState();
}

class _SplashScreenImageState extends State<SplashScreenImage> {
  @override
  void initState(){
    super.initState();
//    Timer(Duration(seconds: 4), ()=> Navigator.of(context).pushNamed('/slider'));
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
                      image: AssetImage('assets/images/splash-bg.png'),
                      fit: BoxFit.fitWidth
                  )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0,1),
                    colors: [Color.fromRGBO(0, 0, 0, 0.8), Color.fromRGBO(0, 0, 0, 0.4)]
                  ),
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
