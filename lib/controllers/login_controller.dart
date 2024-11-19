import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jombang/networks/api_request.dart';
import 'package:jombang/utils/sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  var isShowLogout = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isLogin = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  showPassword() {
    isPasswordVisible(!isPasswordVisible.value);
  }

  @override
  void onInit() {
    super.onInit();
    skipLogin();
  }

  Future<void> loginWithEmail() async {
    // var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      Dio.FormData formData = Dio.FormData.fromMap({
        "username": emailController.text.trim(),
        "password": passwordController.text,
      });
      bool result = await RemoteDataSource.login(formData);
      if (result) {
        final SharedPreferences prefs = await _prefs;
        await prefs.setBool('statusLogin', true);
        await prefs.setString('username', emailController.text.trim());
        await prefs.setString('password', passwordController.text);
        isShowLogout.value = true;
        Get.offNamed('/pendaftaran');
      } else {
        throw "No Uji / Password salah";
      }
      // var url =
      //     Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login);
      // Map body = {
      //   'username': emailController.text.trim(),
      //   'password': passwordController.text
      // };
      // http.Response response =
      //     await http.post(url, body: jsonEncode(body), headers: headers);
      // if (response.statusCode == 200) {
      //   final json = jsonDecode(response.body);
      //   if (json['status'] == 'ok') {
      //     // throw jsonDecode(response.body)['message'];
      // var token = json['data']['Token'];
      // final SharedPreferences prefs = await _prefs;
      // await prefs.setString('token', token);
      //     // emailController.clear();
      //     // passwordController.clear();
      //     Get.off(const HomePage());
      //   } else if (json['status'] == 'error') {
      //     throw jsonDecode(response.body)['message'];
      //   }
      // } else {
      //   throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      // }
    } catch (error) {
      Get.snackbar('Notification', error.toString(),
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void skipLogin() async {
    final SharedPreferences prefs = await _prefs;
    isLogin = prefs.getBool('statusLogin');
    // if (isLogin == true) {
    //   Get.offNamed('/home');
    // } else {
    //   Get.toNamed('/login');
    // }
  }

  void logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('statusLogin', false);
    isLogin = prefs.getBool('statusLogin');
    isShowLogout(false);
    Get.back();
    Get.toNamed('/home');
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        height: 120,
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(10),
        //     topLeft: Radius.circular(10),
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Apakah anda mau logout?',
                style: TextStyle(
                    color: Colors.black, fontSize: MySizes.fontSizeLg),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () => logout(),
                  label: const Text('yes'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  icon: const Icon(Icons.thumb_down),
                  onPressed: () => Get.back(),
                  label: const Text('cancel'),
                ),
              ],
            )
          ],
        ),
      ),
      persistent: true,
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }
}
