import 'package:flutter/material.dart';

class TextRight extends StatelessWidget {
  const TextRight({
    super.key,
    required this.nama,
  });

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Text(
      nama,
      textAlign: TextAlign.right,
      style: const TextStyle(color: Colors.black),
    );
  }
}
