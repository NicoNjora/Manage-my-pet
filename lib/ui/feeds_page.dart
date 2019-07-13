import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/drawer.dart';

class FeedsPage extends StatelessWidget {
  final token;
  // In the constructor, require a token.
  FeedsPage({Key key, @required this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Feeds Page")),
      body: Center(child: new Text('My pets feeds!')),
      drawer: MyDrawer(token: token)
    );
  }
}
