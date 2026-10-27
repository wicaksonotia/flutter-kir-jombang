import 'package:get/get.dart';
import 'package:jombang/controllers/detail_riwayat_controller.dart';

class DetailRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRiwayatController>(
      () => DetailRiwayatController(),
    );
  }
}
