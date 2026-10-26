import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/carousel_controller.dart';
import 'package:jombang/utils/colors.dart';

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({
    super.key,
    required this.carouselController,
  });

  final CarouselBannerController carouselController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (carouselController.isLoading.value) {
        return const SizedBox(
          height: 170,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (carouselController.hasError.value) {
        return _buildMessage(
          message: 'Slider gagal dimuat.',
          actionLabel: 'Coba lagi',
          onPressed: carouselController.fetchData,
        );
      }

      final items = carouselController.carouselItems;

      if (items.isEmpty) {
        return _buildMessage(
          message: 'Belum ada informasi slider.',
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (context, index, realIndex) {
              return CarouselImage(
                imageBytes: items[index].gambar,
              );
            },
            options: CarouselOptions(
              height: 170,
              initialPage: 0,
              viewportFraction: 0.92,
              autoPlay: items.length > 1,
              enlargeCenterPage: true,
              enlargeFactor: 0.12,
              enableInfiniteScroll: items.length > 1,
              autoPlayAnimationDuration: const Duration(
                seconds: 1,
              ),
              onPageChanged: (index, reason) {
                carouselController.changePage(index);
              },
            ),
          ),
          const SizedBox(height: 12),
          _buildIndicator(items.length),
        ],
      );
    });
  }

  Widget _buildIndicator(int count) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          final isSelected = carouselController.indexSlider.value == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: isSelected ? 24 : 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: isSelected ? MyColors.primary : MyColors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMessage({
    required String message,
    String? actionLabel,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      height: 170,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onPressed != null) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: onPressed,
                child: Text(actionLabel),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CarouselImage extends StatelessWidget {
  const CarouselImage({
    super.key,
    required this.imageBytes,
  });

  final Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        child: imageBytes == null || imageBytes!.isEmpty
            ? _buildPlaceholder()
            : Image.memory(
                imageBytes!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholder();
                },
              ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: MyColors.grey.withValues(alpha: 0.15),
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_not_supported_outlined,
        size: 36,
        color: Colors.grey,
      ),
    );
  }
}
