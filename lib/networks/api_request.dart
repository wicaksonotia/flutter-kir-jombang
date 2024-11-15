import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jombang/models/berita_model.dart';
import 'package:jombang/models/carousel_model.dart';
import 'package:jombang/models/hasil_uji_model.dart';
import 'package:jombang/models/jenis_uji_model.dart';
import 'package:jombang/models/kendaraan_model.dart';
import 'package:jombang/models/menu_model.dart';
import 'package:jombang/models/pendaftaran_model.dart';
import 'package:jombang/models/persyaratan_model.dart';
import 'package:jombang/models/riwayat_detail_model.dart';
import 'package:jombang/models/riwayat_model.dart';
import 'package:jombang/models/tidak_lulus_model.dart';
import 'package:jombang/networks/api_endpoints.dart';

class RemoteDataSource {
  // SLIDER
  static Future<List<CarouselModel>?> getSlider() async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.slider;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
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
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.daftarretribusi;
      if (kDebugMode) {
        print(data);
      }
      Response response = await Dio().post(
        url,
        data: data,
      );
      print(response);
      if (response.statusCode == 201) {
        // GetX.Get.snackbar('Successfully','New Profile Added',
        //     backgroundColor: Colors.white,
        //     duration: Duration(seconds: 4),
        //     animationDuration: Duration(milliseconds: 900),
        //     margin: EdgeInsets.only(top: 5, left: 10, right: 10)
        // );
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // DETAIL RETRIBUSI
  static Future<PendaftaranModel?> getRetribusi(int params) async {
    try {
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.detailretribusi;
      final response = await Dio().get("$url?idretribusi=$params");
      if (response.statusCode == 200) {
        final PendaftaranModel res = PendaftaranModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
