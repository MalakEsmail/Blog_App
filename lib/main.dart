import 'package:blog_app/Authentication.dart';
import 'package:flutter/material.dart';
import 'loginRegisterPage.dart';
import 'Mapping.dart';
import 'HomePage.dart';

import 'HomePage.dart';

void main() => runApp(new BlogApp());

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Blog App',
      theme: new ThemeData(primarySwatch: Colors.pink),
      home: HomePage(
        auth: Auth(),
      ),
    );
  }
}
