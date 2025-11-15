import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:course_app_lab2/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:course_app_lab2/features/courses/presentation/bloc/courses_state.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((CoursesBloc b) => b.state.status);
    final user   = context.select((CoursesBloc b) => b.state.user);

    if (status == CoursesStatus.loading) {
      return const SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    if (status == CoursesStatus.failure) {
      return const SizedBox(
        height: 60,
        child: Center(child: Text('Failed to load user')),
      );
    }

    final name = user?.name ?? '';
    final notifications = user?.notifications ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Welcome ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                  TextSpan(
                    text: name,
                    style: const TextStyle(
                      color: Color(0xFF00434C),
                      fontSize: 20,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications,
                      size: 25, color: Color(0xFF00707E)),
                  onPressed: () {},
                ),
                if (notifications != 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        notifications.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 30,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
              width: 1,
            ),
          ),
          child: const Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color(0xFF898888),
                      fontSize: 12,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 0),
                    isCollapsed: true,
                  ),
                ),
              ),
              Icon(Icons.search, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
