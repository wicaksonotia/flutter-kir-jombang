import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:jombang/controllers/pendaftaran_controller.dart';

class ListRiwayatPendaftaran extends StatelessWidget {
  const ListRiwayatPendaftaran({super.key});

  @override
  Widget build(BuildContext context) {
    final PendaftaranController pendaftaranController =
        Get.put(PendaftaranController());

    return Obx(
      () => pendaftaranController.isLoadingListRetribusi.value
          ? Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: GroupedListView<dynamic, String>(
                useStickyGroupSeparators: true,
                elements: pendaftaranController.resultDataListPendaftaran,
                groupBy: (element) => element.tanggalRetribusi,
                groupSeparatorBuilder: (value) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: Text(value),
                ),
                itemBuilder: (context, element) => Card(
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    leading: const Icon(
                      Icons.abc,
                      size: 20,
                    ),
                    title: Text(element.noUji),
                  ),
                ),
              ),
            ),
    );
  }
}
