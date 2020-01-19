import 'package:flutter/material.dart';

class SideMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(28, 27, 27, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Hello,', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300
                    ),),
                    Text('Elizabeth', overflow: TextOverflow.fade, style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Yrsa',
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                    ),),
                    Text('Hurley', overflow: TextOverflow.fade, style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Yrsa',
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
              color: Color.fromRGBO(28, 27, 27, 1),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Divider( height: 1, color: Color.fromRGBO(51, 50, 50, 1)),
                  ListTile(
                      title: Text('Favourited', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          fontSize: 18
                      ),),
                      leading: Icon(Icons.favorite, color: Colors.white,),
                      trailing: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          width: 30,
                          height: 30,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(90)
                            ),
                            child: Text('89', textAlign: TextAlign.center, style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600
                            )),
                          ))
                  ),
                  Divider( height: 1, color: Color.fromRGBO(51, 50, 50, 1)),
                  ListTile(
                    title: Text('Music', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.music_note, color: Colors.white,),
                  ),
                  Divider( height: 1, color: Color.fromRGBO(51, 50, 50, 1)),
                  ListTile(
                    title: Text('Lifestyle', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.branding_watermark, color: Colors.white,),
                  ),
                  Divider( height: 1, color: Color.fromRGBO(51, 50, 50, 1)),
                  ListTile(
                    title: Text('Sports', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.border_all, color: Colors.white,),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
              color: Color.fromRGBO(28, 27, 27, 1),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100,),
                  Divider( height: 1, color: Color.fromRGBO(51, 50, 50, 1)),
                  ListTile(
                    title: Text('Logout', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.exit_to_app, color: Colors.white,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}