import 'package:flutter/material.dart';

class BeritaLoading extends StatelessWidget {
  const BeritaLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 14,
        mainAxisExtent: 270,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE8EDF4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 125,
                color: const Color(0xFFE8EDF4),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _line(width: 75, height: 9),
                    const SizedBox(height: 12),
                    _line(width: double.infinity, height: 12),
                    const SizedBox(height: 7),
                    _line(width: 110, height: 12),
                    const SizedBox(height: 14),
                    _line(width: double.infinity, height: 8),
                    const SizedBox(height: 6),
                    _line(width: 90, height: 8),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _line({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFEDF1F6),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
