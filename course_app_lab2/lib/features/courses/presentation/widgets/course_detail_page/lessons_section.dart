import 'package:flutter/material.dart';
import 'package:course_app_lab2/features/courses/domain/entities/course.dart';

class LessonsSection extends StatelessWidget {
  final List<Lesson> lessons;
  const LessonsSection({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    if (lessons.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lessons',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF00434C)),
        ),
        const SizedBox(height: 10),
        ...lessons.map((l) => ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(l.isPreview ? Icons.lock_open : Icons.lock,
                  color: const Color(0xFF00707E), size: 18),
              title: Text(l.title,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF00434C),
                      fontWeight: FontWeight.w600)),
              trailing: Text(l.duration,
                  style: const TextStyle(color: Color(0xFF6B7A82))),
            )),
      ],
    );
  }
}
