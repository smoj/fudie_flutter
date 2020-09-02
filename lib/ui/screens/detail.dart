import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/widgets/extra.dart';
import 'package:fudie_ui_flutter/ui/widgets/quote.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/shop.dart';

class DetailScreen extends StatefulWidget {

  int itemCount;
  double price;
  double totalPrice;
  int maxCount;
  double discount;
  double discountedPrice;
  Item item;

  DetailScreen(this.item);

  @override
  _DetailScreenState createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> {

  double extraSum = 0;

  // Function to get data from UIExtra() widget.
  callback(List<Extra> data){
//    print('data from child Extra to DetailScreen: '+data.toString());
    setState(() {
      widget.item.extras = data;
      calculateExtras();
      updatePrice(widget.itemCount, widget.price);
    });
  }

  void initState(){
    super.initState();
    widget.itemCount = widget.item.quantity;
    widget.price = widget.item.price;
    widget.maxCount = 10;
    widget.discount = 1;
    widget.discountedPrice = widget.price * widget.discount;
    updatePrice(widget.itemCount, widget.price);
  }

  updatePrice(int itemCount, double price){
    setState(() {
      widget.totalPrice = double.parse((price * itemCount).toStringAsFixed(2)) + extraSum;
    });
  }

  calculateExtras(){
    List<Extra> filtered = widget.item.extras.where((extra)=> extra.selected).toList();
    if(filtered.length > 0){
      Extra total = filtered.reduce((Extra curr, Extra next){
        return Extra(
            price: curr.price + next.price
        );
      });
      print('Extra Cost: '+total.price.toString());
      setState(() {
        extraSum = total.price;
      });
    }
    else{
      setState(() {
        extraSum = 0.01;
      });
    }
  }

  adjustCount(bool increment){
    widget.itemCount = increment ? widget.itemCount+1 : widget.itemCount-1;
    if(widget.itemCount < 1){
      widget.itemCount = 0;
    }
    if(widget.itemCount >= widget.maxCount){
      widget.itemCount = widget.maxCount;
    }
    updatePrice(widget.itemCount, widget.price);
  }

  Widget showExtras(List<Extra> extra){
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.045;
    final headingPadding = EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.01);
    return (extra.length > 0 || extra != null) ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: headingPadding,
          child: UITitle(text: 'Extras',),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: headingPadding,
          child: GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 4/3
            ),
            itemBuilder: (_, int index){
              return UIExtra(
                title: widget.item.extras[index].name,
                price: '\$'+widget.item.extras[index].price.toString(),
                callback: callback, // changes from inside UIExtra will trigger widget.callback
                extras: (widget.item.extras != null) ? widget.item.extras : [],
                extraId: widget.item.extras[index].extraId,
                selected: (widget.item.extras[index].selected != null) ? widget.item.extras[index].selected : false,
              );
            },
            itemCount: widget.item.extras.length,
          ),
        )
      ],
    ) : SizedBox(height: 0,);
  }

  @override
  Widget build(BuildContext context) {
    // takes arguments from prior screen
    final Item details = ModalRoute.of(context).settings.arguments;

    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final metaFontSize = screenWidth * 0.045;
    final horizontalPadding = screenWidth * 0.045;
    final headingPadding = EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.01);
//    print('ShopProvider: '+shop.toString());
    return Scaffold(
        backgroundColor: (themeProvider.isLight) ? themeProvider.lightTheme.scaffoldBackground : themeProvider.darkTheme.scaffoldBackground,
        appBar: AppBar(
          brightness: Brightness.light,
          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.search, color: (themeProvider.isLight) ? flatBlack : flatWhite,),
//              onPressed: (){
//                Navigator.pushNamed(context, '/search');
//              },
//            )
            FlatButton(
              padding: EdgeInsets.zero,
              child: Switch(
                value: themeProvider.isLight,
                onChanged: (boolVal){
                  themeProvider.setTheme(boolVal);
                },
              ),
            )
          ],
          backgroundColor: (themeProvider.isLight) ? Colors.white : Color.fromRGBO(66, 66, 66, 1),
          iconTheme: IconThemeData(
              color: (themeProvider.isLight) ? flatBlack : flatWhite
          ),
          title: Text('Detail', style: TextStyle(
              fontFamily: primaryFont,
              color: (themeProvider.isLight) ? flatBlack : flatWhite
          ),),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.grey.shade800,
                        constraints: BoxConstraints(
                            minHeight: 300
                        ),
                        height: 300,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
//                                'https://picsum.photos/id/384/300/300.jpg'
                                width: screenWidth,
                                child: TransitionToImage(
                                  image: AdvancedNetworkImage(
                                    widget.item.imageUrl,
                                    loadedCallback: () => print('Network Image loaded.'),
                                    loadFailedCallback: () => print('Oh, no! Image failed! Timeout and Retry limit exceeded'),
                                    timeoutDuration: Duration(seconds: 60),
                                    retryLimit: 2,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment(0,0.1),
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.5)]
                                    )
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.9,-0.87),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: success,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                padding: EdgeInsets.fromLTRB(18, 9, 18, 8),
                                child: Text('Available', style: TextStyle(
                                    fontSize: metaFontSize,
                                    height: 1
                                ),),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.9,-0.87),
                              child: Container(
                                constraints: BoxConstraints(
                                    minWidth: 100
                                ),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                padding: EdgeInsets.fromLTRB(18, 9, 18, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(Icons.star, color: Colors.white.withOpacity(0.5), size: metaFontSize,),
                                    Icon(Icons.star, color: Colors.white.withOpacity(0.5), size: metaFontSize,),
                                    Icon(Icons.star, color: Colors.white, size: metaFontSize,),
                                    Icon(Icons.star, color: Colors.white, size: metaFontSize,),
                                    Icon(Icons.star, color: Colors.white, size: metaFontSize,),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.7,0.8),
                              child: Container(
                                width: screenWidth * 0.7,
                                child: Text(widget.item.itemName, maxLines: 3, textAlign: TextAlign.left, style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: primaryFont,
                                    fontWeight: FontWeight.w900,
                                    fontSize: screenWidth * 0.065
                                ),),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.7,0.8),
                              child: Container(
                                width: screenWidth * 0.7,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text('\$'+widget.price.toString(), maxLines: 3, textAlign: TextAlign.right, style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: secondaryFont,
                                        height: 1,
                                        fontSize: screenWidth * 0.05,
                                        decoration: TextDecoration.lineThrough
                                    ),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("\$"+widget.discountedPrice.toString(), maxLines: 3, textAlign: TextAlign.right, style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.w900,
                                        height: 1,
                                        fontSize: screenWidth * 0.065
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: screenWidth * 0.03,
                        decoration: BoxDecoration(
                            gradient: brandGradientHorizontal
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.065),
                        color: (themeProvider.isLight) ? Colors.white : darkThemeElevation16,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  UICaption(text: 'Average Delivery Time',),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('35 Mins', style: TextStyle(
                                      fontFamily: 'Nunito',
                                      height: 0.8,
                                      fontWeight: FontWeight.normal,
                                      color: (themeProvider.isLight) ? themeProvider.lightTheme.textColor : themeProvider.darkTheme.textColor,
                                      fontSize: MediaQuery.of(context).size.width * 0.05
                                  ),)
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap:() {
                                          adjustCount(false);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: themeProvider.isLight ? Colors.white : darkThemeElevation8,
                                              boxShadow: [lightFaintShadow],
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Icon(Icons.remove_circle_outline, color: themeProvider.isLight ? flatBlack : flatWhite,),
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      UITitle(text: widget.itemCount.toString(),),
                                      SizedBox(width: 20,),
                                      GestureDetector(
                                        onTap:() {
                                          adjustCount(true);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: themeProvider.isLight ? Colors.white : darkThemeElevation8,
                                              boxShadow: [lightFaintShadow],
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Icon(Icons.add_circle_outline, color: themeProvider.isLight ? flatBlack : flatWhite,),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenWidth * 0.065),
                        child: Text('A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. ... There are many international and regional variations of the hamburger', style: TextStyle(
                            fontFamily: secondaryFont,
                            color: themeProvider.isLight ? flatBlack : flatWhite,
                            height: 1.5
                        ),),
                      ),
                      (widget.item.extras != null)? showExtras(widget.item.extras) : SizedBox(height: 0,),
                      SizedBox(height: 20,),
                      Padding(
                        padding: headingPadding,
                        child: UITitle(text: 'More from Vendor',),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.065),
                        child: Row(
                          children: <Widget>[
                            UIItemMedium(
                              price : 33,
                              description: 'Pizza',
                              url: 'http://www.audacitus.com/mobile_app_assets/detail3.png',
                              onTap: (){
                                Item item = Item(
                                    itemKey: 'DLX233',
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
                                  itemKey: 'DLX232',
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
                        height: 60,
                      ),
                    ],
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: UIButton(buttonText: 'Order', price: '\$'+widget.totalPrice.toString(), onTap: (){
                    Provider.of<ShopProvider>(context).addToCart(Item(
                        itemKey: widget.item.itemKey,
                        price: widget.price,
                        totalPrice: widget.totalPrice,
                        itemName: widget.item.itemName,
                        quantity: widget.itemCount,
                        extras: (widget.item.extras != null && widget.item.extras.length > 0 ) ? widget.item.extras : [],
                        imageUrl: widget.item.imageUrl));
                     Navigator.of(context).pushNamed('/order-added', arguments: widget.item);
                  },),
                ),
              )
            ],
          ),
        )
    );
  }
}


