import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new SplashState() ;

}

class SplashState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    firstTime();
  }

  firstTime() {
    Duration dur = Duration(milliseconds: 200);
    return new Timer(dur,pushing);
  }
  pushing(){
    Navigator.of(context).pushNamed('/Settings_Screen');
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xff075e54),
      body: new Stack (
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 125,
                height: 125,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("assets/images/whatsapp.png")
                    )
                ),
              ),
              new Text('واتساپ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
            ],
          ),
          new Padding(
              padding: EdgeInsets.only(bottom: 30),
            child: new Align(
              alignment: Alignment.bottomCenter,
              child: new CircularProgressIndicator(
                backgroundColor: new Color(0xff075e54),
              ),
            ),
          )
        ],
      )

    );
  }

}