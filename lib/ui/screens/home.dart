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
    final screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
          drawer: SideMenuScreen(),
          appBar: AppBar(
            brightness: Brightness.light,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart, color: (themeProvider.isLight) ? flatBlack : flatWhite,),
                onPressed: (){
                  Navigator.pushNamed(context, '/cart');
                },
              )
            ],
            backgroundColor: (themeProvider.isLight) ? Colors.white : Color.fromRGBO(66, 66, 66, 1),
            iconTheme: IconThemeData(
                color: (themeProvider.isLight) ? flatBlack : flatWhite
            ),
            title: Text('Home', style: TextStyle(
                fontFamily: primaryFont,
                color: (themeProvider.isLight) ? flatBlack : flatWhite
            ),),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(screenWidth * ScreenGapValue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: screenWidth * 0.05,),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      UISubHeader(text: 'Welcome back'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      UIDisplay2(text: 'Mr Bradley', color: (themeProvider.isLight) ? themeProvider.lightTheme.textBrandColor : themeProvider.darkTheme.textColor,)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: primaryColor,
                                      width: 7
                                    )
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: TransitionToImage(
                                      image: AdvancedNetworkImage(
                                        'https://randomuser.me/api/portraits/women/8.jpg',
                                        loadedCallback: () => print('Network Image loaded.'),
                                        loadFailedCallback: () => print('Oh, no! image load failed!'),
                                        timeoutDuration: Duration(seconds: 30),
                                        retryLimit: 2,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: screenWidth * (ScreenGapValue / 3)),
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
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: screenWidth * 0.06),
                        child: UITitle(text: 'New Deals'),
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/detail');
                          },
                          child: UIItemLarge(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: screenWidth * 0.06),
                        child: UITitle(text: 'Order Category'),
                      ),
                      Container(
                        width: screenWidth,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: screenWidth * ScreenGapValue,),
                              UITag('Breakfast'),
                              UITag('Lunch'),
                              UITag('Take Out'),
                              UITag('Others'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: screenWidth * 0.06),
                        child: UITitle(text: 'Order History'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue),
                        child: UIOrder(
                          order: 'Order #454444',
                          qty: '33',
                          description: 'Old Country Burger',
                          imageUrl: 'https://picsum.photos/id/483/64/64.jpg',
                          total: '334',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: screenWidth * 0.06),
                        child: UITitle(text: 'Popular Meals'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue,),
                        child: Row(
                          children: <Widget>[
                            UIItemMedium(onTap: (){
                              Navigator.pushNamed(context, '/detail');
                            },),
                            SizedBox(width: 20,),
                            UIItemMedium(onTap: (){
                              Navigator.pushNamed(context, '/detail');
                            },),
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


