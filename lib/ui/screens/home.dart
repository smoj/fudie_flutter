import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/shop.dart';

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

  Widget showCartCount(){
    final shopProvider = Provider.of<ShopProvider>(context);
    return shopProvider.items.length > 0 ? Container(
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      height: 20,
      width: 20,
      child: Text(shopProvider.items.length.toString(), textAlign: TextAlign.center, style: TextStyle(
          fontSize: 14,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          height: 1.4,
          color: Colors.white
      ),),
    ) : SizedBox(width: 0,);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final shopProvider = Provider.of<ShopProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
          drawer: SideMenuScreen(),
          appBar: AppBar(
            brightness: Brightness.light,
            actions: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/cart');
                },
                child: Stack(
                  children: <Widget>[
                    Align(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.shopping_cart, size: 30, color: (themeProvider.isLight) ? flatBlack : flatWhite,),
                            SizedBox(width: 15,)
                          ],
                        ),
                        alignment: Alignment.center
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: showCartCount(),
                    ),
                  ],
                ),
              ),
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
                                        timeoutDuration: Duration(seconds: 90),
                                        retryLimit: 3,
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed('/search');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                margin: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: 7),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [lightFaintShadow]
                                ),
                                child: Text('What do you want to order?', style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontFamily: 'Nunito',
                                ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * ScreenGapValue, vertical: screenWidth * 0.06),
                        child: UITitle(text: 'New Deals'),
                      ),
                      GestureDetector(
                          onTap: (){
//                          // You can pass an instance class of <Item> in navigator!
                            Item item = Item(
                                itemKey: 'DLX234',
                                imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail.png',
                                quantity: 1,
                                price: 4.99,
                                totalPrice: 4.99,
                                itemName: 'Heavenly Burgers',
                                extras: [
                                  Extra(name: 'Caramelized Onions Spiced', price: 3.99, extraId: 'Ex344', selected: false),
                                  Extra(name: 'More Cheese', price: 0.99, extraId: 'Ex323', selected: false)
                                ]
                            );
                            Navigator.of(context).pushNamed("/detail", arguments: item);
                          },
                          child: UIItemLarge(vendor: 'Naruto Shop', price: 23.99, url: 'http://www.audacitus.com/mobile_app_assets/item-large.jpg', description: 'Heavenly Burgers',),
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
                          order: '#45444444443',
                          qty: '33',
                          description: 'Sunday May 22nd 2020',
                          imageUrl: 'http://www.audacitus.com/mobile_app_assets/tiny-order-summary.png',
                          total: '\$334.73',
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
                            UIItemMedium(
                              price : 33,
                              description: 'Pizza',
                              url: 'http://www.audacitus.com/mobile_app_assets/detail3.png',
                              onTap: (){
                                Item item = Item(
                                    imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail3.png',
                                    quantity: 1,
                                    price: 4.99,
                                    totalPrice: 4.99,
                                    itemName: 'Pizza'
                                );
                                Navigator.of(context).pushNamed("/detail", arguments: item);
                              },),
                            SizedBox(width: 20,),
                            UIItemMedium(
                              price : 14.99,
                              description: 'Scotch Bread',
                              url: 'http://www.audacitus.com/mobile_app_assets/detail2.png',
                              onTap: (){
                                Item item = Item(
                                    itemKey: 'DLX873',
                                    imageUrl: 'http://www.audacitus.com/mobile_app_assets/detail2.png',
                                    quantity: 1,
                                    price: 14.99,
                                    totalPrice: 4.99,
                                    itemName: 'Scotch Bread'
                                );
                                Navigator.of(context).pushNamed("/detail", arguments: item);
                              },),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
            ),
          )
      ),
    );
  }
}


