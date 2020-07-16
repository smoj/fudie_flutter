import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_meta.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/shared.dart';

class UIItemLarge extends StatelessWidget {

  final double price;
  final String description;
  final String url;
  final String vendor;

  UIItemLarge({this.price, this.description, this.url, this.vendor});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: (themeProvider.isLight) ? primaryColor : Color.fromRGBO(255, 255, 255, 0.12),
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              constraints: BoxConstraints(
                minHeight: 100
              ),
              child: TransitionToImage(
                image: AdvancedNetworkImage(
                  '$url',
                  loadedCallback: () => print('Network Image loaded.'),
                  loadFailedCallback: () => print('Oh, no! failed! Timeout and Retry limit exceeded'),
                  timeoutDuration: Duration(seconds: 80),
                  retryLimit: 3,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('$description', maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text('$vendor', style: TextStyle(
                        color: Colors.white
                    ),),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: Text("\$$price", textAlign: TextAlign.right, style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    height: 1.1
                ),),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}
