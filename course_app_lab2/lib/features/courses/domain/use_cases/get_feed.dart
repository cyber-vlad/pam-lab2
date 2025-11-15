import '../repositories/courses_repository.dart';

class GetFeed {
  final CoursesRepository repository;
  GetFeed(this.repository);

  Future<Feed> call() => repository.getFeed();
}
