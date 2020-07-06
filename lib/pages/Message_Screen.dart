import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/models/chat_models.dart';
import 'package:whatsapp/pages/singleChatScreen.dart';
class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      itemCount: models.length,
      itemBuilder: (context,index) {
        return new Column(
          children: <Widget>[
            new Divider(
              height: 10,
            ),
            new GestureDetector(
              onTap: () {
                navigateAndDisplayMessage(context,models[index]);
              },
              child: new ListTile(
                  leading: new CircleAvatar(
                    backgroundImage: NetworkImage(models[index].avatarUrl),
                    backgroundColor: Colors.grey,
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(models[index].name, style: TextStyle(fontWeight: FontWeight.bold),),
                      new Text(models[index].time, style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontSize: 13
                      ),
                      )
                    ],
                  ),
                  subtitle: new Container(
                    padding: EdgeInsets.fromLTRB(0, 7, 1, 0),
                    child: new Text(
                      models[index].message,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400
                      ) ,
                    ),
                  )
              ),
            ),
          ],
        );
      }
    );
  }
  navigateAndDisplayMessage(BuildContext context , ChatModels data) async {
    String result = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SingleChatScreen(data: data))
    );
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('بدرود ' + result + ' جانم' , style: TextStyle(fontFamily: 'IranSans'),),
      duration: new Duration(milliseconds: 2900),
      action: new SnackBarAction(
          label: 'سلام مجدد',
          onPressed: () {
            navigateAndDisplayMessage(context, data);
          }
      )
    ));
  }
}