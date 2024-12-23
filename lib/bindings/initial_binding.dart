import 'package:get/get.dart';
import 'package:jombang/controllers/login_controller.dart';
import 'package:jombang/controllers/search_bar_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<LoginController>(() => LoginController());
    // Get.lazyPut<SearchBarController>(() => SearchBarController());
    Get.put<SearchBarController>(SearchBarController());
  }
}
