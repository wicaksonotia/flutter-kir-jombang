import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:jombang/controllers/menu_controller.dart';
import 'package:jombang/utils/colors.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final HomeMenuController menuController =
      Get.isRegistered<HomeMenuController>()
          ? Get.find<HomeMenuController>()
          : Get.put(HomeMenuController());

  static const Color _mutedColor = Color(0xFF718096);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (menuController.isLoading.value) {
        return const _MenuShimmer();
      }

      final items = menuController.menuItem;

      if (items.isEmpty) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 22),
          child: Center(
            child: Text(
              'Menu layanan belum tersedia.',
              style: TextStyle(
                color: _mutedColor,
                fontSize: 13,
              ),
            ),
          ),
        );
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = (constraints.maxWidth - 18) / 4;
          final iconSize = itemWidth < 76 ? 43.0 : 46.0;

          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 2),
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 4,
              mainAxisExtent: 88,
            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return _MenuItem(
                title: item.nama,
                icon: Icons.directions_bus_rounded,
                iconSize: iconSize,
                onTap: () => Get.toNamed(item.directlink),
              );
            },
          );
        },
      );
    });
  }
}

class _MenuShimmer extends StatelessWidget {
  const _MenuShimmer();

  static const Color _base = Color(0xFFE8EDF4);
  static const Color _highlight = Color(0xFFF7F9FC);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _base,
      highlightColor: _highlight,
      period: const Duration(milliseconds: 1300),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 2),
        itemCount: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 4,
          mainAxisExtent: 88,
        ),
        itemBuilder: (context, index) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 46,
                height: 46,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _base,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 10,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: _base,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.title,
    required this.icon,
    required this.iconSize,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final double iconSize;
  final VoidCallback onTap;

  static const Color _textColor = Color(0xFF344563);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: MyColors.primary.withValues(alpha: 0.075),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  size: 23,
                  color: MyColors.primary,
                ),
              ),
              const SizedBox(height: 7),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _textColor,
                      fontSize: 10.5,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
