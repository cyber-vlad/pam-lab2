import 'package:flutter/material.dart';
import 'package:course_app_lab2/features/courses/domain/entities/course.dart';
import 'package:course_app_lab2/features/courses/domain/entities/lite_course.dart';
import 'package:course_app_lab2/features/courses/presentation/pages/course_detail_page.dart';

class RelatedCoursesSection extends StatelessWidget {
  final List<RelatedCourse> related;
  const RelatedCoursesSection({super.key, required this.related});

  @override
  Widget build(BuildContext context) {
    if (related.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Related Courses',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF00434C)),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: related.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final rc = related[index];
              final isNet = rc.imageUrl.startsWith('http');
              final lite = LiteCourse(
                id: rc.id,
                title: rc.title,
                institute: rc.institute,
                rating: double.tryParse(rc.rating) ?? 0.0,
                imageUrl: rc.imageUrl,
              );

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourseDetailPage(header: lite),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Color(0x14000000), blurRadius: 8)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(10)),
                        child: isNet
                            ? Image.network(rc.imageUrl,
                                height: 100, width: 150, fit: BoxFit.cover)
                            : Image.asset(rc.imageUrl,
                                height: 100, width: 150, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rc.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF00434C))),
                            const SizedBox(height: 4),
                            Text(rc.institute,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xFF6B7A82))),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 14, color: Color(0xFF00707E)),
                                const SizedBox(width: 4),
                                Text(rc.rating,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF1A6B78),
                                        fontWeight: FontWeight.w600)),
                                const Spacer(),
                                Text(rc.price,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF00434C),
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
