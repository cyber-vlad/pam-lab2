import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String institute;
  final String rating;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.title,
    required this.institute,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 152,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 130,
              height: 92,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 130,
                height: 92,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 98,
            top: 5,
            child: Container(
               width: 24,
              height: 24, 
              padding: const EdgeInsets.all(4),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Icon(
                Icons.label,
                size: 16,
                color: Color(0xFF00707E),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 96,
            child: SizedBox(
              width: 130,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF00434C),
                  fontSize: 11,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.22,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 128,
            child: SizedBox(
              width: 130,
              child: Text(
                institute,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF6C6C6C),
                  fontSize: 8,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 142,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  child: const Icon(
                    Icons.star,
                    size: 10,
                    color: Color(0xFF00707E),
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  rating,
                  style: const TextStyle(
                    color: Color(0xFF00434C),
                    fontSize: 6,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}