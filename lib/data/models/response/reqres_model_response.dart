import 'package:json_annotation/json_annotation.dart';

part 'reqres_model_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReqresModelResponse {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Data> data;
  Support support;

  ReqresModelResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory ReqresModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ReqresModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReqresModelResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);

  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
