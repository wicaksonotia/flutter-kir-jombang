import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sampang/utils/colors.dart';
import 'package:sampang/controllers/carousel_controller.dart';

class CarouselContainer extends StatelessWidget {
  CarouselContainer({
    super.key,
    required this.carouselController,
  });

  final CarouselBannerController carouselController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (carouselController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                initialPage: 0,
                height: 170,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                enlargeFactor: 0.2,
                // autoPlayAnimationDuration: const Duration(seconds: 7),
                autoPlayAnimationDuration: const Duration(seconds: 3),
                onPageChanged: (index, _) {
                  carouselController.indexSlider.value = index;
                },
              ),
              items: carouselController.carouselItems.map((dataSliderImage) {
                return Builder(
                  builder: (BuildContext context) {
                    return carouselImage(decodePhoto: dataSliderImage.gambar!);
                  },
                );
              }).toList(),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carouselController.carouselItems.length,
                (index) {
                  bool isSelected =
                      carouselController.indexSlider.value == index;
                  return GestureDetector(
                    child: AnimatedContainer(
                      width: isSelected ? 30 : 5,
                      height: 5,
                      margin:
                          EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                      decoration: BoxDecoration(
                        color: isSelected ? MyColors.primary : MyColors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    });
  }
}

class carouselImage extends StatelessWidget {
  const carouselImage({
    super.key,
    required this.decodePhoto,
  });

  final Uint8List decodePhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: MemoryImage(decodePhoto),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
