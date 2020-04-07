import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit?'),
          content: Text('Do you want to exit the app?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              /*Navigator.of(context).pop(true)*/
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
          false;
    }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(246, 245, 250, 1),
          drawer: SideMenuScreen(),
          appBar: AppBar(
            brightness: Brightness.light,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  Navigator.pushNamed(context, '/search');
                },
              )
            ],
            backgroundColor: Color.fromRGBO(246, 245, 250, 1),
            iconTheme: IconThemeData(
                color: Colors.black
            ),
            title: Text('Home', style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: Colors.black
            ),),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * ScreenGapValue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Switch(
                                        value: themeProvider.isLight,
                                        onChanged: (boolVal){
                                          themeProvider.setTheme(boolVal);
                                        },
                                      ),
                                      Text('Welcome back,', textAlign: TextAlign.left, style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontFamily: 'Nunito'
                                      ),),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      UIDisplay2(text: 'Mr Bradley', color: primaryColor,)
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AdvancedNetworkImage(
                                    'https://randomuser.me/api/portraits/women/8.jpg',
                                    loadedCallback: () => print('Network Image loaded.'),
                                    loadFailedCallback: () => print('Oh, no! image load failed!'),
                                    timeoutDuration: Duration(seconds: 30),
                                    retryLimit: 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue, vertical: MediaQuery.of(context).size.width * (ScreenGapValue / 3)),
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [lightFaintShadow]
                        ),
                        child: TextField(
//                        controller: TextEditingController(text: ''),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            fontFamily: 'Nunito'
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What do you want to order?',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontFamily: 'Nunito',
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue, vertical: MediaQuery.of(context).size.width * 0.06),
                        child: UITitle(text: 'New Deals', color: Color.fromRGBO(112, 112, 112, 1),),
                      ),
                      UIItemLarge(),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue, vertical: MediaQuery.of(context).size.width * 0.06),
                        child: UITitle(text: 'Order Category', color: Color.fromRGBO(112, 112, 112, 1),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: MediaQuery.of(context).size.width * ScreenGapValue,),
                              UITag(),
                              UITag(),
                              UITag(),
                              UITag(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue, vertical: MediaQuery.of(context).size.width * 0.06),
                        child: UITitle(text: 'Popular Meals', color: Color.fromRGBO(112, 112, 112, 1),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue,),
                        child: Row(
                          children: <Widget>[
                            UIItemMedium(),
                            SizedBox(width: 20,),
                            UIItemMedium()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          )
      ),
    );
  }
}


