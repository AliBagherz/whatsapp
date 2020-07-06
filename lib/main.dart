import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/WhatsAppHomePage.dart';
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
      home: new Directionality(textDirection: TextDirection.rtl, child: WhatsAppHomePage()),
    );
  }
}