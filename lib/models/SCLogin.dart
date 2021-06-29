import 'package:flutter/material.dart';

class SCLogin {
  final String? consultantName;
  final String? companyName;
  final String? username;
  final String? emailAddress;
  final String? pin;

  SCLogin(
      {required this.consultantName,
      required this.companyName,
      required this.emailAddress,
      required this.username,
      required this.pin});
}
