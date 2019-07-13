import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/drawer.dart';

class VaccinesPage extends StatelessWidget {
  final token;
  // In the constructor, require a token.
  VaccinesPage({Key key, @required this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Vaccines Page")),
      body: Center(child: new Text('My pets vaccines!')),
      drawer: MyDrawer(token: token)
    );
  }
}
