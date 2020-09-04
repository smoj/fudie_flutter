import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/shop.dart';

class AddressScreen extends StatelessWidget {

  List<Address> lastAddress = [
    Address(addressKey: 'ADD3434', address: '6513 Dogwood Ave undefined Syracuse, Alaska 62927 United States'),
  ];

  List<Address> addressList = [
    Address(addressKey: 'ADD3434', address: '6513 Dogwood Ave undefined Syracuse, Alaska 62927 United States'),
    Address(addressKey: 'ADD3453', address: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ')
  ];

  String showItems(List<Item> items) {
    if (items != null && items.length > 0) {
      Item text = items.reduce((Item curr, Item next) {
        return Item(
            itemName: curr.itemName + ', ' + next.itemName
        );
      });
      return text.itemName;
    }
    else {
      return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.filter, color: (themeProvider.isLight) ? flatBlack : flatWhite,),
//            onPressed: (){
//              Navigator.pushNamed(context, '/cart');
//            },
//          ),
          Switch(
            value: themeProvider.isLight,
            onChanged: (boolVal){
              themeProvider.setTheme(boolVal);
            },
          )
        ],
        backgroundColor: (themeProvider.isLight) ? Colors.white : Color.fromRGBO(66, 66, 66, 1),
        iconTheme: IconThemeData(
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),
        title: Text('Delivery Address', style: TextStyle(
            fontFamily: primaryFont,
            color: (themeProvider.isLight) ? flatBlack : flatWhite
        ),),
      ),
      backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * ScreenGapValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Where should we deliver', textAlign: TextAlign.left, style: TextStyle(
                    color: themeProvider.isLight ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.5
                ),),
                SizedBox(height: 10,),
                UIDisplay2(text: 'Order #48548?', color: Colors.red,),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow : [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0,4),
                        blurRadius: 26
                    )],
                    color : themeProvider.isLight ? Color.fromRGBO(255, 255, 255, 1) : darkThemeElevation2,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Last Used Address", style: TextStyle(
                          color: themeProvider.isLight ? flatBlack : accentColor,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,),
                        ),
                      ),
                      Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, int index)=>GestureDetector(
                          onTap: (){
//                            Navigator.of(context).pushNamed("/detail", arguments: addressList[index]);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(lastAddress[index].address, style: bodyRegularText.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: themeProvider.isLight ? flatBlack : flatWhite,
                                        fontSize: 18,
                                        height: 1.5
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                            ],
                          ),
                        ),
                        itemCount: lastAddress.length,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow : [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0,4),
                        blurRadius: 26
                    )],
                    color : themeProvider.isLight ? Color.fromRGBO(255, 255, 255, 1) : darkThemeElevation2,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Other Addressess", style: TextStyle(
                          color: themeProvider.isLight ? flatBlack : accentColor,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,),
                        ),
                      ),
                      Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, int index)=>GestureDetector(
                          onTap: (){
//                            Navigator.of(context).pushNamed("/detail", arguments: addressList[index]);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(addressList[index].address, style: bodyRegularText.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: themeProvider.isLight ? flatBlack : flatWhite,
                                          fontSize: 18,
                                          height: 1.5
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: themeProvider.isLight ? flatBlack.withOpacity(0.3) : flatWhite.withOpacity(0.3), height: 1,),
                            ],
                          ),
                        ),
                        itemCount: addressList.length,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



