import 'package:flutter/material.dart';
import 'package:course_app_lab2/features/courses/domain/entities/course.dart';

class CourseHeader extends StatelessWidget {
  final Course course;

  const CourseHeader({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: 343,
              child: Text(
                course.title,
                style: TextStyle(
              color: const Color(0xFF00434C),
              fontSize: 21,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: 1.05,
            ),
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 31,
            child: Text(
              course.institute,
              style: const TextStyle(
                color: Color(0xFF00707E),
                fontSize: 14,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.28,
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 54,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.people,
                  size: 12,
                  color: Color(0xFF00707E),
                ),
                const SizedBox(width: 3),
                Text(
                  '${course.enrolledStudents} students already enrolled', 
                  style: TextStyle(
                    color: Color(0xFF00707E),
                    fontSize: 7.64,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 300,
            top: 41,
            child: Text(
              course.price,
              style: const TextStyle(
                color: Color(0xFF00434C),
                fontSize: 21,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: 1.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}