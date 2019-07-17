import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manage_my_pet/model/user.dart';

class FetchUserDetails {
  final token;
  // In the constructor, require a token.
  FetchUserDetails({Key key, @required this.token});

  List<User> user = List();

  fetchUserData() async {
    final response =
        await http.get("https://managemypet.herokuapp.com/api/user",
                headers: {"Authorization": "Bearer " + token, "Accept": "application/json"});

    if (response.statusCode == 200) {
      user = (json.decode(response.body) as List)
            .map((data) => new User.fromJson(data))
            .toList();
      print(user);
      return(response.body);
    } else {     
      throw Exception('Failed to load user');
    }
  }
}