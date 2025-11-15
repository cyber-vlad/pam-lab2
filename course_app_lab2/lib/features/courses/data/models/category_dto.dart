import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/category.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto {
  final String? id;
  final String? name;

  CategoryDto({this.id, this.name});

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  Category toEntity() => Category(id: id ?? '', name: name ?? '');
}
