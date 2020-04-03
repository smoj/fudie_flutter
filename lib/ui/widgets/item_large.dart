import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class UIItemLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
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
            child: TransitionToImage(
              image: AdvancedNetworkImage(
                'https://i.picsum.photos/id/483/350/150.jpg',
                loadedCallback: () => print('Network Image loaded.'),
                loadFailedCallback: () => print('Oh, no! failed! Timeout and Retry limit exceeded'),
                timeoutDuration: Duration(seconds: 60),
                retryLimit: 2,
              ),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Uzumaki Ramen Style', style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Naruto Shop', style: TextStyle(
                      color: Colors.white
                  ),),
                ],
              ),
              Spacer(),
              Text("22.99", textAlign: TextAlign.right, style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  height: 1.1
              ),),
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
