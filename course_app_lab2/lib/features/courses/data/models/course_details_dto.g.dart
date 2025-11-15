// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstructorDto _$InstructorDtoFromJson(Map<String, dynamic> json) =>
    InstructorDto(
      name: json['name'] as String?,
      title: json['title'] as String?,
      bio: json['bio'] as String?,
      image: json['image'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$InstructorDtoToJson(InstructorDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'bio': instance.bio,
      'image': instance.image,
      'imageUrl': instance.imageUrl,
    };

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) => LessonDto(
  id: json['id'] as String?,
  title: json['title'] as String?,
  duration: json['duration'] as String?,
  isPreview: json['isPreview'] as bool?,
);

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'duration': instance.duration,
  'isPreview': instance.isPreview,
};

RelatedCourseDto _$RelatedCourseDtoFromJson(Map<String, dynamic> json) =>
    RelatedCourseDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      institute: json['institute'] as String?,
      image: json['image'] as String?,
      imageUrl: json['imageUrl'] as String?,
      thumbnail: json['thumbnail'] as String?,
      rating: json['rating'],
      price: json['price'] as num?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$RelatedCourseDtoToJson(RelatedCourseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'institute': instance.institute,
      'image': instance.image,
      'imageUrl': instance.imageUrl,
      'thumbnail': instance.thumbnail,
      'rating': instance.rating,
      'price': instance.price,
      'currency': instance.currency,
    };

CourseDetailsDto _$CourseDetailsDtoFromJson(Map<String, dynamic> json) =>
    CourseDetailsDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      institute: json['institute'] as String?,
      rating: json['rating'],
      thumbnail: json['thumbnail'] as String?,
      image: json['image'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: json['price'] as num?,
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      lectures: json['lectures'] as num?,
      duration: json['duration'] as String?,
      courseDetails: json['courseDetails'] as Map<String, dynamic>?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      enrolledStudents: json['enrolledStudents'],
      instructor: json['instructor'] == null
          ? null
          : InstructorDto.fromJson(json['instructor'] as Map<String, dynamic>),
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedCourses: (json['relatedCourses'] as List<dynamic>?)
          ?.map((e) => RelatedCourseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDetailsDtoToJson(CourseDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'institute': instance.institute,
      'rating': instance.rating,
      'thumbnail': instance.thumbnail,
      'image': instance.image,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'currency': instance.currency,
      'description': instance.description,
      'lectures': instance.lectures,
      'duration': instance.duration,
      'courseDetails': instance.courseDetails,
      'skills': instance.skills,
      'enrolledStudents': instance.enrolledStudents,
      'instructor': instance.instructor,
      'lessons': instance.lessons,
      'relatedCourses': instance.relatedCourses,
    };
