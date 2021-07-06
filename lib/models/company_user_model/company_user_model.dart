import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'company_user_model.g.dart';

@JsonSerializable()
class CompanyUserModel {
  factory CompanyUserModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyUserModelFromJson(json);
  CompanyUserModel(
      {this.city,
      this.company_name,
      this.email,
      this.phone_number,
      this.state});

  final String? city;
  final String? company_name;
  final String? email;
  final String? phone_number;
  final String? state;

 Map<String, dynamic> toJson() => _$CompanyUserModelToJson(this);
}
