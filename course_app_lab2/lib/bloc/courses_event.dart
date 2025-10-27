import 'package:equatable/equatable.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();
  @override
  List<Object?> get props => [];
}

class CoursesRequested extends CoursesEvent {
  const CoursesRequested();
}

class CategorySelected extends CoursesEvent {
  final String category;
  const CategorySelected(this.category);
  @override
  List<Object?> get props => [category];
}
