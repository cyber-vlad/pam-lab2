import '../entities/course.dart';
import '../repositories/courses_repository.dart';

class GetCourseDetails {
  final CoursesRepository repository;
  GetCourseDetails(this.repository);

  Future<Course> call() => repository.getCourseDetails();
}
