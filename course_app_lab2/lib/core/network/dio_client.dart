import 'package:dio/dio.dart';
import 'interceptors.dart';

class DioClient {
  final Dio dio;

  DioClient._internal(this.dio);

  factory DioClient({String baseUrl = 'https://test-api-jlbn.onrender.com'}) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Accept': 'application/json'},
    ));
    dio.interceptors.add(LoggingInterceptor());
    return DioClient._internal(dio);
  }
}
