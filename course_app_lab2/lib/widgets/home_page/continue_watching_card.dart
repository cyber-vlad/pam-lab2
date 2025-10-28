  import 'package:flutter/material.dart';

  class ContinueWatchingCard extends StatelessWidget {
    final String title;
    final String institute;
    final double progress;
    final String imageUrl;
    final String rating;

    const ContinueWatchingCard({
      super.key,
      required this.title,
      required this.institute,
      required this.progress,
      required this.imageUrl,
      required this.rating,
    });
@override
  Widget build(BuildContext context) {
    
    return Container(
      width: 360,
      height: 77,
      margin: const EdgeInsets.only(top: 8),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 360,
              height: 77,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 9,
            top: 10,
            child: Container(
              width: 87,
              height: 58,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Positioned(
            left: 9,
            top: 10,
            child: Container(
              width: 87,
              height: 58,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Positioned(
            left: 9,
            top: 10,
            child: Container(
              width: 87,
              height: 58,
              decoration: ShapeDecoration(
                color: const Color(0x5900707E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 55,
            child: Container(
              width: 232,
              height: 6,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 55,
            child: Container(
              width: 232 * progress,
              height: 6,
              decoration: ShapeDecoration(
                color: const Color(0xFF00707E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 13,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF00434C),
                fontSize: 14,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.28,
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 31,
            child: Text(
              institute,
              style: const TextStyle(
                color: Color(0xFF00707E),
                fontSize: 7,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.14,
              ),
            ),
          ),
          Positioned(
            left: 293,
            top: 64,
            child: Text(
              '${(progress * 100).toInt()}% Completed',
              style: const TextStyle(
                color: Color(0xFF6C6C6C),
                fontSize: 6,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.12,
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 42,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Opacity(
                  opacity: 0.90,
                  child: Container(
                    width: 9,
                    height: 9,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: const Icon(
                      Icons.star,
                      size: 9,
                      color: Color(0xFF00707E),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  rating,
                  style: const TextStyle(
                    color: Color(0xFF00707E),
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
