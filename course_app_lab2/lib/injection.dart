import 'package:get_it/get_it.dart';
import 'core/network/dio_client.dart';
import 'features/courses/data/datasources/courses_remote_data_source.dart';
import 'features/courses/data/repositories/courses_repository_impl.dart';
import 'features/courses/domain/repositories/courses_repository.dart';
import 'package:course_app_lab2/features/courses/domain/use_cases/get_feed.dart';
import 'features/courses/domain/use_cases/get_course_details.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton(() => DioClient());

  sl.registerLazySingleton<CoursesRemoteDataSource>(
      () => CoursesRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<CoursesRepository>(
      () => CoursesRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetFeed(sl()));
  sl.registerLazySingleton(() => GetCourseDetails(sl()));
}
