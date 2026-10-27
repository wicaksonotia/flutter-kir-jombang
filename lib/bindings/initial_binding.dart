import 'package:get/get.dart';
import 'package:jombang/controllers/login_controller.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/controllers/detail_kendaraan_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());

    Get.put<SearchBarController>(
      SearchBarController(),
      permanent: true,
    );

    Get.put<DetailKendaraanController>(
      DetailKendaraanController(),
      permanent: true,
    );
  }
}
