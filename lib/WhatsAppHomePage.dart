import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/pages/Calls_Screen.dart';
import 'package:whatsapp/pages/Camera_Screen.dart';
import 'package:whatsapp/pages/Message_Screen.dart';
import 'package:whatsapp/pages/Status_Screen.dart';
import 'package:whatsapp/pages/newChat.dart';

class WhatsAppHomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new WhatsAppHomePageState() ;
  }

}

class WhatsAppHomePageState extends State<WhatsAppHomePage> with SingleTickerProviderStateMixin {

  TabController tabcontrol ;
  Map <String,SliverAppBar> mainTheme ;
  String currentTheme = 'Home' ;
  @override
  void initState() {
    super.initState();

    tabcontrol = new TabController(initialIndex: 1,length: 4, vsync: this);
    mainTheme = <String,SliverAppBar> {
      'Home' : new SliverAppBar(
        title: new Text('واتساپ',style: TextStyle(fontWeight: FontWeight.bold),),
        pinned: true,
        floating: true,
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
          new GestureDetector(
            child: Icon(Icons.search),
            onTap: (){
              setState(() {
                currentTheme = 'Search' ;
              });
            },
          ),
          new PopupMenuButton<int>(
              onSelected: (int choice) {print(choice);},
              itemBuilder: (BuildContext context) {
                return [
                  new PopupMenuItem(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Text('تنظیمات')
                      ],
                    ),
                    value: 0 ,
                    height: 34,
                  ),
                  new PopupMenuItem(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Text('گروه جدید')
                      ],
                    ),
                    value: 1 ,
                    height: 34,
                  )
                ];
              }
          ),
        ],
      ),
      'Search' : new SliverAppBar(
        title: new TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'جست و حو...',

          ),
        ),
        backgroundColor: Colors.white,
        pinned: true,
        elevation: 5.0,
        leading: new GestureDetector(
          child: new Icon(Icons.arrow_back,color: Color(0xff075e54),),
          onTap: () {
            setState(() {
              currentTheme = 'Home' ;
            });
          },
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context , bool innerBoxIsScrolled) {
          return <Widget>[
            mainTheme[currentTheme]
          ];
        },
        body: new TabBarView(

          controller: tabcontrol,
          children: <Widget>[
            new CameraScreen(),
            new MessageScreen(),
            new StatusScreen(),
            new CallsScreen()
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.message, color: Colors.white,),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewChatScreen() )
          );
          },
      ),
    );
  }

}