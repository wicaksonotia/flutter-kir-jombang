import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/carousel_controller.dart';
import 'package:jombang/pages/home/widgets/carousel_image.dart';
import 'package:jombang/pages/home/widgets/carousel_indicator.dart';
import 'package:jombang/pages/home/widgets/carousel_loading.dart';

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
        return const CarouselLoading();
      }

      if (carouselController.hasError.value) {
        return _message(
          icon: Icons.cloud_off_rounded,
          text: 'Banner belum dapat dimuat.',
          buttonText: 'Coba lagi',
          onPressed: () => carouselController.fetchData(),
        );
      }

      final items = carouselController.carouselItems;

      if (items.isEmpty) {
        return _message(
          icon: Icons.photo_library_outlined,
          text: 'Belum ada informasi banner.',
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CarouselImage(
                  imageBytes: items[index].gambar,
                ),
              );
            },
            options: CarouselOptions(
              height: 180,
              viewportFraction: 0.92,
              initialPage: 0,
              autoPlay: items.length > 1,
              enlargeCenterPage: false,
              enableInfiniteScroll: items.length > 1,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 700),
              onPageChanged: (index, reason) {
                carouselController.changePage(index);
              },
            ),
          ),
          const SizedBox(height: 14),
          CarouselIndicator(
            count: items.length,
            carouselController: carouselController,
          ),
        ],
      );
    });
  }

  Widget _message({
    required IconData icon,
    required String text,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8EDF4)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF8494A9), size: 28),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF718096),
              ),
            ),
            if (buttonText != null && onPressed != null) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: onPressed,
                child: Text(buttonText),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
