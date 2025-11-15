import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/course.dart';

part 'course_details_dto.g.dart';

@JsonSerializable()
class InstructorDto {
  final String? name;
  final String? title;
  final String? bio;
  final String? image;
  final String? imageUrl;

  InstructorDto({this.name, this.title, this.bio, this.image, this.imageUrl});

  factory InstructorDto.fromJson(Map<String, dynamic> json) =>
      _$InstructorDtoFromJson(json);
  Map<String, dynamic> toJson() => _$InstructorDtoToJson(this);

  Instructor toEntity() => Instructor(
        name: name ?? '',
        title: title ?? '',
        bio: bio ?? '',
        imageUrl: (image ?? imageUrl ?? ''),
      );
}

@JsonSerializable()
class LessonDto {
  final String? id;
  final String? title;
  final String? duration;
  final bool? isPreview;

  LessonDto({this.id, this.title, this.duration, this.isPreview});

  factory LessonDto.fromJson(Map<String, dynamic> json) =>
      _$LessonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LessonDtoToJson(this);

  Lesson toEntity() => Lesson(
        id: id ?? '',
        title: title ?? '',
        duration: duration ?? '',
        isPreview: isPreview ?? false,
      );
}

@JsonSerializable()
class RelatedCourseDto {
  final String? id;
  final String? title;
  final String? institute;
  final String? image;
  final String? imageUrl;
  final String? thumbnail;
  final dynamic rating;
  final num? price;
  final String? currency;

  RelatedCourseDto({
    this.id,
    this.title,
    this.institute,
    this.image,
    this.imageUrl,
    this.thumbnail,
    this.rating,
    this.price,
    this.currency,
  });

  factory RelatedCourseDto.fromJson(Map<String, dynamic> json) =>
      _$RelatedCourseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RelatedCourseDtoToJson(this);

  RelatedCourse toEntity() => RelatedCourse(
        id: id ?? '',
        title: title ?? '',
        institute: institute ?? '',
        imageUrl: (image ?? imageUrl ?? thumbnail ?? ''),
        rating: rating?.toString() ?? '',
        price: price != null ? '${price} ${currency ?? 'USD'}' : '',
      );
}

@JsonSerializable()
class CourseDetailsDto {
  final String? id;
  final String? title;
  final String? institute;
  final dynamic rating;
  final String? thumbnail;
  final String? image;
  final String? imageUrl;
  final num? price;
  final String? currency;
  final String? description;
  final num? lectures;
  final String? duration;

  final Map<String, dynamic>? courseDetails;

  final List<String>? skills;
  final dynamic enrolledStudents;
  final InstructorDto? instructor;
  final List<LessonDto>? lessons;
  final List<RelatedCourseDto>? relatedCourses;

  CourseDetailsDto({
    this.id,
    this.title,
    this.institute,
    this.rating,
    this.thumbnail,
    this.image,
    this.imageUrl,
    this.price,
    this.currency,
    this.description,
    this.lectures,
    this.duration,
    this.courseDetails,
    this.skills,
    this.enrolledStudents,
    this.instructor,
    this.lessons,
    this.relatedCourses,
  });

  factory CourseDetailsDto.fromJson(Map<String, dynamic> json) {
    final nested = json['course'];
    if (nested is Map<String, dynamic>) {
      return _$CourseDetailsDtoFromJson(nested);
    }

    final details = json['details'];
    if (details is Map<String, dynamic>) {
      final course = details['course'];
      if (course is Map<String, dynamic>) {
        return _$CourseDetailsDtoFromJson(course);
      }
    }

    return _$CourseDetailsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseDetailsDtoToJson(this);

  Course toEntity() {
    final String lecturesStr =
        (courseDetails?['lectures'] ??
                (lectures != null ? lectures.toString() : ''))
            .toString();

    final String learningTimeStr =
        (courseDetails?['learningTime'] ?? duration ?? '').toString();

    final String certificationStr =
        (courseDetails?['certification'] ?? '').toString();

    final String imageFinal = (thumbnail ?? image ?? imageUrl ?? '');

    return Course(
      id: id ?? '',
      title: title ?? '',
      institute: institute ?? '',
      rating: rating?.toString() ?? '',
      imageUrl: imageFinal,
      price: price != null ? '${price} ${currency ?? ''}'.trim() : '',
      description: description ?? '',
      lectures: lecturesStr,
      learningTime: learningTimeStr,
      certification: certificationStr,
      skills: skills ?? const [],
      enrolledStudents: enrolledStudents?.toString(),
      instructor: instructor?.toEntity(),
      lessons: (lessons ?? const []).map((e) => e.toEntity()).toList(),
      relatedCourses:
          (relatedCourses ?? const []).map((e) => e.toEntity()).toList(),
    );
  }
}
