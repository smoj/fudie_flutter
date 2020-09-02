import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudie_ui_flutter/ui/screens/forgot.dart';
import 'package:fudie_ui_flutter/ui/screens/auth_tab.dart';
import 'package:fudie_ui_flutter/ui/screens/detail.dart';
import 'package:fudie_ui_flutter/ui/screens/order_detail.dart';
import 'package:fudie_ui_flutter/ui/screens/home.dart';
import 'package:fudie_ui_flutter/ui/screens/login.dart';
import 'package:fudie_ui_flutter/ui/screens/register.dart';
import 'package:fudie_ui_flutter/ui/screens/signup.dart';
import 'package:fudie_ui_flutter/ui/screens/cart.dart';
import 'package:fudie_ui_flutter/ui/screens/cards.dart';
import 'package:fudie_ui_flutter/ui/screens/card-detail.dart';
import 'package:fudie_ui_flutter/ui/screens/search.dart';
import 'package:fudie_ui_flutter/ui/screens/splash.dart';
import 'package:fudie_ui_flutter/ui/screens/success.dart';
import 'package:fudie_ui_flutter/ui/screens/order_added.dart';
import 'package:fudie_ui_flutter/ui/screens/vendor.dart';
import 'package:fudie_ui_flutter/ui/screens/favourite.dart';
import 'package:fudie_ui_flutter/ui/screens/story_highlight.dart';
import 'package:fudie_ui_flutter/ui/screens/profile.dart';
import 'package:fudie_ui_flutter/ui/screens/search.dart';
import 'package:fudie_ui_flutter/ui/screens/order-history.dart';
import 'package:fudie_ui_flutter/ui/screens/i_slider.dart';
import 'package:fudie_ui_flutter/ui/screens/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';
import 'package:fudie_ui_flutter/shop.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(
          create: (_) => ThemeProvider(isLight: true),
        ),ChangeNotifierProvider(
          create: (_) => ShopProvider(items: List<Item>()),
        )],
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
      scaffoldBackgroundColor: Color.fromRGBO(246, 245, 250, 1),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    print('Provider Data:');
    print(Provider.of<ThemeProvider>(context).isLight);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreen(),
        '/home' : (context) => HomeScreen(),
        '/login' : (context) => LoginScreen(),
        '/register' : (context) => RegisterScreen(),
        '/cart' : (context) => CartScreen(),
        '/search' : (context) => SearchScreen(),
        '/forgot' : (context) => ForgotScreen(),
        '/slider' : (context) => ISliderScreen(),
        '/favourite' : (context) => FavouriteScreen(),
        '/story-highlight' : (context) => StoryHighlight(),
        '/profile' : (context) => ProfileScreen(),
        '/edit-profile' : (context) => EditProfilePage(),
        '/vendor' : (context) => VendorScreen(),
        '/search' : (context) => SearchScreen(),
        '/cards' : (context) => CardScreen(),
        '/history' : (context) => OrderHistory(),
        '/success' : (context) => SuccessScreen()
      },
      onGenerateRoute: (RouteSettings settings) {
        print('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          "/detail": (context) => DetailScreen(settings.arguments),
          "/order-added" : (context) => OrderAddedScreen(settings.arguments),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
      debugShowCheckedModeBanner: false,
      theme: appLightTheme,
    );
  }
}
