import 'package:flutter/material.dart';

class TextLeft extends StatelessWidget {
  const TextLeft({
    super.key,
    required this.nama,
  });

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Text(
      nama,
      style: TextStyle(color: Colors.grey.shade600, height: 1.7),
    );
  }
}
