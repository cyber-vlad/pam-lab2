import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
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
                    text: 'Sidra',
                    style: TextStyle(
                      color: const Color(0xFF00434C),
                      fontSize: 20,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.notifications, size: 25, color: Color(0xFF00707E)),
              onPressed: () {
              },
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