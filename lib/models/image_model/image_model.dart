import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  ImageModel({this.id, this.url});

  final String? id;
  final String? url;

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
