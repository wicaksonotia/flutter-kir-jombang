import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersyaratanSectionHeading extends StatelessWidget {
  const PersyaratanSectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 17,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.25,
          ),
        ),
        const Gap(5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF718096),
            fontSize: 12,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
