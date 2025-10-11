import 'package:course_app_lab2/widgets/home_page/header.dart';
import 'package:flutter/material.dart';
import 'package:course_app_lab2/pages/course_detail_page.dart';
import 'package:course_app_lab2/widgets/home_page/categories_section.dart';
import 'package:course_app_lab2/widgets/home_page/continue_watching_section.dart';
import 'package:course_app_lab2/widgets/home_page/suggestions_section.dart';
import 'package:course_app_lab2/widgets/home_page/top_courses_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 24),
              const ContinueWatchingSection(),
              const SizedBox(height: 24),
              const CategoriesSection(),
              const SizedBox(height: 24),
              SuggestionsSection(
                onCardTap: (course) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailPage(course: course),
                    ),
                  );
                },
              ),
              TopCoursesSection(
                onCardTap: (course) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailPage(course: course),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}