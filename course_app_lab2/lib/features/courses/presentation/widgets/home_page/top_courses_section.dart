import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_state.dart';
import 'package:course_app_lab2/features/courses/domain/entities/lite_course.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/home_page/course_card.dart';

class TopCoursesSection extends StatelessWidget {
  final void Function(LiteCourse)? onCardTap;
  const TopCoursesSection({super.key, this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Courses',
          style: TextStyle(
            color: Color(0xFF00434C),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        BlocBuilder<CoursesBloc, CoursesState>(
          builder: (context, state) {
            if (state.status == CoursesStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == CoursesStatus.failure) {
              return Center(child: Text(state.error ?? 'Error'));
            }
            final list = state.topCourses;
            return SizedBox(
              height: 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final course = list[index];
                  return CourseCard(
                    title: course.title,
                    institute: course.institute,
                    rating: course.rating.toStringAsFixed(1),
                    imageUrl: course.imageUrl,
                    onTap: onCardTap == null ? null : () => onCardTap!(course),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
