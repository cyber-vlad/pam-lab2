import 'package:course_app_lab2/models/category.dart';
import 'package:equatable/equatable.dart';
import 'package:course_app_lab2/data/courses_repository.dart';
import 'package:course_app_lab2/models/lite_course.dart';

enum CoursesStatus { initial, loading, success, failure }

class CoursesState extends Equatable {
  final CoursesStatus status;
  final List<Category> categories;
  final String? selectedCategoryId;
  final List<LiteCourse> suggestions;
  final List<LiteCourse> topCourses;
  final List<ContinueWatchingItem> continueWatching;
  final String? error;

  const CoursesState({
    this.status = CoursesStatus.initial,
    this.categories = const [],
    this.selectedCategoryId,
    this.suggestions = const [],
    this.topCourses = const [],
    this.continueWatching = const [],
    this.error,
  });

  CoursesState copyWith({
    CoursesStatus? status,
    List<Category>? categories,
    String? selectedCategory,
    List<LiteCourse>? suggestions,
    List<LiteCourse>? topCourses,
    List<ContinueWatchingItem>? continueWatching,
    String? error,
  }) {
    return CoursesState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      selectedCategoryId: selectedCategory ?? this.selectedCategoryId,
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
        selectedCategoryId,
        suggestions,
        topCourses,
        continueWatching,
        error,
      ];
}
