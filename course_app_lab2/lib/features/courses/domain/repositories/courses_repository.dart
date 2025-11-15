import '../entities/category.dart';
import '../entities/lite_course.dart';
import '../entities/continue_watching_item.dart';
import '../entities/course.dart';
import '../entities/user.dart';


class Feed {
  final User? user;
  final List<Category> categories;
  final List<LiteCourse> suggestions;
  final List<LiteCourse> topCourses;
  final List<ContinueWatchingItem> continueWatching;

  const Feed({
    this.user,
    this.categories = const [],
    this.suggestions = const [],
    this.topCourses = const [],
    this.continueWatching = const [],
  });
}
abstract class CoursesRepository {
  Future<Feed> getFeed();
  Future<Course> getCourseDetails();
}
