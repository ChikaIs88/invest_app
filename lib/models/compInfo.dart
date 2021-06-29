import 'dart:html';

import 'package:flutter/material.dart';

class CompInfo {
  final String? consultantName;
  final String? companyName;
  final String? username;
  final String? emailAddress;
  final String? password;
  final String? country;
  final String? state;
  final String? city;
  final String? years;
  final String? description;
  final Url? website;

  CompInfo({
    required this.consultantName,
    required this.companyName,
    required this.emailAddress,
    required this.username,
    required this.password,
    required this.country,
    required this.state,
    required this.city,
    required this.years,
    required this.description,
    required this.website,
  });
}
