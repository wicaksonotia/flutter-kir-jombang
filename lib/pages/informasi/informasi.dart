import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jombang/controllers/berita_controller.dart';
import 'package:jombang/utils/containers/app_bar_header.dart';
import 'package:jombang/pages/persyaratan/background_header.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({super.key});

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
  final BeritaController beritaController = Get.put(BeritaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarHeader(
          header: 'Informasi',
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
                () => beritaController.isLoading.value
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5),
                        child:
                            // AnimationLimiter(
                            //   child:
                            //   ListView.builder(
                            //     itemCount: beritaController.resultData.length,
                            //     itemBuilder: (BuildContext context, int index) {
                            //       String hexString =
                            //           beritaController.resultData[index].warna!;
                            //       return AnimationConfiguration.staggeredList(
                            //         position: index,
                            //         duration: const Duration(milliseconds: 375),
                            //         child: SlideAnimation(
                            //           verticalOffset: 50.0,
                            //           child: FadeInAnimation(
                            //             child: CardCategories(
                            //                 hexString: hexString,
                            //                 jenisUjiController: jenisUjiController,
                            //                 index: index),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            AnimationLimiter(
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemCount: beritaController.resultData.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              // childAspectRatio: (1 / 1.3),
                              mainAxisExtent: 280,
                            ),
                            itemBuilder: (_, index) {
                              var dataJudul =
                                  beritaController.resultData[index].judul!;
                              var dataBerita =
                                  beritaController.resultData[index].berita!;
                              var dataTanggal = DateTime.tryParse(
                                  beritaController.resultData[index].tanggal!);
                              Uint8List decodePhoto;
                              decodePhoto = const Base64Decoder().convert(
                                  beritaController.resultData[index].gambar!);
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 3,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: BoxContainer(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 5, 10),
                                        shadow: true,
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // THUMBNAIL PRODUCT
                                                Center(
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      image: DecorationImage(
                                                        image: MemoryImage(
                                                            decodePhoto),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      // image: const DecorationImage(
                                                      //   image: AssetImage('assets/images/kecap2.png'),
                                                      //   fit: BoxFit.cover,
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                const Gap(10),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.calendar_month,
                                                        color: MyColors.green,
                                                        size: MySizes.iconXs,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        DateFormat(
                                                                'EEEE, dd MMMM yyyy',
                                                                'id_ID')
                                                            .format(
                                                                dataTanggal!),
                                                        style: const TextStyle(
                                                            fontSize: MySizes
                                                                .fontSizeXsm),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Gap(5),
                                                Text(
                                                  dataJudul,
                                                  style: const TextStyle(
                                                      fontSize:
                                                          MySizes.fontSizeMd,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Gap(10),
                                                Text(
                                                  dataBerita,
                                                  style: const TextStyle(
                                                      fontSize:
                                                          MySizes.fontSizeSm,
                                                      color: Colors.black54),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
