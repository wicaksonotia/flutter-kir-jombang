import 'dart:async';
import 'package:dio/dio.dart';
import 'package:sampang/models/berita_model.dart';
import 'package:sampang/models/carousel_model.dart';
import 'package:sampang/models/hasil_uji_model.dart';
import 'package:sampang/models/jenis_uji_model.dart';
import 'package:sampang/models/kendaraan_model.dart';
import 'package:sampang/models/menu_model.dart';
import 'package:sampang/models/pendaftaran_model.dart';
import 'package:sampang/models/persyaratan_model.dart';
import 'package:sampang/models/riwayat_detail_model.dart';
import 'package:sampang/models/riwayat_model.dart';
import 'package:sampang/models/tidak_lulus_model.dart';
import 'package:sampang/models/uji_hari_ini_model.dart';
import 'package:sampang/networks/api_endpoints.dart';

class RemoteDataSource {
  static Future<bool> login(FormData data) async {
    try {
      Dio dio = Dio();
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login;
      Response response = await dio.post(url,
          data: data,
          options: Options(
            contentType: 'application/json',
          ));
      // print(response.statusCode);
      if (response.statusCode == 200) {
        if (response.data['status'] == 'ok') {
          // throw jsonDecode(response.body)['message'];
          // var token = json['data']['Token'];
          // final SharedPreferences prefs = await _prefs;
          // await prefs.setString('token', token);
          // emailController.clear();
          // passwordController.clear();
          return true;
        }
        // else if (response.data['status'] == 'error') {
        //   return false;
        // }
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // SLIDER
  static Future<List<CarouselModel>?> getSlider() async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.slider;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        // print(jsonData);
        return jsonData.map((e) => CarouselModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // MENU
  static Future<List<MenuModel>?> getMenu() async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.menu;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => MenuModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // BERITA
  static Future<List<BeritaModel>?> getBerita() async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.berita;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => BeritaModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // JENIS UJI
  static Future<List<JenisUjiModel>?> getJenisUji() async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.jenisuji;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => JenisUjiModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // DETAIL PERSYARATAN
  static Future<List<PersyaratanModel>?> getDetailPersyaratan(
      String jenisUji) async {
    try {
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.detailpersyaratan;
      final response = await Dio().get("$url?nama=$jenisUji");
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => PersyaratanModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // DETAIL KEDARAAN
  static Future<DetailKendaraanModel?> getDetailKendaraan(String params) async {
    try {
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.detailkendaraan;
      final response = await Dio().get("$url?nouji=$params");
      if (response.statusCode == 200) {
        // Map<String, dynamic> jsonData = response.data;
        final DetailKendaraanModel res =
            DetailKendaraanModel.fromJson(response.data);
        print(res.data!.imgKiri);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // HASIL UJI
  static Future<HasilUjiModel?> getHasilUji(String params) async {
    try {
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.hasilujikendaraan;
      final response = await Dio().get("$url?nouji=$params");
      if (response.statusCode == 200) {
        final HasilUjiModel res = HasilUjiModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // KETERANGAN TIDAK LULUS
  static Future<TidakLulusModel?> getKeteranganTidakLulus(
      int params, String kategori) async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.keterangantl;
      final response =
          await Dio().get("$url?idhasiluji=$params&kategori=$kategori");
      if (response.statusCode == 200) {
        final TidakLulusModel res = TidakLulusModel.fromJson(response.data);
        // print(res.toJson());
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // LIST RIWAYAT KENDARAAN
  static Future<RiwayatKendaraanModel?> getRiwayatKendaraan(
      String params) async {
    try {
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.riwayatkendaraan;
      final response = await Dio().get("$url?nouji=$params");
      if (response.statusCode == 200) {
        final RiwayatKendaraanModel res =
            RiwayatKendaraanModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // DETAIL RIWAYAT KENDARAAN
  static Future<DetailRiwayatModel?> getDetailRiwayatKendaraan(
      int params) async {
    try {
      var url = ApiEndPoints.baseUrl +
          ApiEndPoints.authEndpoints.detailriwayatkendaraan;
      final response = await Dio().get("$url?idhasiluji=$params");
      if (response.statusCode == 200) {
        final DetailRiwayatModel res =
            DetailRiwayatModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // CREATE RETRIBUSI
  static Future<bool> createRetribusi(FormData data) async {
    try {
      Dio dio = Dio();
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.daftarretribusi;
      Response response = await dio.post(url,
          data: data,
          options: Options(
            contentType: 'application/json',
          ));
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  // RIWAYAT RETRIBUSI
  static Future<PendaftaranModel?> getPendaftaran(String params) async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.listretribusi;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final PendaftaranModel res = PendaftaranModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // UJI HARI INI
  static Future<UjiHariIniModel?> getUjiHariIni() async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.ujihariini;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final UjiHariIniModel res = UjiHariIniModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
