import 'package:flutter/material.dart';

class MCLogin {
  final String? consultantName;
  final String? companyName;
  final String? username;
  final String? emailAddress;
  final String? password;

  MCLogin(
      {required this.consultantName,
      required this.companyName,
      required this.emailAddress,
      required this.username,
      required this.password});
}
