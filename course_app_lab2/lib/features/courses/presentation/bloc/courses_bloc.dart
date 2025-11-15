import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_event.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_state.dart';
import 'package:course_app_lab2/features/courses/domain/use_cases/get_feed.dart';


class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final GetFeed getFeed;

  CoursesBloc({required this.getFeed}) : super(const CoursesState()) {
    on<CoursesRequested>(_onRequested);
    on<CategorySelected>(_onCategorySelected);
  }

  Future<void> _onRequested(
    CoursesRequested event,
    Emitter<CoursesState> emit,
  ) async {
    emit(state.copyWith(status: CoursesStatus.loading, error: null));
    try {
      final feed = await getFeed();
      emit(state.copyWith(
        status: CoursesStatus.success,
        user: feed.user,
        categories: feed.categories,
        suggestions: feed.suggestions,
        topCourses: feed.topCourses,
        continueWatching: feed.continueWatching
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CoursesStatus.failure,
        error: e.toString(),
      ));
    }
  }

  void _onCategorySelected(
    CategorySelected event,
    Emitter<CoursesState> emit,
  ) {
    emit(state.copyWith(selectedCategory: event.categoryId));
  }
}