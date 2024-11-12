import 'dart:async';
import 'package:dio/dio.dart';
import 'package:jombang/models/berita_model.dart';
import 'package:jombang/models/carousel_model.dart';
import 'package:jombang/models/jenis_uji_model.dart';
import 'package:jombang/models/kendaraan_model.dart';
import 'package:jombang/models/menu_model.dart';
import 'package:jombang/models/persyaratan_model.dart';
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
}
