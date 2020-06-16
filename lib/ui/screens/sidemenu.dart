import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class SideMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Container(
        color: flatBlack,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Hello,', style: TextStyle(
                            color: flatWhite,
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.w300
                        ),),
                        Text('Elizabeth Hurley Alzerden', maxLines: 2, overflow: TextOverflow.fade, style: TextStyle(
                          color: flatWhite,
                          fontFamily: primaryFont,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                  ],
                )
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
              color: darkThemeElevation6.withOpacity(0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                      title: Text('Favourites', style: TextStyle(
                          color: flatWhite,
                          fontWeight: FontWeight.w600,
                          fontFamily: primaryFont,
                          fontSize: 18
                      ),),
                      onTap: (){
                        Navigator.pushNamed(context, '/favourite');
                      },
                      leading: Icon(Icons.favorite, color: flatWhite,),
                      trailing: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          width: 30,
                          height: 30,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(90)
                            ),
                            child: Text('89', textAlign: TextAlign.center, style: TextStyle(
                                color: flatWhite,
                                fontSize: 15,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.w600
                            )),
                          ))
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                    title: Text('Home', style: TextStyle(
                        color: flatWhite,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.home, color: flatWhite,),
                    onTap: (){
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/detail');
                    },
                    title: Text('Detail Page', style: TextStyle(
                        color: flatWhite,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.book, color: flatWhite,),
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/search');
                    },
                    title: Text('Search', style: TextStyle(
                        color: flatWhite,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.search, color: flatWhite,),
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/profile');
                    },
                    title: Text('Profile', style: TextStyle(
                        color: flatWhite,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.person, color: flatWhite,),
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/story-highlight');
                    },
                    title: Text('Special Story', style: TextStyle(
                        color: flatWhite,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.star, color: flatWhite,),
                  ),
                  Divider(height: 1, color: themeProvider.isLight ? flatWhite : themeProvider.darkTheme.accentColor.withOpacity(0.5)),
                  ListTile(
                    title: Text('Logout', style: TextStyle(
                        color: flatWhite,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                        fontSize: 18
                    ),),
                    onTap: (){
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Want to logout?'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('No'),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false),
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    leading: Icon(Icons.exit_to_app, color: flatWhite,),
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
