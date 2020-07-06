import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/pages/Camera_Screen.dart';
import 'package:whatsapp/models/chat_models.dart';

class SingleChatScreen extends StatelessWidget {
  ChatModels data ;

  SingleChatScreen({@required this.data});

  @override
  Widget build(BuildContext context) {
    return new Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          title: new Row(
            children: <Widget>[
              new GestureDetector(
                child: new Icon(Icons.arrow_back),
                onTap: (){
                  Navigator.pop(context,data.name);
                },
              ),
              new GestureDetector(
                child: new SizedBox(
                  width: 10,
                ),
                onTap: (){
                  Navigator.pop(context,data.name);
                },
              ),

              new CircleAvatar(
                backgroundImage: NetworkImage(
                  data.avatarUrl
                ),
              ),
              new SizedBox(
                width: 10,
              ),
              new Text(data.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
            ],
          ),
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new Icon(Icons.call),
                new SizedBox(width: 10,),
                new Icon(Icons.archive),
                new SizedBox(width: 10,),
              ],
            )
          ],
        ),
        body: new Center(
            child: new Text('صفحه چت ' + data.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
      ),
    );
  }

}