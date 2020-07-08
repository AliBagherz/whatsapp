import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/component/form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size ;
    return new Directionality(textDirection: TextDirection.rtl, child:  Scaffold(
      body: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color> [
                Color(0xff004D40),
                Color(0xff212121)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child: new Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            new Opacity(
              opacity: 0.3,
              child: Container(
                height: page.height,
                width: page.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Login_Back.jpg'),
                        repeat: ImageRepeat.repeat
                    )
                ),
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FormContainer(),
                new FlatButton(
                    onPressed: (){

                    },
                    child: Text(
                      'آیا هیچ اکانتی ندارید؟ عضویت',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'IranSans',
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                        color: Colors.white
                      ),
                    )
                ),
              ],
            ),
            new GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed("/");
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: 190,
                  height: 60,
                  decoration: BoxDecoration(
                      color: new Color(0xff075e54),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: new Center(
                    child: Text(
                      'ورود',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        fontFamily: 'IranSans',
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    ));

  }

}