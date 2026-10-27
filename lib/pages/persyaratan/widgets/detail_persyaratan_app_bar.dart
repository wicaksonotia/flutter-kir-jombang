import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:jombang/utils/colors.dart';

class DetailPersyaratanAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DetailPersyaratanAppBar({
    super.key,
    required this.title,
  });

  final RxString title;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: MyColors.primary,
      foregroundColor: Colors.white,
      leadingWidth: 64,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: IconButton(
          tooltip: 'Kembali',
          onPressed: () => Get.back(),
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
              ),
            ),
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 21,
              color: Colors.white,
            ),
          ),
        ),
      ),
      titleSpacing: 4,
      title: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: Colors.white,
              ),
            ),
            const Gap(3),
            const Text(
              'Dokumen yang perlu dibawa saat pengujian',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFFDCE8FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
