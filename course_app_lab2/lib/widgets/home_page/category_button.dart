import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9.46),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.95,
            color: Color(0xFF00707E),
          ),
          borderRadius: BorderRadius.circular(18.92),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF00434C),
          fontSize: 11.35,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
          letterSpacing: 0.57,
        ),
      ),
    );
  }
}
