import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/drawer.dart';
import 'package:manage_my_pet/ui/adddog_page.dart';
import 'package:manage_my_pet/model/dog.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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

  List<Dog> list = List();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://managemypet.herokuapp.com/api/dogs",
                headers: {"Authorization": "Bearer " + token, "Accept": "application/json"});
    print(response.body);
  
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Dog.fromJson(data))
          .toList();

      print('list: $list');

      setState(() {        
        isLoading = false;
      });
    } else {
      print('I am being thrown');
      
      throw Exception('Failed to load dogs');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Home Page")),
      drawer: MyDrawer(token: token),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Fetch Data"),
            onPressed: _fetchData,
          ),
      ),
      body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    leading: new Image.network(
                      list[index].photoUrl,
                      fit: BoxFit.cover,
                      height: 60.0,
                      width: 60.0,
                    ),
                    title: new Text(list[index].name),
                    subtitle: Row(
                      children: <Widget>[
                        Text("Breed: " + list[index].breed),
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
                      new MaterialPageRoute(builder: (context) => new AddDogPage(token: token)));
                },
                child: Icon(Icons.add),
              ),
            ),
    );
  }
}