import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_state.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_event.dart';
import 'package:course_app_lab2/features/courses/presentation/widgets/home_page/category_button.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Categories',
              style: TextStyle(
                color: Color(0xFF00434C),
                fontSize: 18,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                color: Color(0xFF219EBC),
                fontSize: 13,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 34,
          child: BlocBuilder<CoursesBloc, CoursesState>(
            builder: (context, state) {
              if (state.status == CoursesStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.status == CoursesStatus.failure) {
                return Center(child: Text(state.error ?? 'Error'));
              }
              final cats = state.categories;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cats.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final c = cats[index];
                  return GestureDetector(
                    onTap: () => context
                        .read<CoursesBloc>()
                        .add(CategorySelected(c.id)),
                    child: CategoryButton(
                      label: c.name,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
