import 'package:json_annotation/json_annotation.dart';

part 'investor_user_model.g.dart';

@JsonSerializable()
class InvestorUserModel {
  factory InvestorUserModel.fromJson(Map<String, dynamic> json) =>
      _$InvestorUserModelFromJson(json);

  InvestorUserModel(
    this.email,
    this.first_name,
    this.phone_number,
    this.last_name,
    this.username,
  );

  final String? email;
  final String? first_name;
  final String? phone_number;
  final String? last_name;
  final String? username;

  Map<String, dynamic> toJson() => _$InvestorUserModelToJson(this);
}
