
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewGroupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewGroupState() ;
}

class NewGroupState extends State<NewGroupScreen> with SingleTickerProviderStateMixin {
  playAnim() async {
    try {
      await controller.forward();
      await controller.reverse();
    } on TickerCanceled{}
  }
  AnimationController controller ;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this , duration: Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Staggered Animation'),
      ),
      body: new GestureDetector(
        onTap: (){
          playAnim();
        },
        child: new Center(
          child: new Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                    color: Colors.black.withOpacity(0.5)
                )
            ),
            child: StaggerAnimation(controller : controller.view),
          ),
        ),
      ),
    );
  }

}

class StaggerAnimation extends StatelessWidget {

  final Animation<double> controller ;
  final Animation<double> opacity ;
  final Animation<double> width ;
  final Animation<double> height ;
  final Animation<Color> color ;
  final Animation<EdgeInsets> padding ;
  final Animation<BorderRadius> borderRadius ;


  StaggerAnimation({this.controller}) :
      opacity = Tween<double>(begin: 0.0,end: 1.0).animate(
          new CurvedAnimation(parent: controller, curve: Interval(0.0,0.1,curve : Curves.ease))
      ),
      color = ColorTween(begin: Colors.indigo[100],end: Colors.orange[400]).animate(
      new CurvedAnimation(parent: controller, curve: Interval(0.500,0.750,curve : Curves.ease))
      ),
      height = Tween<double>(begin: 50.0,end: 150.0).animate(
      new CurvedAnimation(parent: controller, curve: Interval(0.250,0.375,curve : Curves.ease))
      ),
      width = Tween<double>(begin: 50.0,end: 150.0).animate(
          new CurvedAnimation(parent: controller, curve: Interval(0.125,0.250,curve : Curves.ease))
      ),
      borderRadius = BorderRadiusTween(begin: BorderRadius.circular(4),end: BorderRadius.circular(75)).animate(
          new CurvedAnimation(parent: controller, curve: Interval(0.375,0.500,curve : Curves.ease))
      ),
      padding = EdgeInsetsTween(begin: EdgeInsets.only(bottom: 16),end: EdgeInsets.only(bottom: 75)).animate(
          new CurvedAnimation(parent: controller, curve: Interval(0.250,0.375,curve : Curves.ease))
      ) ;


  @override
  Widget build(BuildContext context) {
   return new AnimatedBuilder(
       animation: controller,
       builder: animBuilder
   );
  }

  Widget animBuilder(BuildContext context , Widget child) {
    return new Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: new Opacity(
        opacity: opacity.value,
        child: new Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
              color: color.value,
              border: Border.all(color: Colors.indigo[300]),
              borderRadius: borderRadius.value
          ),
        ),
      )
    );
  }
}