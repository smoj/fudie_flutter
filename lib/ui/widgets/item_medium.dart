import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

class UIItemMedium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [lightFaintShadow]
      ),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * ScreenGapValue),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AdvancedNetworkImage(
                      'https://i.picsum.photos/id/483/350/150.jpg',
                      loadedCallback: () => print('Network Image loaded.'),
                      loadFailedCallback: () => print('Oh, no! failed! Timeout and Retry limit exceeded'),
                      timeoutDuration: Duration(seconds: 60),
                      retryLimit: 2,
                    ),
                    fit: BoxFit.fitWidth
                )
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Uzumaki Ramen Style', style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontFamily: 'Nunito'
                    ),),
                    Text('Naruto Shop', style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito'
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text('39.99', style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito'
                    ),),
                  ],
                ),
                flex: 4,
              ),
              Expanded(
                child: Text("22.99", textAlign: TextAlign.right, style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    height: 1.1
                ),),
                flex: 2,
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
