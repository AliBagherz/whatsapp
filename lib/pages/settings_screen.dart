
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState() ;

}

class SettingsState extends State<SettingsScreen> with SingleTickerProviderStateMixin {

  AnimationController controller ;
  Animation<double> animation ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(vsync: this ,duration: Duration(milliseconds: 700));
    animation = Tween(begin: 30.0,end: 200.0).animate(new CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.addListener(() {
      if (controller.isCompleted){
        controller.reverse();
      } else if (controller.isDismissed){
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
        body: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new AnimatedBuilder(
                  animation: controller,
                  builder: jumpBall
              ),
              new RaisedButton(
                onPressed: () {
                  controller.forward();
                },
                child: new Text('بپر',style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              new Padding(padding: EdgeInsets.only(bottom: 40))
            ],
          ),
        )
      ),
    );
  }

  Widget jumpBall(BuildContext context,Widget child) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: animation.value),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/greenBall.png"),
          )
      ),
    );
  }
}