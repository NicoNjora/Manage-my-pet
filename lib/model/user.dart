import 'package:flutter/foundation.dart';

class User {
  const User._({
    @required this.id,
    @required this.name,
    @required this.email,
  })  : assert(id != null),
        assert(name != null),
        assert(email != null);

  final int id;
  final String name;
  final String email;
  
  factory User.fromJson(Map<String, dynamic> json) {
    return new User._(
      id: json['id'],
      name: json['name'],
      email: json['photo_url']
    );
  }
}