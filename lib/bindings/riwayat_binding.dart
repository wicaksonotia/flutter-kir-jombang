import 'package:get/get.dart';
import 'package:jombang/controllers/riwayat_kendaraan_controller.dart';
import 'package:jombang/controllers/riwayat_pendaftaran_controller.dart';

class RiwayatBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<RiwayatKendaraanController>(() => RiwayatKendaraanController());
    Get.lazyPut<RiwayatPendaftaranController>(
        () => RiwayatPendaftaranController());
  }
}
