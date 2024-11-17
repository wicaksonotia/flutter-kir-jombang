import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jombang/networks/api_request.dart';
import 'package:jombang/pages/home/home.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  showPassword() {
    isPasswordVisible(!isPasswordVisible.value);
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
      if (result) Get.off(const HomePage());
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
      //     // var token = json['data']['Token'];
      //     // final SharedPreferences prefs = await _prefs;
      //     // await prefs.setString('token', token);
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
      // Get.snackbar('Notification', error.toString(),
      //     icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
