import 'package:flutter/material.dart';

class EnrollButton extends StatelessWidget {
  const EnrollButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00707E),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'ENROLL NOW',
                style: TextStyle(
                  color: Color(0xFFD9EFF2),
                  fontSize: 16,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.32,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Start your 7-day free Trial',
            style: TextStyle(
              color: Color(0xFF6C6C6C),
              fontSize: 12,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              letterSpacing: 0.24,
            ),
          ),
        ],
      ),
    );
  }
}
