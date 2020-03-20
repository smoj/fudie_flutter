import 'package:magaza_flutter/ui/screens/slide_meta.dart';
import 'package:flutter/material.dart';

class ISliderScreen extends StatefulWidget {
  @override
  _ISliderScreenState createState() => _ISliderScreenState();
}

class _ISliderScreenState extends State<ISliderScreen> {
  String nextText = 'Next';
  String prevText = 'Prev';

  List<SlideMeta> pageSlides = [
    SlideMeta(
        title: 'Reader UI',
        message: 'A Flutter news app for iOS and Android',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        backgroundImage: 'assets/magaza/slider1.png',
        iconType: Icons.play_for_work
    ),
    SlideMeta(
        title: '15 Screens with 30+ Widgets',
        message: 'Complete with documentation and Copy & Paste examples',
        backgroundColor: Colors.blue.shade500,
        textColor: Colors.white,
        backgroundImage: 'assets/magaza/slider2.png',
        iconType: Icons.play_arrow
    ),
    SlideMeta(
        title: 'Kickstart your app development',
        message: 'Focus on building your app, not designing it',
        backgroundColor: Colors.white,
        textColor: Colors.black,
        backgroundImage: 'assets/magaza/slider3.png',
        iconType: Icons.wallpaper
    ),
  ];

  PageController slider;

  @override
  void initState(){
    super.initState();
    prevText = '';
    slider = new PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1
    );
  }
  Widget build(BuildContext context) {
    return PageView.builder(
        itemBuilder: (BuildContext context, int index){
          return Scaffold(
            body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Container(
//                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(pageSlides[index].backgroundImage),
                              fit: BoxFit.fitHeight
                          )
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(255, 255, 255, 0.9)
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(pageSlides[index].iconType, color: Colors.white, size: MediaQuery.of(context).size.width * 0.25,),
                            SizedBox(height: 20,),
                            Text(pageSlides[index].title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                              height: 1.1
                            ),),
                            SizedBox(height: 10,),
                            Text(pageSlides[index].message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.body2.copyWith(
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ),
          );
        },
        controller: slider,
        itemCount: pageSlides.length,
        onPageChanged: (index){
          print('index is $index');
          if(index == 0){
            setState(() {
              prevText = '';
            });
          }
          else {
            setState(() {
              prevText = 'Prev';
            });
          }
        },
    );
  }
}
