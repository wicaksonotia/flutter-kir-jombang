import 'package:get/get.dart';
import 'package:sampang/controllers/pendaftaran_controller.dart';

class PendaftaranBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PendaftaranController>(PendaftaranController());
  }
}
