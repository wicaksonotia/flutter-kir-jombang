import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/search_bar_container.dart';

class CekData extends StatefulWidget {
  const CekData({super.key});

  @override
  _CekDataState createState() => _CekDataState();
}

class _CekDataState extends State<CekData> {
  final controller = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.form,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            Stack(
              children: [
                // BACKGROUND HEADER
                Container(
                  height: 175,
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
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.only(left: 10),
                  child: const SearchBarContainer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
