import 'package:flutter/material.dart';
import 'package:manage_my_pet/helpers/userdetails.dart';
import 'package:manage_my_pet/ui/drawer.dart';

class VaccinesPage extends StatefulWidget  {
  final token;
  // In the constructor, require a token.
  VaccinesPage({Key key, @required this.token}) : super(key: key);
  @override
  _VaccinesPageState createState() => new _VaccinesPageState(token);
}

class _VaccinesPageState extends State<VaccinesPage> {
    final token;
  // In the constructor, require a token.
  _VaccinesPageState(this.token);
  var userDetails;

  @override
  void initState() {
    super.initState();

    var fetchUserDetails = FetchUserDetails(token: token);
    userDetails = fetchUserDetails.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Vaccines Page")),
      body: Center(child: new Text('My pets vaccines!')),
      drawer: MyDrawer(token: token, userDetails: userDetails)
    );
  }
}