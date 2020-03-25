import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudie_ui_flutter/ui/screens/forgot.dart';
import 'package:fudie_ui_flutter/ui/screens/auth_tab.dart';
import 'package:fudie_ui_flutter/ui/screens/detail.dart';
import 'package:fudie_ui_flutter/ui/screens/home.dart';
import 'package:fudie_ui_flutter/ui/screens/register.dart';
import 'package:fudie_ui_flutter/ui/screens/search.dart';
import 'package:fudie_ui_flutter/ui/screens/splash.dart';
import 'package:fudie_ui_flutter/ui/screens/favourite.dart';
import 'package:fudie_ui_flutter/ui/screens/story_highlight.dart';
import 'package:fudie_ui_flutter/ui/screens/profile.dart';
import 'package:fudie_ui_flutter/ui/screens/i_slider.dart';
import 'package:fudie_ui_flutter/ui/screens/edit_profile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreen(),
        '/home' : (context) => HomeScreen(),
        '/detail' : (context) => DetailScreen(),
        '/login' : (context) => AuthTabScreen(),
        '/search' : (context) => SearchScreen(),
        '/forgot' : (context) => ForgotScreen(),
        '/slider' : (context) => ISliderScreen(),
        '/favourite' : (context) => FavouriteScreen(),
        '/story-highlight' : (context) => StoryHighlight(),
        '/profile' : (context) => ProfileScreen(),
        '/edit-profile' : (context) => EditProfilePage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 62,
            height: 0.8,
            fontFamily: 'Baloo',
          ),
          title: TextStyle(
            fontSize: 52,
            height: 0.8,
            fontFamily: 'Baloo',
          ),
          subhead: TextStyle(
            fontSize: 44,
            height: 0.8,
            fontFamily: 'Baloo',
          ),
          subtitle: TextStyle(
            fontSize: 36,
            height: 0.8,
            fontFamily: 'Baloo',
          ),
          body1: TextStyle(
            fontFamily: 'Varela',
            fontSize: 26,
              height: 0.8
          ),
          body2: TextStyle(
              fontFamily: 'Varela',
              fontSize: 20,
              height: 1.4
          )
        )
      ),
    );
  }
}
