import '../../domain/repositories/courses_repository.dart';
import '../../domain/entities/course.dart';
import '../datasources/courses_remote_data_source.dart';
import 'package:course_app_lab2/core/error/failures.dart';
import 'package:course_app_lab2/core/error/exceptions.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesRemoteDataSource remote;

  Feed? _feedCache;
  Course? _courseCache;

  CoursesRepositoryImpl(this.remote);

  @override
  Future<Feed> getFeed() async {
    try {
      final dto = await remote.fetchFeed();
      final entity = dto.toEntity();
      _feedCache = entity;
      return entity;
    } on NetworkException {
      if (_feedCache != null) return _feedCache!;
      throw const NetworkFailure('Connection failed');
    } on ServerException catch (e) {
      throw ServerFailure(e.message, statusCode: e.statusCode);
    }
  }

  @override
  Future<Course> getCourseDetails() async {
    try {
      if (_courseCache != null) return _courseCache!;
      final dto = await remote.fetchCourseDetails();
      final entity = dto.toEntity();
      _courseCache = entity;
      return entity;
    } on NetworkException {
      if (_courseCache != null) return _courseCache!;
      throw const NetworkFailure('Connection failed');
    } on ServerException catch (e) {
      throw ServerFailure(e.message, statusCode: e.statusCode);
    }
  }
}
