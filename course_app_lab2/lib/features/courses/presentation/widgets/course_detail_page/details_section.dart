import 'package:flutter/material.dart';
import 'package:course_app_lab2/features/courses/domain/entities/course.dart';

class DetailsSection extends StatelessWidget {
  final Course course;

  const DetailsSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    const int maxLength = 300;
    String displayText = course.description;
    if (course.description.length > maxLength) {
      displayText = '${course.description.substring(0, maxLength)} ';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Details',
          style: const TextStyle(
            color: Color(0xFF00707E),
            fontSize: 18,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.90,
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: displayText,
                style: const TextStyle(
                  color: Color(0xFF6C6C6C),
                  fontSize: 11,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.17,
                ),
              ),
              if (course.description.length > maxLength)
                const TextSpan(
                  text: 'Read More... ',
                  style: TextStyle(
                    color: Color(0xFF00434C),
                    fontSize: 11,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.17,
                  ),
                ),
            ],
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow(Icons.ondemand_video, 'Lectures', course.lectures),
            const SizedBox(height: 6),
            _infoRow(Icons.access_time, 'Learning Time', course.learningTime),
            const SizedBox(height: 6),
            _infoRow(Icons.card_membership, 'Certification', course.certification),
          ],
        ),
      ],
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        const SizedBox(width: 25),
        Icon(icon, size: 15, color: const Color(0xFF00707E)),
        const SizedBox(width: 8),
        SizedBox(
          width: 200,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF00434C),
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.70,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF6C6C6C),
              fontSize: 12,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.60,
            ),
          ),
        ),
      ],
    );
  }
}
