import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/berita_controller.dart';
import 'package:jombang/pages/home/widgets/berita_card.dart';
import 'package:jombang/pages/home/widgets/berita_loading.dart';
import 'package:jombang/pages/home/widgets/berita_message.dart';

class Berita extends StatelessWidget {
  const Berita({
    super.key,
    required this.beritaController,
  });

  final BeritaController beritaController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = beritaController.resultData;

      if (beritaController.isLoading.value && items.isEmpty) {
        return const BeritaLoading();
      }

      if (beritaController.hasError.value && items.isEmpty) {
        return BeritaMessage(
          icon: Icons.wifi_off_rounded,
          title: 'Berita belum tersedia',
          message: 'Periksa koneksi internet, lalu coba kembali.',
          actionLabel: 'Coba lagi',
          onPressed: () => beritaController.fetchData(),
        );
      }

      if (items.isEmpty) {
        return const BeritaMessage(
          icon: Icons.newspaper_rounded,
          title: 'Belum ada berita',
          message: 'Informasi terbaru akan ditampilkan di sini.',
        );
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width >= 600 ? 3 : 2;
          final cardWidth = (width - (columns - 1) * 12) / columns;

          // Menjaga tinggi kartu tetap proporsional terhadap lebarnya.
          final cardHeight = cardWidth * 1.28;

          return GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 14,
              mainAxisExtent: cardHeight.clamp(245.0, 330.0),
            ),
            itemBuilder: (context, index) {
              return BeritaCard(berita: items[index]);
            },
          );
        },
      );
    });
  }
}
