import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/data_kendaraan.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/pages/cek_data_kendaraan/search_bar_container.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Cek Data Kendaraan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            context.goNamed('home');
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Stack(
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
                  child: const SearchBarContainer(),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * .79,
              child: const DataKendaraan(),
            ),
          ],
        ),
      ),
    );
  }
}
