import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Manage my pet',
      theme: new ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: new LoginPage(),
    );
  }
}