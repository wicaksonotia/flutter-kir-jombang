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
import 'package:jombang/models/uji_hari_ini_model.dart';
import 'package:jombang/networks/api_endpoints.dart';

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
      final url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.slider;

      final response = await Dio().get(url);

      if (response.statusCode != 200) {
        return null;
      }

      if (response.data is! Map) {
        throw const FormatException(
          'Format respons slider tidak valid.',
        );
      }

      final responseData = Map<String, dynamic>.from(response.data);

      if (responseData['status'] != 'ok') {
        return null;
      }

      final jsonData = responseData['data'];

      if (jsonData is! List) {
        throw const FormatException(
          'Data slider bukan berupa list.',
        );
      }

      return jsonData
          .whereType<Map>()
          .map(
            (item) => CarouselModel.fromJson(
              Map<String, dynamic>.from(item),
            ),
          )
          .where((item) => item.status && item.gambar != null)
          .toList();
    } on DioException catch (e) {
      debugPrint('Gagal mengambil slider: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Error parsing slider: $e');
      rethrow;
    }
  }

  // MENU

  static Future<List<MenuModel>?> getMenu() async {
    try {
      final url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.menu;

      final response = await Dio().get(url);

      if (response.statusCode != 200) {
        return null;
      }

      final responseData = response.data;

      if (responseData is! Map<String, dynamic>) {
        throw const FormatException(
          'Format respons menu tidak valid.',
        );
      }

      if (responseData['status'] != 'ok') {
        return null;
      }

      final jsonData = responseData['data'];

      if (jsonData is! List) {
        throw const FormatException(
          'Data menu bukan berupa list.',
        );
      }

      return jsonData
          .whereType<Map<String, dynamic>>()
          .map(MenuModel.fromJson)
          .toList();
    } on DioException catch (e) {
      debugPrint('Gagal mengambil menu: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Error parsing menu: $e');
      rethrow;
    }
  }

  // BERITA

  static Future<List<BeritaModel>?> getBerita() async {
    try {
      final url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.berita;

      final response = await Dio().get(url);

      if (response.statusCode != 200) {
        return null;
      }

      if (response.data is! Map) {
        throw const FormatException(
          'Format respons berita tidak valid.',
        );
      }

      final responseData = Map<String, dynamic>.from(response.data);

      if (responseData['status'] != 'ok') {
        return null;
      }

      final jsonData = responseData['data'];

      if (jsonData is! List) {
        throw const FormatException(
          'Data berita bukan berupa list.',
        );
      }

      return jsonData
          .whereType<Map>()
          .map(
            (item) => BeritaModel.fromJson(
              Map<String, dynamic>.from(item),
            ),
          )
          .where((item) => item.status)
          .toList();
    } on DioException catch (e) {
      debugPrint('Gagal mengambil berita: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Error parsing berita: $e');
      rethrow;
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
  static Future<DetailKendaraanModel?> getDetailKendaraan({
    required String noUji,
    required String noMesin,
  }) async {
    final url =
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.detailkendaraan;

    final response = await Dio().get(
      url,
      queryParameters: {
        'nouji': noUji,
        'nomesin': noMesin,
      },
    );

    if (response.statusCode == 200) {
      return DetailKendaraanModel.fromJson(
        Map<String, dynamic>.from(response.data),
      );
    }

    return null;
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
  static Future<RiwayatKendaraanModel?> getRiwayatKendaraan({
    required String noUji,
    required String noMesin,
  }) async {
    try {
      final url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.riwayatkendaraan;

      final response = await Dio().get(
        url,
        queryParameters: {
          'nouji': noUji.trim().toUpperCase(),
          'nomesin': noMesin.trim(),
        },
      );

      if (response.statusCode == 200) {
        return RiwayatKendaraanModel.fromJson(
          Map<String, dynamic>.from(response.data),
        );
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // DETAIL RIWAYAT KENDARAAN
  static Future<DetailRiwayatModel?> getDetailRiwayatKendaraan({
    required int idHasilUji,
    required String noUji,
  }) async {
    try {
      final url = ApiEndPoints.baseUrl +
          ApiEndPoints.authEndpoints.detailriwayatkendaraan;

      final response = await Dio().get(
        url,
        queryParameters: {
          'idhasiluji': idHasilUji,
          'nouji': noUji.trim(),
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map) {
          return DetailRiwayatModel.fromJson(
            Map<String, dynamic>.from(responseData),
          );
        }

        throw Exception('Format respons detail kendaraan tidak valid.');
      }

      return null;
    } on DioException catch (e) {
      final responseData = e.response?.data;

      final message =
          responseData is Map ? responseData['message']?.toString() : null;

      throw Exception(
        message ?? e.message ?? 'Gagal mengambil detail riwayat kendaraan.',
      );
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
