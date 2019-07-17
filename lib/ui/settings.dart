import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/drawer.dart';

class SettingsPage extends StatelessWidget {
  final token;
  // In the constructor, require a token.
  SettingsPage({Key key, @required this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Settings Page")),
      body: Center(child: new Text('My settings!')),
      // drawer: MyDrawer(token: token)
    );
  }
}
