import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/pages/Camera_Screen.dart';

class NewChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text('چت جدید',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            body: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: new Text('چت جدید',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(
                          child : new Text('برگشت'),
                          onPressed: () {
                            Navigator.pop(context);
                          }
                      ),
                      new RaisedButton(
                          child : new Text('صفحه دوربین'),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => CameraScreen()));
                          }
                      ),
                    ],
                  ),
                ],
              ),
        ),
    );
  }

}