import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:course_app_lab2/models/category.dart';
import 'package:course_app_lab2/models/lite_course.dart';
import 'package:course_app_lab2/models/course.dart';

class CoursesRepository {
  Course? _cachedCourse;

  Future<CoursesPayload> load() async {
    final raw = await rootBundle.loadString('assets/data/courses.json');

    final Map<String, dynamic> data = jsonDecode(raw);

    final categories = Category.listFromJson(
      (data['categories'] as List?) ?? const [],
    );

    final suggestions =
        LiteCourse.listFromJson((data['suggestions'] as List?) ?? const []);
    final topCourses =
        LiteCourse.listFromJson((data['topCourses'] as List?) ?? const []);

    final continueWatchingRaw = (data['continueWatching'] as List?) ?? const [];
    final continueWatching = continueWatchingRaw
        .map((e) => ContinueWatchingItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return CoursesPayload(
      categories: categories,
      suggestions: suggestions,
      topCourses: topCourses,
      continueWatching: continueWatching,
    );
  }

  Future<Course> loadDetailedCourse() async {
    if (_cachedCourse != null) return _cachedCourse!;

    final raw = await rootBundle.loadString('assets/data/course_details.json');
    final Map<String, dynamic> json = jsonDecode(raw);

    final Map<String, dynamic> src =
        (json['details']?['course'] as Map<String, dynamic>?) ?? json;

    final Map<String, dynamic> cd =
        (src['courseDetails'] as Map<String, dynamic>?) ?? const {};

    final skills = (src['skills'] as List?)?.cast<String>() ?? const [];

    final instructor = (src['instructor'] is Map<String, dynamic>)
        ? Instructor.fromJson(src['instructor'] as Map<String, dynamic>)
        : null;

    final lessons = (src['lessons'] as List?)
            ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const <Lesson>[];

    final related = (src['relatedCourses'] as List?)
            ?.map((e) => RelatedCourse.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const <RelatedCourse>[];

    _cachedCourse = Course(
      id: src['id'] ?? '',
      title: src['title'] ?? '',
      institute: src['institute'] ?? '',
      rating: (src['rating'] ?? '').toString(),
      imageUrl: (src['thumbnail'] ?? src['image'] ?? src['imageUrl'] ?? '') as String,
      price: '${src['price']} ${src['currency'] ?? ''}'.trim(),
      description: src['description'] ?? '',
      lectures: cd['lectures'] ??
          (src['lectures'] != null ? '${src['lectures']} Lectures' : ''),
      learningTime: cd['learningTime'] ?? (src['duration'] ?? ''),
      certification: cd['certification'] ?? (src['certification'] ?? ''),
      skills: skills,
      enrolledStudents: (src['enrolledStudents'] ?? '').toString(),
      instructor: instructor,
      lessons: lessons,
      relatedCourses: related,
    );

    return _cachedCourse!;
  }
}

class ContinueWatchingItem {
  final String id;
  final String title;
  final String institute;
  final double progress;
  final double rating;
  final String imageUrl;

  ContinueWatchingItem({
    required this.id,
    required this.title,
    required this.institute,
    required this.progress,
    required this.rating,
    required this.imageUrl,
  });

  factory ContinueWatchingItem.fromJson(Map<String, dynamic> json) =>
      ContinueWatchingItem(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        institute: json['institute'] ?? '',
        progress: ((json['progress'] as num?)?.toDouble() ?? 0.0) / 100.0,
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
        imageUrl: (json['image'] ?? json['imageUrl'] ?? '') as String,
      );
}

class CoursesPayload {
  final List<Category> categories;
  final List<LiteCourse> suggestions;
  final List<LiteCourse> topCourses;
  final List<ContinueWatchingItem> continueWatching;

  CoursesPayload({
    required this.categories,
    required this.suggestions,
    required this.topCourses,
    required this.continueWatching,
  });
}
