import 'package:flutter/material.dart';
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
      ),
      home: WhatsAppHomePage(),
    );
  }
}