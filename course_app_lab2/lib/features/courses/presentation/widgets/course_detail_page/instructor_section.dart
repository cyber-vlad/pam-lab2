import 'package:flutter/material.dart';
import 'package:course_app_lab2/features/courses/domain/entities/course.dart';

class InstructorSection extends StatelessWidget {
  final Instructor instructor;
  const InstructorSection({super.key, required this.instructor});

  @override
  Widget build(BuildContext context) {
    final isNetwork = instructor.imageUrl.startsWith('http');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Instructor',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF00434C)),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: isNetwork
                  ? Image.network(instructor.imageUrl,
                      width: 64, height: 64, fit: BoxFit.cover)
                  : Image.asset(instructor.imageUrl,
                      width: 64, height: 64, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(instructor.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF00434C))),
                  const SizedBox(height: 2),
                  Text(instructor.title,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF6B7A82))),
                  const SizedBox(height: 6),
                  Text(instructor.bio,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF33464D))),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
