import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jombang/utils/colors.dart';

class AppbarHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHeader({
    super.key,
    required this.header,
    this.subtitle,
    this.dynamicHeader,
    this.showBackButton = true,
    this.onBack,
    this.toolbarHeight = 70,
  });

  /// Judul tetap, misalnya "Informasi".
  final String header;

  /// Subtitle opsional di bawah judul.
  final String? subtitle;

  /// Judul dinamis jika halaman menggunakan RxString.
  final RxString? dynamicHeader;

  /// Tampilkan tombol kembali atau tidak.
  final bool showBackButton;

  /// Callback kembali opsional.
  /// Jika null, tombol akan menggunakan Get.back().
  final VoidCallback? onBack;

  final double toolbarHeight;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    final title = dynamicHeader;

    return AppBar(
      toolbarHeight: toolbarHeight,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: MyColors.primary,
      foregroundColor: Colors.white,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leadingWidth: showBackButton ? 64 : 0,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                tooltip: 'Kembali',
                onPressed: onBack ?? () => Get.back(),
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
            )
          : null,
      titleSpacing: showBackButton ? 4 : 16,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Obx(
              () => _buildTitle(title.value),
            )
          else
            _buildTitle(header),
          if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
            const SizedBox(height: 3),
            Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFFDCE8FF),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTitle(String value) {
    return Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
        color: Colors.white,
      ),
    );
  }
}
