// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lite_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiteCourseDto _$LiteCourseDtoFromJson(Map<String, dynamic> json) =>
    LiteCourseDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      institute: json['institute'] as String?,
      rating: json['rating'] as num?,
      image: json['image'] as String?,
      imageUrl: json['imageUrl'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$LiteCourseDtoToJson(LiteCourseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'institute': instance.institute,
      'rating': instance.rating,
      'image': instance.image,
      'imageUrl': instance.imageUrl,
      'thumbnail': instance.thumbnail,
    };
