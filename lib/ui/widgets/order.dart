import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/widgets/title.dart';
import 'package:fudie_ui_flutter/ui/widgets/caption.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class UIOrder extends StatelessWidget {
  final String order;
  final String description;
  final String total;
  final String imageUrl;
  final String qty;

  UIOrder({
    @required this.order,
    @required this.description,
    @required this.total,
    @required this.imageUrl,
    @required this.qty
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: themeProvider.isLight ? primaryColor : darkThemeElevation2,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 72,
            height: 72,
            child: Stack(
              children: <Widget>[
                Align(
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                        color: themeProvider.isLight ? Colors.white.withOpacity(0.7) : primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  alignment: Alignment(1.2,0),
                ),
                Align(
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                        color: themeProvider.isLight ? Colors.white.withOpacity(0.7) : primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  alignment: Alignment(0.8,0),
                ),
                Align(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AdvancedNetworkImage(
                            this.imageUrl,
                            loadedCallback: () => print('Network Image loaded.'),
                            loadFailedCallback: () => print('Oh, no! failed! Timeout and Retry limit exceeded'),
                            timeoutDuration: Duration(seconds: 60),
                            retryLimit: 2,
                          ),
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(this.qty, textAlign: TextAlign.center, style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.065,
                              fontFamily: primaryFont,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                              color: Colors.white
                          ),),
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UITitle(text: this.order, color: Colors.white, height: 1.1,),
                  SizedBox(
                    height: 5,
                  ),
                  UICaption(text: this.description, color: Colors.white.withOpacity(0.8),),
                  SizedBox(
                    height: 5,
                  ),
                  UICaption(text: this.total, color: Colors.white, font: secondaryFont, weight: FontWeight.bold,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
