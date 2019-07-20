import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manage_my_pet/model/user.dart';

class FetchUserDetails {
  final token;
  // In the constructor, require a token.
  FetchUserDetails({Key key, @required this.token});

  var user;

  Future<User> fetchUserData() async {
    final response =
        await http.get("https://managemypet.herokuapp.com/api/user",
                headers: {"Authorization": "Bearer " + token, "Accept": "application/json"});

    if (response.statusCode == 200) {
      // user = (json.decode(response.body))
      //       .map((data) => new User.fromJson(data));
      //       // .toList();
      user = User.fromJson(json.decode(response.body));

      print(user.name);
      return user;
    } else {     
      throw Exception('Failed to load user');
    }
  }
}