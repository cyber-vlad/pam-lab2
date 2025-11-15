import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/lite_course.dart';

part 'lite_course_dto.g.dart';

@JsonSerializable()
class LiteCourseDto {
  final String? id;
  final String? title;
  final String? institute;
  final num? rating;
  @JsonKey(name: 'image')
  final String? image;
  final String? imageUrl;
  final String? thumbnail;

  LiteCourseDto({
    this.id,
    this.title,
    this.institute,
    this.rating,
    this.image,
    this.imageUrl,
    this.thumbnail,
  });

  factory LiteCourseDto.fromJson(Map<String, dynamic> json) =>
      _$LiteCourseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LiteCourseDtoToJson(this);

  LiteCourse toEntity() => LiteCourse(
        id: id ?? '',
        title: title ?? '',
        institute: institute ?? '',
        rating: (rating ?? 0).toDouble(),
        imageUrl: (image ?? imageUrl ?? thumbnail ?? ''),
      );
}
