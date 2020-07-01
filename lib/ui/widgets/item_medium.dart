import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIItemMedium extends StatefulWidget {
  Function onTap = (){};
  final double price;
  final String description;
  final String url;
  final String vendor;

  UIItemMedium({this.price, this.description, this.url, this.vendor, this.onTap});

  @override
  _UIItemMediumState createState() => _UIItemMediumState();
}

class _UIItemMediumState extends State<UIItemMedium> {
  handleOnTap(){
    return widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: GestureDetector(
        onTap: ()=> handleOnTap(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (themeProvider.isLight) ? Colors.white : Color.fromRGBO(12, 12, 12, 0.11),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [lightFaintShadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TransitionToImage(
                      image: AdvancedNetworkImage(
                        widget.url,
                        loadedCallback: () => print('Network Image loaded.'),
                        loadFailedCallback: () => print('Oh, no! Image failed! Timeout and Retry limit exceeded'),
                        timeoutDuration: Duration(seconds: 60),
                        retryLimit: 2,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.description, style: TextStyle(
                      color: (themeProvider.isLight) ? Colors.black : flatWhite,
                      fontSize: MediaQuery.of(context).size.width * 0.048,
                      fontFamily: 'Nunito'
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Opacity(
                    child: UISubHeader(text: widget.price.toString(), weight: FontWeight.bold,),
                    opacity: 0.6,
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

