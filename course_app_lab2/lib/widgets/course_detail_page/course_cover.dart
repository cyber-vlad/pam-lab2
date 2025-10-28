import 'package:flutter/material.dart';
import 'package:course_app_lab2/models/course.dart';

class CourseCover extends StatelessWidget {
  final Course course;
  const CourseCover({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final isNetwork = course.imageUrl.startsWith('http');

    return Stack(
      alignment: Alignment.center,
      children: [
        isNetwork
            ? Image.network(course.imageUrl,
                width: double.infinity, height: 200, fit: BoxFit.cover)
            : Image.asset(course.imageUrl,
                width: double.infinity, height: 200, fit: BoxFit.cover),
        Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1,
              colors: [Color(0x60018697), Color(0xFF00434C)],
            ),
          ),
        ),
        Container(
          width: 41,
          height: 41,
          decoration: const BoxDecoration(
            color: Color(0xFFD9EFF2),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(Icons.play_arrow, size: 24, color: Color(0xFF00707E)),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Icon(Icons.label,
                    size: 16, color: Color(0xFF00707E)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
