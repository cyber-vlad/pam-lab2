import 'package:equatable/equatable.dart';

import 'package:course_app_lab2/features/courses/domain/entities/category.dart';
import 'package:course_app_lab2/features/courses/domain/entities/lite_course.dart';
import 'package:course_app_lab2/features/courses/domain/entities/continue_watching_item.dart';
import 'package:course_app_lab2/features/courses/domain/entities/user.dart';

enum CoursesStatus { initial, loading, success, failure }

class CoursesState extends Equatable {
  final CoursesStatus status;
  final User? user;
  final List<Category> categories;
  final String? selectedCategoryId;
  final List<LiteCourse> suggestions;
  final List<LiteCourse> topCourses;
  final List<ContinueWatchingItem> continueWatching;
  final String? error;

  const CoursesState({
    this.status = CoursesStatus.initial,
    this.user,
    this.categories = const [],
    this.selectedCategoryId,
    this.suggestions = const [],
    this.topCourses = const [],
    this.continueWatching = const [],
    this.error,
  });

  CoursesState copyWith({
    CoursesStatus? status,
    User? user,
    List<Category>? categories,
    String? selectedCategory,
    List<LiteCourse>? suggestions,
    List<LiteCourse>? topCourses,
    List<ContinueWatchingItem>? continueWatching,
    String? error,
  }) {
    return CoursesState(
      status: status ?? this.status,
      user: user ?? this.user,
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
        user,
        categories,
        selectedCategoryId,
        suggestions,
        topCourses,
        continueWatching,
        error,
      ];
}