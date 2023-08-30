import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_image.g.dart';

@JsonSerializable()
class CatImage extends Equatable{

  final String id;
  final String url;
  final int width;
  final int height;

  CatImage(this.id, this.url, this.width, this.height);

  @override
  List<Object?> get props => [id, url, width, height];

  factory CatImage.fromJson(Map<String, dynamic> json) => _$CatImageFromJson(json);

}