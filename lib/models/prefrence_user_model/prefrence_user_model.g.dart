// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefrence_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrefrenceUserModel _$PrefrenceUserModelFromJson(Map<String, dynamic> json) {
  return PrefrenceUserModel(
    json['amount'] as dynamic,
    json['rate'] as dynamic,
    json['sector'] as String?,
    json['type'] as String?,
  );
}

Map<String, dynamic> _$PrefrenceUserModelToJson(PrefrenceUserModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'rate': instance.rate,
      'sector': instance.sector,
      'type': instance.type,
    };
