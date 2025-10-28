import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_app_lab2/bloc/courses_event.dart';
import 'package:course_app_lab2/bloc/courses_state.dart';
import 'package:course_app_lab2/data/courses_repository.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final CoursesRepository repository;

  CoursesBloc({required this.repository}) : super(const CoursesState()) {
    on<CoursesRequested>(_onRequested);
    on<CategorySelected>(_onCategorySelected);
  }

  Future<void> _onRequested(
    CoursesRequested event,
    Emitter<CoursesState> emit,
  ) async {
    emit(state.copyWith(status: CoursesStatus.loading));
    try {
      final payload = await repository.load();
      emit(state.copyWith(
        status: CoursesStatus.success,
        categories: payload.categories,
        selectedCategory:
            payload.categories.isNotEmpty ? payload.categories.first.id : null,
        suggestions: payload.suggestions,
        topCourses: payload.topCourses,
        continueWatching: payload.continueWatching,
        error: null,
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
