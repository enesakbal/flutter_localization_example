import 'package:flutter/material.dart';

/// A custom text widget that displays a title and content in a column layout.
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.content,
    required this.title,
  });

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }
}
