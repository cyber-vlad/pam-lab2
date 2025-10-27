import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_app_lab2/pages/home.dart';
import 'package:course_app_lab2/bloc/courses_bloc.dart';
import 'package:course_app_lab2/bloc/courses_event.dart';
import 'package:course_app_lab2/data/courses_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CoursesBloc(repository: CoursesRepository())
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
