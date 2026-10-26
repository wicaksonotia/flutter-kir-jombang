import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jombang/pages/cek_data_kendaraan/text_header.dart';
import 'package:jombang/utils/containers/box_container.dart';

class DetailInfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DetailInfoCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      padding: const EdgeInsets.all(10),
      radius: 5,
      showBorder: true,
      borderColor: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeader(nama: title),
          const Gap(10),
          ...children,
        ],
      ),
    );
  }
}
