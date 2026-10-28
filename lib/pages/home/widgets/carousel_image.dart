import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jombang/utils/colors.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({
    super.key,
    required this.imageBytes,
  });

  final Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: double.infinity,
        height: 180,
        child: imageBytes == null || imageBytes!.isEmpty
            ? _placeholder()
            : Image.memory(
                imageBytes!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
                errorBuilder: (_, __, ___) => _placeholder(),
              ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: MyColors.primary.withValues(alpha: 0.07),
      alignment: Alignment.center,
      child: Icon(
        Icons.image_outlined,
        size: 38,
        color: MyColors.primary.withValues(alpha: 0.5),
      ),
    );
  }
}
