import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
import 'package:jombang/controllers/jenis_uji_controller.dart';
import 'package:jombang/pages/cek_data_kendaraan/app_bar_header.dart';
import 'package:jombang/pages/persyaratan/background_header.dart';
import 'package:jombang/pages/persyaratan/card_categories.dart';

class PersyaratanPage extends StatefulWidget {
  const PersyaratanPage({super.key});

  @override
  State<PersyaratanPage> createState() => _PersyaratanPageState();
}

class _PersyaratanPageState extends State<PersyaratanPage> {
  final JenisUjiController jenisUjiController = Get.put(JenisUjiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Persyaratan Uji Kendaraan'),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       context.goNamed('home');
      //     },
      //   ),
      // ),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarHeader(
          header: 'Cek Data Kendaraan',
        ),
      ),
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            const BackgroundHeader(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .79,
              child: Obx(
                () => jenisUjiController.isLoading.value
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: AnimationLimiter(
                          child: ListView.builder(
                            itemCount: jenisUjiController.jenisUjiItem.length,
                            itemBuilder: (BuildContext context, int index) {
                              String hexString =
                                  jenisUjiController.jenisUjiItem[index].warna!;
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: CardCategories(
                                        hexString: hexString,
                                        jenisUjiController: jenisUjiController,
                                        index: index),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                //     AnimationLimiter(
                //   child: GridView.count(
                //     crossAxisCount: 3,
                //     children: List.generate(
                //       100,
                //       (int index) {
                //         return AnimationConfiguration.staggeredGrid(
                //           position: index,
                //           duration: const Duration(milliseconds: 375),
                //           columnCount: 3,
                //           child: ScaleAnimation(
                //             child: FadeInAnimation(
                //               child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Container(
                //                   height: 200,
                //                   width: 200,
                //                   color: Colors.deepOrange,
                //                   child: const Center(
                //                     child: Text(
                //                       "HAIIII",
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.w800,
                //                           color: Colors.white),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
