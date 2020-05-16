import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/pages/Calls_Screen.dart';
import 'package:whatsapp/pages/Camera_Screen.dart';
import 'package:whatsapp/pages/Message_Screen.dart';
import 'package:whatsapp/pages/Status_Screen.dart';

class WhatsAppHomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new WhatsAppHomePageState() ;
  }

}

class WhatsAppHomePageState extends State<WhatsAppHomePage> with SingleTickerProviderStateMixin {

  TabController tabcontrol ;

  @override
  void initState() {
    super.initState();

    tabcontrol = new TabController(initialIndex: 1,length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('واتساپ',style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 5.0,
        bottom: new TabBar(
              controller: tabcontrol,
              tabs: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: new Icon(Icons.camera_alt),
                ),
                new Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: new Text('پیام ها',style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                new Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: new Text('وضعیت',style: TextStyle(fontWeight: FontWeight.bold,)),
                ),
                new Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: new Text('تماس ها',style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],
              indicatorColor: Colors.white,
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0)
          ),
          new Icon(Icons.more_vert),
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0)
          )
        ],
      ),
      body: new TabBarView(
        controller: tabcontrol,
        children: <Widget>[
          new CameraScreen(),
          new MessageScreen(),
          new StatusScreen(),
          new CallsScreen()
        ],
      ),
    );
  }

}