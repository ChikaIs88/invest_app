// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investor_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorUserModel _$InvestorUserModelFromJson(Map<String, dynamic> json) {
  return InvestorUserModel(
    json['email'] as String?,
    json['first_name'] as String?,
    json['phone_number'] as String?,
    json['last_name'] as String?,
    json['username'] as String?,
  );
}

Map<String, dynamic> _$InvestorUserModelToJson(InvestorUserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.first_name,
      'phone_number': instance.phone_number,
      'last_name': instance.last_name,
      'username': instance.username,
    };
