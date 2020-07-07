import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/WhatsAppHomePage.dart';
import 'package:whatsapp/pages/Splash_screen.dart';
import 'package:whatsapp/pages/settings_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IranSans',
        primaryColor: new Color(0xff075e54),
        accentColor: new Color(0xff25d366),
      ),
      initialRoute: "/Splash_Screen",
      routes: {
        "/" : (context) => new Directionality(textDirection: TextDirection.rtl, child: WhatsAppHomePage()),
        "/Splash_Screen" : (context) => new Directionality(textDirection: TextDirection.rtl, child: new SplashScreen()),
        "/Settings_Screen" : (context) => new SettingsScreen()
      },
    );
  }
}