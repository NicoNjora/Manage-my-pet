import 'package:flutter/foundation.dart';

class Dog {
  const Dog._({
    @required this.id,
    @required this.name,
    @required this.breed,
    @required this.age,
    @required this.photoUrl,
  })  : assert(id != null),
        assert(name != null),
        assert(breed != null),
        assert(age != null),
        assert(photoUrl != null);

  final int id;
  final String name;
  final String breed;
  final String photoUrl;
  final int age;

  factory Dog.fromJson(Map<String, dynamic> json) {
    return new Dog._(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photo_url'],
      age: json['age'],
      breed: json['breed']
    );
  }
}