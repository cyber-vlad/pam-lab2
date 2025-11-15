// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedDto _$FeedDtoFromJson(Map<String, dynamic> json) => FeedDto(
  user: json['user'] == null
      ? null
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  suggestions: (json['suggestions'] as List<dynamic>?)
      ?.map((e) => LiteCourseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  topCourses: (json['topCourses'] as List<dynamic>?)
      ?.map((e) => LiteCourseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  continueWatching: (json['continueWatching'] as List<dynamic>?)
      ?.map((e) => ContinueWatchingDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FeedDtoToJson(FeedDto instance) => <String, dynamic>{
  'user': instance.user,
  'categories': instance.categories,
  'suggestions': instance.suggestions,
  'topCourses': instance.topCourses,
  'continueWatching': instance.continueWatching,
};
