import 'package:get/get.dart';
import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/controllers/riwayat_pendaftaran_controller.dart';

class RiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RiwayatKendaraanController>(
      RiwayatKendaraanController(),
      permanent: true,
    );

    Get.lazyPut<RiwayatPendaftaranController>(
      () => RiwayatPendaftaranController(),
    );
  }
}
