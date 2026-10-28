import 'package:flutter/material.dart';
import 'package:jombang/utils/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _InvertedArcHeaderClipper(),
      child: Container(
        width: double.infinity,
        color: MyColors.primary,
        padding: EdgeInsets.fromLTRB(
          20,
          MediaQuery.of(context).padding.top + 20,
          20,
          108,
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.directions_bus_rounded,
                    size: 28,
                    color: MyColors.primary,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Layanan Uji Kendaraan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Dishub Kabupaten Sampang',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvertedArcHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double sideHeight = 0.72;
    const double curveWidth = 48.0;
    const double curveDepth = 22.0;

    final double y = size.height * sideHeight;
    final double centerY = y - curveDepth;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, y)
      ..cubicTo(
        size.width,
        centerY,
        size.width - curveWidth * 0.55,
        centerY,
        size.width - curveWidth,
        centerY,
      )
      ..lineTo(curveWidth, centerY)
      ..cubicTo(
        curveWidth * 0.55,
        centerY,
        0,
        centerY,
        0,
        y,
      )
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
