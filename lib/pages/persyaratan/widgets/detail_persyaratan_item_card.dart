import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailPersyaratanItemCard extends StatelessWidget {
  const DetailPersyaratanItemCard({
    super.key,
    required this.index,
    required this.title,
  });

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE7EDF5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              index.toString().padLeft(2, '0'),
              style: const TextStyle(
                color: Color(0xFF3268B2),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Gap(13),
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.description_outlined,
              color: Color(0xFF718096),
              size: 21,
            ),
          ),
          const Gap(11),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF263750),
                  fontSize: 13,
                  height: 1.55,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
