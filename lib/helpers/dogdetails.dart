import 'package:flutter/material.dart';
import 'package:manage_my_pet/model/dog.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchDogDetails {
	final token;
	// In the constructor, require a token.
	FetchDogDetails({Key key, @required this.token});

	List<Dog> list = List();

    fetchDogsData() async {
        // setState(() {
        // isLoading = true;
        // });
        final response =
            await http.get("https://managemypet.herokuapp.com/api/dogs",
                    headers: {"Authorization": "Bearer " + token, "Accept": "application/json"});
        print(response.body);
    
        if (response.statusCode == 200) {
        list = (json.decode(response.body) as List)
            .map((data) => new Dog.fromJson(data))
            .toList();

        return(list);

        // setState(() {        
        //     isLoading = false;
        // });
        } else {
        print('I am being thrown');
        
        throw Exception('Failed to load dogs');
        }
    }
}