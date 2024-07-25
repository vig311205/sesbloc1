import 'package:json_annotation/json_annotation.dart';

part 'todomodel.g.dart';

@JsonSerializable()
class TodoModel {
  int? id;
  String? title;
  String? description;

  TodoModel({this.id, this.title, this.description});

  factory TodoModel.fromJson(json) => _$TodoModelFromJson(json);

  Map<String, dynamic> tojson(TodoModel todo) => _$TodoModelToJson(todo);
}
