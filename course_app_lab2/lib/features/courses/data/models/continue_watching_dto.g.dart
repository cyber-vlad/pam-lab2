// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continue_watching_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContinueWatchingDto _$ContinueWatchingDtoFromJson(Map<String, dynamic> json) =>
    ContinueWatchingDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      institute: json['institute'] as String?,
      progress: json['progress'] as num?,
      rating: json['rating'] as num?,
      image: json['image'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ContinueWatchingDtoToJson(
  ContinueWatchingDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'institute': instance.institute,
  'progress': instance.progress,
  'rating': instance.rating,
  'image': instance.image,
  'imageUrl': instance.imageUrl,
};
