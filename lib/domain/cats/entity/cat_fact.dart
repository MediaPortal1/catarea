import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatFact extends Equatable{

  @JsonKey(name: '_id')
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String createdAt;

  const CatFact(this.id, this.text, this.createdAt);

  @override
  List<Object?> get props => [id, text, createdAt];

  factory CatFact.fromJson(Map<String, dynamic> json) => _$CatFactFromJson(json);
}