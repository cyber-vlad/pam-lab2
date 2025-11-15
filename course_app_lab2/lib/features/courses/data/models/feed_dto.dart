import 'package:json_annotation/json_annotation.dart';
import '../../domain/repositories/courses_repository.dart';
import 'category_dto.dart';
import 'lite_course_dto.dart';
import 'continue_watching_dto.dart';
import 'user_dto.dart';

part 'feed_dto.g.dart';

@JsonSerializable()
class FeedDto {
  final UserDto? user;
  final List<CategoryDto>? categories;
  final List<LiteCourseDto>? suggestions;
  final List<LiteCourseDto>? topCourses;
  final List<ContinueWatchingDto>? continueWatching;

  FeedDto({
    this.user,
    this.categories,
    this.suggestions,
    this.topCourses,
    this.continueWatching,
  });

  factory FeedDto.fromJson(Map<String, dynamic> json) => _$FeedDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FeedDtoToJson(this);

  Feed toEntity() => Feed(
        user: user?.toEntity(),
        categories: (categories ?? const []).map((e) => e.toEntity()).toList(),
        suggestions: (suggestions ?? const []).map((e) => e.toEntity()).toList(),
        topCourses: (topCourses ?? const []).map((e) => e.toEntity()).toList(),
        continueWatching:
            (continueWatching ?? const []).map((e) => e.toEntity()).toList(),
      );
}
