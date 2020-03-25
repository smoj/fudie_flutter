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
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(214, 48, 49, 1), Color.fromRGBO(255, 101, 85, 1)]
                  )
              ),
            ),
            Align(
              alignment: Alignment(-0.7,-0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Order.', textAlign: TextAlign.left, style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Eat.', textAlign: TextAlign.left, style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Repeat.', textAlign: TextAlign.left, style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold
                  ),),
                ],
              )
            ),
            Align(
                alignment: Alignment(-0.8, 0.87),
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
                    Text('Flutter Food UI Kit', textAlign: TextAlign.left, style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nunito',
                    ),),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
