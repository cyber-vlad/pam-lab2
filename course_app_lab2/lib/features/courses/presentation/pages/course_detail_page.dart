import 'package:flutter/material.dart';
import 'package:course_app_lab2/injection.dart';
import 'package:course_app_lab2/features/courses/domain/entities/course.dart';
import 'package:course_app_lab2/features/courses/domain/entities/lite_course.dart';
import 'package:course_app_lab2/features/courses/domain/use_cases/get_course_details.dart';

import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/course_cover.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/course_header.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/details_section.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/skills_section.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/enroll_button.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/instructor_section.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/lessons_section.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/course_detail_page/related_courses_section.dart';

class CourseDetailPage extends StatelessWidget {
  final LiteCourse header;
  const CourseDetailPage({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    final getDetails = sl<GetCourseDetails>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<Course>(
          future: getDetails(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(child: Text('Error: ${snap.error}'));
            }
            final details = snap.data!;

            final course = Course(
              id: header.id,
              title: header.title,
              institute: header.institute,
              rating: header.rating.toStringAsFixed(1),
              imageUrl: header.imageUrl,
              price: details.price,
              description: details.description,
              lectures: details.lectures,
              learningTime: details.learningTime,
              certification: details.certification,
              skills: details.skills,
              enrolledStudents: details.enrolledStudents,
              instructor: details.instructor,
              lessons: details.lessons,
              relatedCourses: details.relatedCourses,
            );

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseCover(course: course),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CourseHeader(course: course),
                        const SizedBox(height: 16),
                        DetailsSection(course: course),
                        const SizedBox(height: 16),
                        SkillsSection(course: course),
                        if (course.instructor != null) ...[
                          const SizedBox(height: 24),
                          InstructorSection(instructor: course.instructor!),
                        ],
                        if (course.lessons.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          LessonsSection(lessons: course.lessons),
                        ],
                        if (course.relatedCourses.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          RelatedCoursesSection(related: course.relatedCourses),
                        ],
                        const SizedBox(height: 24),
                        const EnrollButton(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
