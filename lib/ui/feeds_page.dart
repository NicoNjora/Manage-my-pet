import 'package:flutter/material.dart';
import 'package:manage_my_pet/helpers/feedsdetails.dart';
import 'package:manage_my_pet/helpers/userdetails.dart';
import 'package:manage_my_pet/ui/drawer.dart';

class FeedsPage extends StatefulWidget  {
  final token;
  // In the constructor, require a token.
  FeedsPage({Key key, @required this.token}) : super(key: key);
  @override
  _FeedsPageState createState() => new _FeedsPageState(token);
}

class _FeedsPageState extends State<FeedsPage> {
    final token;
  _FeedsPageState(this.token);

  var userDetails;
  var feedsDetails;

  @override
  void initState() {
    super.initState();

    var fetchUserDetails = FetchUserDetails(token: token);
    userDetails = fetchUserDetails.fetchUserData();

    var fetchFeedsDetails = FetchFeedsDetails(token: token);
    feedsDetails = fetchFeedsDetails.fetchFeedsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Feeds Page")),
      body: Center(child: new Text('My pets feeds!')),
      drawer: MyDrawer(token: token, userDetails: userDetails)
    );
  }
}
