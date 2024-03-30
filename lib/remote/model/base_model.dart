import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  int? id;
  String? title;
  String? body;
  int? userId;

  BaseModel({this.id, this.title, this.body, this.userId});

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

}