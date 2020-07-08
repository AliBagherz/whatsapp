import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/component/form.dart';

class InputTextArea extends StatelessWidget{
  final String hint ;
  final bool obscure ;
  final IconData icon ;

  InputTextArea({this.hint , this.obscure , this.icon});
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: new BorderSide(
            width: 0.5,
            color: Colors.white24
          )
        )
      ),
      child: new TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          icon: Icon(icon,color: Colors.white,),
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white60
          ),
          contentPadding: EdgeInsets.only(top:15,bottom: 15,left: 0,right: 5),
        ),
        obscureText: obscure,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15
        ),
      )
    );
  }

}