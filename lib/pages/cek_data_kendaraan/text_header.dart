import 'package:flutter/material.dart';
import 'package:jombang/utils/sizes.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key,
    required this.nama,
  });

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Text(
      nama,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: MySizes.fontSizeLg),
    );
  }
}
