import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jombang/controllers/berita_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:jombang/utils/sizes.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  final BeritaController controller = Get.put(BeritaController());
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    initializeDateFormatting('id_ID', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    return Obx(
      () => controller.isLoading.value
          ? Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.resultData.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                // childAspectRatio: (1 / 1.3),
                mainAxisExtent: 260,
              ),
              itemBuilder: (_, index) {
                var dataJudul = controller.resultData[index].judul!;
                var dataBerita = controller.resultData[index].berita!;
                var dataTanggal = controller.resultData[index].tanggal!;
                Uint8List decodePhoto;
                decodePhoto = const Base64Decoder()
                    .convert(controller.resultData[index].gambar!);

                return BoxContainer(
                  height: 250,
                  padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                  shadow: true,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // THUMBNAIL PRODUCT
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                  image: MemoryImage(decodePhoto),
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
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: MyColors.green,
                                  size: MySizes.iconXs,
                                ),
                                Text(
                                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                      .format(DateTime.now()),
                                  style: const TextStyle(
                                      fontSize: MySizes.fontSizeXsm),
                                ),
                              ],
                            ),
                          ),
                          const Gap(5),
                          Text(
                            dataJudul,
                            style: const TextStyle(
                                fontSize: MySizes.fontSizeMd,
                                fontWeight: FontWeight.bold),
                          ),
                          const Gap(10),
                          Text(
                            dataBerita,
                            style: const TextStyle(
                                fontSize: MySizes.fontSizeSm,
                                color: Colors.black54),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
