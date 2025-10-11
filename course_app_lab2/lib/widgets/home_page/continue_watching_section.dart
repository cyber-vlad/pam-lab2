import 'package:flutter/material.dart';
import 'package:course_app_lab2/widgets/home_page/continue_watching_card.dart';

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
            letterSpacing: 0.90,
          ),
        ),
        const Center(
          child: ContinueWatchingCard(
            title: 'UI/UX Design Essentials',
            institute: 'Tech Innovations University',
            progress: 0.79,
            rating: '4.9',
            imageUrl: 'assets/images/ui-ux.png',
          ),
        ),
        const Center(
          child: ContinueWatchingCard(
            title: 'Graphic Design Fundamentals',
            institute: 'Creative Arts Institute',
            progress: 0.35,
            rating: '4.7',
            imageUrl: 'assets/images/graphic-design.jpg',
          ),
        ),
      ],
    );
  }
}