import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudie_ui_flutter/ui/screens/forgot.dart';
import 'package:fudie_ui_flutter/ui/screens/auth_tab.dart';
import 'package:fudie_ui_flutter/ui/screens/detail.dart';
import 'package:fudie_ui_flutter/ui/screens/home.dart';
import 'package:fudie_ui_flutter/ui/screens/register.dart';
import 'package:fudie_ui_flutter/ui/screens/search.dart';
import 'package:fudie_ui_flutter/ui/screens/splash.dart';
import 'package:fudie_ui_flutter/ui/screens/splash_image.dart';
import 'package:fudie_ui_flutter/ui/screens/favourite.dart';
import 'package:fudie_ui_flutter/ui/screens/story_highlight.dart';
import 'package:fudie_ui_flutter/ui/screens/profile.dart';
import 'package:fudie_ui_flutter/ui/screens/i_slider.dart';
import 'package:fudie_ui_flutter/ui/screens/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isLight: true),
        child: MyApp(),
      )
    );
  });
}

class MyApp extends StatelessWidget {
  final appLightTheme = ThemeData(
      primaryColor: Color.fromRGBO(215, 41, 41, 1),
      accentColor: Color.fromRGBO(255, 221, 161, 1),
      primaryColorDark: Color.fromRGBO(12, 12, 12, 1),
      scaffoldBackgroundColor: Color.fromRGBO(246, 245, 250, 1)
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('Provider Data:');
    print(Provider.of<ThemeProvider>(context).isLight);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
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
      theme: appLightTheme,
    );
  }
}
