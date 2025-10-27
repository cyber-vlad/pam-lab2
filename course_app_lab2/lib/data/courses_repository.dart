import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:course_app_lab2/models/course.dart';

class CoursesRepository {

  Future<CoursesPayload> load() async {
    // se incarc datele din json (async)
    final raw = await rootBundle.loadString('assets/data/courses.json'); 

    // textul json se transorma intro structura de date Map (cheie-valoare)
    final Map<String, dynamic> data = jsonDecode(raw);

    final categories = (data['categories'] as List?)?.cast<String>() ?? const [];

    final suggestions =
        Course.listFromJson((data['suggestions'] as List?) ?? const []);
    final topCourses =
        Course.listFromJson((data['topCourses'] as List?) ?? const []);

    final continueWatchingRaw =
        (data['continueWatching'] as List?) ?? const [];
    final continueWatching = continueWatchingRaw
        .map((e) => ContinueWatchingItem.fromJson(e))
        .toList();

    return CoursesPayload(
      categories: categories,
      suggestions: suggestions,
      topCourses: topCourses,
      continueWatching: continueWatching,
    );
  }
}

class ContinueWatchingItem {
  final String title;
  final String institute;
  final double progress;
  final String rating;
  final String imageUrl;

  ContinueWatchingItem({
    required this.title,
    required this.institute,
    required this.progress,
    required this.rating,
    required this.imageUrl,
  });

  factory ContinueWatchingItem.fromJson(Map<String, dynamic> json) =>
      ContinueWatchingItem(
        title: json['title'],
        institute: json['institute'],
        progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
        rating: json['rating'],
        imageUrl: json['imageUrl'],
      );
}

class CoursesPayload {
  final List<String> categories;
  final List<Course> suggestions;
  final List<Course> topCourses;
  final List<ContinueWatchingItem> continueWatching;

  CoursesPayload({
    required this.categories,
    required this.suggestions,
    required this.topCourses,
    required this.continueWatching,
  });
}
