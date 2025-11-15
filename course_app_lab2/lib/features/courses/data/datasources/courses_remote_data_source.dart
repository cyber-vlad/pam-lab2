import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../models/feed_dto.dart';
import '../models/course_details_dto.dart';

abstract class CoursesRemoteDataSource {
  Future<FeedDto> fetchFeed();
  Future<CourseDetailsDto> fetchCourseDetails();
}

class CoursesRemoteDataSourceImpl implements CoursesRemoteDataSource {
  final Dio _dio;

  CoursesRemoteDataSourceImpl(DioClient client) : _dio = client.dio;

  @override
  Future<FeedDto> fetchFeed() async {
    try {
      final res = await _dio.get('/v1/feed');
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        return FeedDto.fromJson(res.data as Map<String, dynamic>);
      }
      throw ServerException('Unexpected response', statusCode: res.statusCode);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw NetworkException('No internet connection');
      }
      throw ServerException(e.message ?? 'Server error',
          statusCode: e.response?.statusCode);
    }
  }

  @override
  Future<CourseDetailsDto> fetchCourseDetails() async {
    try {
      final res = await _dio.get('/v1/feed/details');
      if (res.statusCode == 200 && res.data is Map<String, dynamic>) {
        return CourseDetailsDto.fromJson(res.data as Map<String, dynamic>);
      }
      throw ServerException('Unexpected response', statusCode: res.statusCode);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw NetworkException('No internet connection');
      }
      throw ServerException(e.message ?? 'Server error',
          statusCode: e.response?.statusCode);
    }
  }
}
