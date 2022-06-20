import 'package:flutter/cupertino.dart';

class UserModel {
  late String FirstName;
  late String LastName;
  late String Gender;
  late String Email;
  late int PhoneNumber;

  UserModel(
    this.FirstName,
    this.LastName,
    this.Gender,
    this.Email,
    this.PhoneNumber,
  );
  UserModel.fromJson(Map<String, dynamic> json)
      : FirstName = json['first_name'],
        LastName = json['last_name'],
        Gender = json['gender'],
        Email = json['email'],
        PhoneNumber = json['phone'];
}
