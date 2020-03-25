import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/ui/screens/sidemenu.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:fudie_ui_flutter/ui/single-widgets.dart';
import 'package:fudie_ui_flutter/ui/widgets/quote.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: SideMenuScreen(),
        appBar: AppBar(
          brightness: Brightness.light,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.bookmark_border),
            )
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          title: Text('Detail Screen', style: Theme.of(context).textTheme.body2),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: TransitionToImage(
                          image: AdvancedNetworkImage(
                            'https://i.picsum.photos/id/866/400/400.jpg',
                            loadedCallback: () => print('Network Image loaded.'),
                            loadFailedCallback: () => print('Oh, no! failed! Timeout and Retry limit exceeded'),
                            timeoutDuration: Duration(seconds: 60),
                            retryLimit: 2,
                          ),
                          fit: BoxFit.fitWidth,
                          enableRefresh: true,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('The Availability of Low-Cost Flights', style: Theme.of(context).textTheme.subtitle.copyWith(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.1,
                                height: 1.1
                            ),),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: MediaQuery.of(context).size.width * 0.035
                                ),
                                SizedBox(width: 7,),
                                Text('BBC World', style: Theme.of(context).textTheme.body2.copyWith(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width * 0.05
                                ),),
                                Spacer(),
                                Text('Politics', style: Theme.of(context).textTheme.body2.copyWith(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.05
                                ),),
                              ],
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07, vertical: MediaQuery.of(context).size.width * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('The availability of low-cost flights and last minute internet deals means that cheap holidays are far easier to come by than they used to be, but it can still take a bit of shopping around to get the best discounts.', style: Theme.of(context).textTheme.body2.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          height: 1.55
                        ),),
                        UIQuote('Have the Courage to Follow your Heart and Intuition', 'Steve Jobs. 2003'),
                        Text('You can often get discounts on flights, hotels, car hire and holiday packages if you book online. Make sure that the site you’re booking with has a secure payment system and that you print off your confirmation so that you can call the company with any queries or problems.', style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            height: 1.55
                        ),),
                        SizedBox( height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.timer, color: Colors.grey.shade500, size: MediaQuery.of(context).size.width * 0.08,),
                            SizedBox(width: 10,),
                            Text('11 Nov. At 17:42', textAlign: TextAlign.left, style: Theme.of(context).textTheme.body2.copyWith(
                              fontSize: MediaQuery.of(context).size.width * 0.05
                            ),),
                            Spacer(),
                            Icon(Icons.share, color: Colors.grey.shade500, size: MediaQuery.of(context).size.width * 0.08,),
                            SizedBox(width: 10,),
                            Icon(Icons.bookmark_border, color: Colors.grey.shade500, size: MediaQuery.of(context).size.width * 0.08,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text('Comments', textAlign: TextAlign.left, style: Theme.of(context).textTheme.body1.copyWith(
                          fontFamily: 'Baloo'
                        ),),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade400, height: 1,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07, vertical: MediaQuery.of(context).size.width * 0.07),
                    child: Container(),
                  )
                ],
              )
          ),
        )
    );
  }
}

