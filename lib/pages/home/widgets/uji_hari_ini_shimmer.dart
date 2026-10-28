import 'package:flutter/material.dart';

class UjiHariIniShimmer extends StatelessWidget {
  const UjiHariIniShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFEBEFF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _block(7, 7, radius: 8),
              const SizedBox(width: 8),
              _block(125, 10),
              const Spacer(),
              _block(48, 48, radius: 14),
            ],
          ),
          const SizedBox(height: 15),
          _block(100, 35),
          const SizedBox(height: 8),
          _block(165, 11),
          const SizedBox(height: 22),
          const Divider(color: Color(0xFFEBEFF5)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _statisticPlaceholder()),
              const SizedBox(width: 16),
              Expanded(child: _statisticPlaceholder()),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(child: _statisticPlaceholder()),
              const SizedBox(width: 16),
              Expanded(child: _statisticPlaceholder()),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _statisticPlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _block(34, 34, radius: 10),
            const SizedBox(width: 9),
            Expanded(child: _block(65, 10)),
          ],
        ),
        const SizedBox(height: 9),
        _block(50, 22),
      ],
    );
  }

  Widget _block(
    double width,
    double height, {
    double radius = 6,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFEDF1F6),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
