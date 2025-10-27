import 'package:equatable/equatable.dart';
import 'package:course_app_lab2/models/course.dart';
import 'package:course_app_lab2/data/courses_repository.dart';

enum CoursesStatus { initial, loading, success, failure }

class CoursesState extends Equatable {
  final CoursesStatus status;
  final List<String> categories;
  final String? selectedCategory;
  final List<Course> suggestions;
  final List<Course> topCourses;
  final List<ContinueWatchingItem> continueWatching;
  final String? error;

  const CoursesState({
    this.status = CoursesStatus.initial,
    this.categories = const [],
    this.selectedCategory,
    this.suggestions = const [],
    this.topCourses = const [],
    this.continueWatching = const [],
    this.error,
  });

  CoursesState copyWith({
    CoursesStatus? status,
    List<String>? categories,
    String? selectedCategory,
    List<Course>? suggestions,
    List<Course>? topCourses,
    List<ContinueWatchingItem>? continueWatching,
    String? error,
  }) {
    return CoursesState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      suggestions: suggestions ?? this.suggestions,
      topCourses: topCourses ?? this.topCourses,
      continueWatching: continueWatching ?? this.continueWatching,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        categories,
        selectedCategory,
        suggestions,
        topCourses,
        continueWatching,
        error,
      ];
}
