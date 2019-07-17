import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manage_my_pet/helpers/dogdetails.dart';
import 'package:manage_my_pet/helpers/userdetails.dart';
import 'package:manage_my_pet/model/user.dart';
import 'package:manage_my_pet/ui/drawer.dart';
import 'package:manage_my_pet/ui/adddog_page.dart';
import 'package:manage_my_pet/model/dog.dart';

class MyHomePage extends StatefulWidget  {
  final token;
  // In the constructor, require a token.
  MyHomePage({Key key, @required this.token}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState(token);
}

class _MyHomePageState extends State<MyHomePage> {
    final token;
  _MyHomePageState(this.token);

  List<User> userDetails;
  List<Dog> dogsDetails = List();

  @override
  void initState() {
    super.initState();

    var fetchUserDetails = FetchUserDetails(token: token);
    // userDetails = fetchUserDetails.fetchUserData();

    userDetails = (json.decode(fetchUserDetails.fetchUserData()) as List)
            .map((data) => new User.fromJson(data))
            .toList();
    print(userDetails);

    var fetchDogDetails = FetchDogDetails(token: token);
    dogsDetails = fetchDogDetails.fetchDogsData();
  }

  // List<Dog> list = List();
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Home Page")),
      drawer: MyDrawer(token: token, userDetails: userDetails),
      // bottomNavigationBar: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: RaisedButton(
      //       child: new Text("Fetch Data"),
      //       onPressed: _fetchData,
      //     ),
      // ),
      body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: dogsDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    leading: new Image.network(
                      dogsDetails[index].photoUrl,
                      fit: BoxFit.cover,
                      height: 60.0,
                      width: 60.0,
                    ),
                    title: new Text(dogsDetails[index].name),
                    subtitle: Row(
                      children: <Widget>[
                        Text("Breed: " + dogsDetails[index].breed),
                      ],
                    ),                    
                  );
            }),
            floatingActionButton: Theme(
              data: Theme.of(context).copyWith(
                colorScheme:
                    Theme.of(context).colorScheme.copyWith(secondary: Colors.purpleAccent),
              ),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new AddDogPage(token: token, userDetails: userDetails)));
                },
                child: Icon(Icons.add),
              ),
            ),
    );
  }
}