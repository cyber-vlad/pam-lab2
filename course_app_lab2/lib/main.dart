import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart';
import 'features/courses/presentation/bloc/courses_bloc.dart';
import 'features/courses/presentation/bloc/courses_event.dart';
import 'features/courses/domain/use_cases/get_feed.dart';
import 'package:course_app_lab2/features/courses/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CoursesBloc(getFeed: sl<GetFeed>())
            ..add(const CoursesRequested()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
