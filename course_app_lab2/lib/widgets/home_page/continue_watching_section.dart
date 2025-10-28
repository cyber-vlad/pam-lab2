import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_app_lab2/widgets/home_page/continue_watching_card.dart';
import 'package:course_app_lab2/bloc/courses_bloc.dart';
import 'package:course_app_lab2/bloc/courses_state.dart';

class ContinueWatchingSection extends StatelessWidget {
  const ContinueWatchingSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Continue Watching',
          style: TextStyle(
            color: Color(0xFF00434C),
            fontSize: 18,
            fontFamily: 'Plus Jakarta Sans',
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
            return Column(
              children: state.continueWatching.map((cw) {
                return Center(
                  child: ContinueWatchingCard(
                    title: cw.title,
                    institute: cw.institute,
                    progress: cw.progress,
                    rating: cw.rating.toString(),
                    imageUrl: cw.imageUrl,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
