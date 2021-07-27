import 'package:flutter/material.dart';

class Investor {
  String firstName;
  String lastName;
  String userName;
  String phoneNumber;
  String email;
  String password;

  // ignore: sort_constructors_first
  Investor(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.userName,
      required this.phoneNumber,
      required this.password});
}
