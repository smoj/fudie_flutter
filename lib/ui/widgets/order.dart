import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/ui/widgets/title.dart';
import 'package:fudie_ui_flutter/ui/widgets/caption.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class UIOrder extends StatelessWidget {
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
                            'https://i.picsum.photos/id/483/64/64.jpg',
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
                          child: Text('3+', textAlign: TextAlign.center, style: TextStyle(
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
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UITitle(text: 'Order #4588484', color: Colors.white,),
                SizedBox(
                  height: 10,
                ),
                UICaption(text: 'Old Country burger', color: Colors.white.withOpacity(0.8),),
                SizedBox(
                  height: 10,
                ),
                UICaption(text: '21.99', color: Colors.white, font: secondaryFont, weight: FontWeight.bold,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
