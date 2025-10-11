import 'package:flutter/material.dart';
import 'package:course_app_lab2/widgets/home_page/course_card.dart';
import 'package:course_app_lab2/models/course.dart';

class SuggestionsSection extends StatelessWidget {
  final Function(Course) onCardTap;

  SuggestionsSection({super.key, required this.onCardTap});

  final List<Course> suggestionCourses = [
    Course(
      title: 'Typography and Layout Design',
      institute: 'Visual Communication College',
      rating: '4.7',
      imageUrl: 'assets/images/typography.jpg',
      price: '35\$',
      description: 'Visual Communication College\'s Typography and Layout Design course explores the art and science of typography and layout composition. Learn how to effectively use typefaces, hierarchy, alignment, and grid systems to create visually compelling designs. Gain hands-on experience in editorial design, branding, and digital layouts.',
      lectures: '50+ Lectures',
      learningTime: '4 Weeks',
      certification: 'Online Certificate',
      skills: ['Typography', 'Layout composition', 'Branding', 'Visual communication', 'Editorial design'],
    ),
    Course(
      title: 'Branding and Identity Design',
      institute: 'Innovation and Design School',
      rating: '4.4',
      imageUrl: 'assets/images/branding.png',
      price: '40\$',
      description: 'Innovation and Design School\'s Branding and Identity course explores the art of creating strong brand identities...',
      lectures: '45+ Lectures',
      learningTime: '4 Weeks',
      certification: 'Online Certificate',
      skills: ['Branding', 'Logo design', 'Color theory', 'Brand strategy'],
    ),
    Course(
      title: 'Web Design Fundamentals',
      institute: 'Web Development L',
      rating: '4.9',
      imageUrl: 'assets/images/web.jpg',
      price: '30\$',
      description: 'Web Development L\'s Web Design Fundamentals course covers the essentials of web design...',
      lectures: '55+ Lectures',
      learningTime: '5 Weeks',
      certification: 'Online Certificate',
      skills: ['HTML', 'CSS', 'Responsive design', 'Web development'],
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
              'Suggestions for You',
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
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: suggestionCourses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final course = suggestionCourses[index];
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
