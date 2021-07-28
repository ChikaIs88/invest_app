import 'package:json_annotation/json_annotation.dart';

part 'prefrence_user_model.g.dart';
@JsonSerializable()
class PrefrenceUserModel {

   factory PrefrenceUserModel.fromJson(Map<String, dynamic> json) =>
      _$PrefrenceUserModelFromJson(json);
  PrefrenceUserModel(this.amount, this.rate, this.sector, this.type);
  final int? amount;
  final int? rate;
  final String? sector;
  final String? type;

    Map<String, dynamic> toJson() => _$PrefrenceUserModelToJson(this);
}
