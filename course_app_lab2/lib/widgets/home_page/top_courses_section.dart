import 'package:flutter/material.dart';
import 'package:course_app_lab2/widgets/home_page/course_card.dart';
import 'package:course_app_lab2/models/course.dart';

class TopCoursesSection extends StatelessWidget {
  final Function(Course) onCardTap;

  TopCoursesSection({super.key, required this.onCardTap});

  final List<Course> topCourses = [
    Course(
      title: 'Animation and Motion Graphics',
      institute: 'Institute of Digital Arts',
      rating: '4.7',
      imageUrl: 'assets/images/motion.jpg',
      price: '45\$',
      description: 'Institute of Digital Arts\' Animation and Motion Graphics course explores the art of creating dynamic visual effects...',
      lectures: '40+ Lectures',
      learningTime: '5 Weeks',
      certification: 'Online Certificate',
      skills: ['Animation', 'Motion graphics', 'Digital storytelling', 'Visual effects'],
    ),
    Course(
      title: 'Game Design and Development',
      institute: 'Development Academy',
      rating: '4.4',
      imageUrl: 'assets/images/game.jpg',
      price: '50\$',
      description: 'Development Academy\'s Game Design and Development course covers the fundamentals of game creation...',
      lectures: '60+ Lectures',
      learningTime: '6 Weeks',
      certification: 'Online Certificate',
      skills: ['Game design', 'Level design', 'Game coding', 'Development tools'],
    ),
    Course(
      title: 'Product Design and Innovation',
      institute: 'Product Design Institute',
      rating: '4.9',
      imageUrl: 'assets/images/product.jpg',
      price: '40\$',
      description: 'Product Design Institute\'s Product Design and Innovation course explores the process of creating innovative products...',
      lectures: '45+ Lectures',
      learningTime: '4 Weeks',
      certification: 'Online Certificate',
      skills: ['Product design', 'Design thinking', 'Prototyping', 'User-centered design'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Top Courses',
              style: TextStyle(
                color: Color(0xFF00434C),
                fontSize: 18,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.90,
              ),
            ),
            Text(
              'See All',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6C6C6C),
                fontSize: 10,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                letterSpacing: 0.20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: topCourses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final course = topCourses[index];
              return GestureDetector(
                onTap: () => onCardTap(course),
                child: CourseCard(
                  title: course.title,
                  institute: course.institute,
                  rating: course.rating,
                  imageUrl: course.imageUrl,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}