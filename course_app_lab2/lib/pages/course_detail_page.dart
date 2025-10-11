import 'package:course_app_lab2/widgets/course_detail_page/skills_section.dart';
import 'package:flutter/material.dart';
import 'package:course_app_lab2/models/course.dart';
import 'package:course_app_lab2/widgets/course_detail_page/course_header.dart';
import 'package:course_app_lab2/widgets/course_detail_page/details_section.dart';
import 'package:course_app_lab2/widgets/course_detail_page/enroll_button.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    course.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 1,
                        colors: [
                          Color(0x60018697),
                          Color(0xFF00434C),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 41,
                    height: 41,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9EFF2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 24,
                        color: const Color(0xFF00707E),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    right: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(4),
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Icon(
                            Icons.label,
                            size: 16,
                            color: Color(0xFF00707E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                    const SizedBox(height: 24),
                    EnrollButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}