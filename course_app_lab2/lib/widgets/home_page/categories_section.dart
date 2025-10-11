import 'package:course_app_lab2/widgets/home_page/category_button.dart';
import 'package:flutter/material.dart';

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
        const SizedBox(height: 5),
        SizedBox(
          height: 34,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CategoryButton(label: 'Graphic Design'),
              SizedBox(width: 8),
              CategoryButton(label: 'User Interface'),
              SizedBox(width: 8),
              CategoryButton(label: 'User Experience'),
            ],
          ),
        ),
      ],
    );
  }
}