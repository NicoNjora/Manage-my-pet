import 'package:flutter/material.dart';

import 'package:manage_my_pet/helpers/dogdetails.dart';
import 'package:manage_my_pet/helpers/userdetails.dart';
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

  var userDetails;
  List<Dog> dogsDetails = List();

  var isLoading = false;

  _myUserDataFunction() {
    var fetchUserDetails = UserFunctions(token: token);
    fetchUserDetails.fetchUserData().then((value) {
      print(value);
      userDetails = value;
    });
  }
  _dogDataFunction() async{
    setState(() {
        isLoading = true;
    });
    var fetchDogDetails = FetchDogDetails(token: token);
    dogsDetails = await fetchDogDetails.fetchDogsData();
    // .then((value) {
    //   print(value);
    //   dogsDetails = value;
    // });
    setState(() {
        isLoading = false;
    });
  }
  
  @override
  void initState() {
    super.initState();

    _myUserDataFunction(); 
    _dogDataFunction();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Home Page")),
      drawer: MyDrawer(token: token, userDetails: userDetails),
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