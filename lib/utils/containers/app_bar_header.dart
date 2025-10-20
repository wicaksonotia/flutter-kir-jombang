import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarHeader extends StatelessWidget {
  const AppbarHeader({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        header,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
