// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyUserModel _$CompanyUserModelFromJson(Map<String, dynamic> json) {
  return CompanyUserModel(
    city: json['city'] as String?,
    company_name: json['company_name'] as String?,
    email: json['email'] as String?,
    phone_number: json['phone_number'] as String?,
    state: json['state'] as String?,
  );
}

Map<String, dynamic> _$CompanyUserModelToJson(CompanyUserModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'company_name': instance.company_name,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'state': instance.state,
    };
