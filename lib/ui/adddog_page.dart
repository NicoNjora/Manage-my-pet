import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/drawer.dart';
import 'package:manage_my_pet/ui/adddog_form.dart';

class AddDogPage extends StatelessWidget {
  final token;
  // In the constructor, require a token.
  AddDogPage({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Add Dog Page")),
      drawer: MyDrawer(token: token),
      body: AddDogForm(token: token),
    );
  }
}
