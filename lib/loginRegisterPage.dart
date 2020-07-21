import 'dart:html';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginRegisterPage();
  }
}

class _LoginRegisterPage extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Flutter Blog App'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: new Form(
            child: Column(
          children: <Widget>[],
        )),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 20.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
      ),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
      ),
      SizedBox(
        height: 20.0,
      ),
    ];
  }

  Widget logo() {
    return Hero(
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 110.0,
        child: Image.asset('images/pp.jpg'),
      ),
    );
  }

  List<Widget> createButtons() {
    return [
      RaisedButton(
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20.0),
        ),
        textColor: Colors.white,
        color: Colors.pink,
      )
    ];
  }
}
