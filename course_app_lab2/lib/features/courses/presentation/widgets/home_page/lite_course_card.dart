import 'package:flutter/material.dart';
import 'package:course_app_lab2/features/courses/domain/entities/lite_course.dart';

class LiteCourseCard extends StatelessWidget {
  final LiteCourse course;
  final VoidCallback? onTap;
  const LiteCourseCard({super.key, required this.course, this.onTap});

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(course.imageUrl, width: 160, height: 120, fit: BoxFit.cover),
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0,2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            const SizedBox(height: 8),
            Text(
              course.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xFF00434C),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              course.institute,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Color(0xFF6B7A82)),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Color(0xFF00707E)),
                const SizedBox(width: 4),
                Text(
                  course.rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1A6B78),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
