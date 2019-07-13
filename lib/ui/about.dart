import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/drawer.dart';

class AboutPage extends StatelessWidget {
  final token;
  // In the constructor, require a token.
  AboutPage({Key key, @required this.token}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("About Page")),
      body: Center(child: new Text('About us!')),
      drawer: MyDrawer(token: token)
    );
  }
}
