import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/component/InputFields.dart';

class FormContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: new Column(
        children: <Widget>[
          new Form(
            child: new Column(
              children: <Widget>[
                new InputTextArea(
                  hint: 'ایمیل کاربری',
                  icon: Icons.person_outline,
                  obscure: false,
                ),
                new InputTextArea(
                  hint: 'رمز عبور',
                  icon: Icons.lock_outline,
                  obscure: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}