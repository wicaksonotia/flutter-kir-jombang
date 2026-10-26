import 'package:flutter/material.dart';
import 'package:jombang/utils/colors.dart';

class AppbarHeader extends StatelessWidget {
  const AppbarHeader({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      title: const Text('Cek Data Kendaraan'),
    );
  }
}
