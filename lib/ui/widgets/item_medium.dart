import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';

class UIItemMedium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
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
                      'https://i.picsum.photos/id/201/350/250.jpg',
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
                Text('Uzumaki Ramen Style', style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.048,
                    fontFamily: 'Nunito'
                ),),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                UISubHeader(text: '39.99',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
