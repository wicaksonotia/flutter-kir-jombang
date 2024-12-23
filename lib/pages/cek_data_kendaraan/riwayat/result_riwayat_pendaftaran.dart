import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:jombang/controllers/riwayat_pendaftaran_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/box_container.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ResultRiwayatPendaftaran extends StatelessWidget {
  ResultRiwayatPendaftaran({super.key});
  // Future<void> _handleRefresh() async {
  //   return await Future.delayed(const Duration(seconds: 2));
  // }
  final RiwayatPendaftaranController pendaftaranController =
      Get.find<RiwayatPendaftaranController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => pendaftaranController.isLoadingListRetribusi.value
          ? Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : GroupedListView<dynamic, String>(
              useStickyGroupSeparators: true,
              elements: pendaftaranController.resultDataListRetribusi,
              groupBy: (element) => element.tanggalRetribusi,
              groupComparator: (value1, value2) => value2.compareTo(value1),
              groupSeparatorBuilder: (value) => Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                color: MyColors.grey,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              itemBuilder: (context, element) => Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    BoxContainer(
                      width: MediaQuery.of(context).size.width * .9,
                      padding: const EdgeInsets.all(10),
                      radius: 5,
                      shadow: false,
                      showBorder: true,
                      borderColor: Colors.grey.shade200,
                      backgroundColor: MyColors.grey,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Kode Pemesanan',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                element.kodeNumerator.toString(),
                                style: const TextStyle(
                                    fontSize: 16, color: MyColors.primary),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            'Lunas',
                            style: TextStyle(
                                color: MyColors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    BoxContainer(
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      radius: 5,
                      shadow: false,
                      showBorder: true,
                      borderColor: Colors.grey.shade200,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            element.nmUji,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                          const Gap(10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tanggal Uji',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    element.tanggalUji,
                                    style: const TextStyle(
                                        color: MyColors.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Total Harga',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    element.totalRetribusi,
                                    style: const TextStyle(
                                        color: MyColors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Card(
              //   elevation: 4,
              //   child:
              // ListTile(
              //   contentPadding: const EdgeInsets.all(5),
              //   leading: const Icon(
              //     Icons.abc,
              //     size: 20,
              //   ),
              //   title: Text(element.noUji),
              // ),

              // ),
            ),
    );
  }
}
