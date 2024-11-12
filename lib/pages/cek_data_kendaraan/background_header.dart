import 'package:flutter/material.dart';
import 'package:jombang/pages/cek_data_kendaraan/search_bar_container.dart';
import 'package:jombang/utils/colors.dart';

class BackgroundHeader extends StatelessWidget {
  String menu;
  BackgroundHeader({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // BACKGROUND HEADER
        Container(
          height: 125,
          // color: MyColors.primary,
          decoration: const BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),

        Positioned(
          top: -100,
          left: -50,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),

        Positioned(
          top: 50,
          right: 10,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),

        // HEADER dan MENU
        Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(top: 100, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SearchBarContainer(
            menu: menu,
          ),
        ),
      ],
    );
  }
}
