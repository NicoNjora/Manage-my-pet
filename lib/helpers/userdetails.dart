import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manage_my_pet/model/user.dart';

class UserFunctions {
  final token;
  // In the constructor, require a token.
  UserFunctions({Key key, @required this.token});

  var user;
  final baseUrl = "https://managemypet.herokuapp.com/api";

  Future<User> fetchUserData() async {
    final response =
        await http.get(baseUrl + "/user",
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

  // Future updateUserImg(id) async {
  //   Future<File> image = ImagePicker.pickImage(source: ImageSource.gallery);
  //   // setState(() {
  //   //   this._imageFile = image;
  //   // });
  //   File img = await image;
  //   Navigator.of(context).pop();
  //   if (img != null) {
  //     //API CALL
  //     try {
  //       FormData formData = new FormData.from({"file": path});
  //       var url = baseUrl + "/user/" + id;
  //
  //       Map<String, String> headers = {
  //         'Authorization': 'Bearer ' + token,
  //         "Content-Type": "multipart/form-data",
  //         "X-Requested-With": "XMLHttpRequest"
  //       };
  //       await dio.post(url,
  //         data: formData,
  //         options: Options(
  //             method: 'POST',
  //             headers: headers,
  //             responseType: ResponseType.json // or ResponseType.JSON
  //             ));
  //       Navigator.pop(context);
  //     } catch (e) {}
  //   }
  // }
}