import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'dart:math';

class FeedItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String timestamp;
  final String category;
  bool special = false;

  final selectColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.blue.shade800,
    Colors.pink.shade700,
    Colors.grey.shade700
  ];

  FeedItem({this.imageUrl, this.title, this.timestamp, this.category, this.special});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: selectColors[Random().nextInt(selectColors.length)],
          constraints: BoxConstraints(
            minHeight: 150
          ),
          width: MediaQuery.of(context).size.width,
          child: TransitionToImage(
            image: AdvancedNetworkImage(
              this.imageUrl,
              loadedCallback: () => print('Network Image $imageUrl loaded.'),
              loadFailedCallback: () => print('Oh, no! $imageUrl failed! Timeout and Retry limit exceeded'),
              timeoutDuration: Duration(seconds: 60),
              retryLimit: 2,
            ),
            fit: BoxFit.fitWidth,
            enableRefresh: true,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            height: 400,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: selectColors[Random().nextInt(selectColors.length)].withOpacity(0.4),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width * 0.09,
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.title, style: Theme.of(context).textTheme.subtitle.copyWith(
                color: Colors.white
              ),),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.timer, color: Colors.white,),
                  SizedBox(width: 7,),
                  Text(this.timestamp, style: Theme.of(context).textTheme.body2.copyWith(
                      color: Colors.white,
                  ),),
                  Spacer(),
                  Text(this.category.toLowerCase(), style: Theme.of(context).textTheme.body2.copyWith(
                      color: Colors.white
                  ),),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07, vertical: MediaQuery.of(context).size.width * 0.07),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.width * 0.035
                ),
                SizedBox(width: 10,),
                Text('BBC', style: Theme.of(context).textTheme.body2.copyWith(
                  color: Colors.white
                ),)
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: (this.special) ? Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.red,
            child: Text('Special'.toUpperCase(), style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 13,
              letterSpacing: 6,
              fontWeight: FontWeight.bold,
            ),),
          ) : null,
        ),
      ],
    );
  }
}
