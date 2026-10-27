import 'package:get/get.dart';
import 'package:jombang/controllers/detail_persyaratan_controller.dart';

class DetailPersyaratanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPersyaratanController>(
      () => DetailPersyaratanController(),
    );
  }
}
