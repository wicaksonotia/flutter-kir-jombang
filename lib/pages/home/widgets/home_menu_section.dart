import 'package:flutter/material.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({
    super.key,
    required this.child,
  });

  final Widget child;

  static const Color _borderColor = Color(0xFFE9EEF5);
  static const Color _shadowColor = Color(0xFF19365C);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _borderColor,
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: _shadowColor.withValues(alpha: 0.035),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
