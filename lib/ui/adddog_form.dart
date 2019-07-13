import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:manage_my_pet/ui/home_page.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// Create a Form widget.
class AddDogForm extends StatefulWidget {
  final token;
  // In the constructor, require a token.
  AddDogForm({Key key, @required this.token}) : super(key: key);
  @override
  AddDogFormState createState() {
    return AddDogFormState(token);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AddDogFormState extends State<AddDogForm> {

  final token;
  AddDogFormState(this.token);
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  TextEditingController dogNameController = new TextEditingController();
  TextEditingController dogAgeController = new TextEditingController();
  TextEditingController dogBreedController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: new ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter dog name';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                FontAwesomeIcons.dog,
                color: Colors.black,
                size: 22.0,
              ),
              hintText: "Dog Name",
              hintStyle: TextStyle(
                  fontFamily: "WorkSansSemiBold", fontSize: 17.0),
            ),
            controller: dogNameController,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter dog breed';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.pets,
                color: Colors.black,
                size: 22.0,
              ),
              hintText: "Dog Breed",
              hintStyle: TextStyle(
                  fontFamily: "WorkSansSemiBold", fontSize: 17.0),
            ),
            controller: dogBreedController,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter dog age';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                FontAwesomeIcons.calendar,
                color: Colors.black,
                size: 22.0,
              ),
              hintText: "Dog Age",
              hintStyle: TextStyle(
                  fontFamily: "WorkSansSemiBold", fontSize: 17.0),
            ),
            controller: dogAgeController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  _sendFormDetails();
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  _sendFormDetails() async{
    var dogData = json.encode({'name': dogNameController.text, 
                                'breed': dogBreedController.text,
                                'age': dogAgeController.text,
                                'photo_url': "https://boygeniusreport.files.wordpress.com/2016/11/puppy-dog.jpg"});

    final response =
        await http.post("https://managemypet.herokuapp.com/api/dogs", 
                    body: dogData,
                    headers: {"Content-Type": "application/json",
                              "Authorization": "Bearer " + token});
  
    if (response.statusCode == 200) {
      // var responseBody = (json.decode(response.body));

      Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new MyHomePage(token: token)));
      // return responseBody.token;        
    } else {
      throw Exception('Unable to save the dog details');
    }
  }
}