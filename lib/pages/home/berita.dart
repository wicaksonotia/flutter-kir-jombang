// import 'dart:convert';
// import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sampang/controllers/berita_controller.dart';
import 'package:sampang/utils/colors.dart';
import 'package:sampang/utils/containers/box_container.dart';
import 'package:sampang/utils/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class Berita extends StatefulWidget {
  Berita({
    super.key,
    required this.beritaController,
  });

  final BeritaController beritaController;

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  // Method to launch a URL
  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        // await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Could not launch $url: $e');
    }
  }

  // Ambil ID video dari YouTube
  String? _getYoutubeId(String url) {
    try {
      final Uri uri = Uri.parse(url);
      if (uri.host.contains('youtu.be')) {
        return uri.pathSegments.first;
      } else if (uri.host.contains('youtube.com')) {
        return uri.queryParameters['v'];
      }
    } catch (_) {}
    return null;
  }

  // Ambil data YouTube (thumbnail + title)
  Future<Map<String, String>> _getYoutubeData(String url) async {
    final id = _getYoutubeId(url);
    if (id == null) throw Exception('URL YouTube tidak valid');

    // Thumbnail langsung
    final thumb = 'https://img.youtube.com/vi/$id/hqdefault.jpg';

    // Ambil title via scraping
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      String? title = document.head!
          .getElementsByTagName('meta')
          .firstWhere((e) =>
              e.attributes['name'] == 'title' ||
              e.attributes['property'] == 'og:title')
          .attributes['content'];
      return {'thumbnail': thumb, 'title': title ?? 'Video YouTube'};
    } else {
      throw Exception('Gagal memuat data YouTube');
    }
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    initializeDateFormatting('id_ID', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => widget.beritaController.isLoading.value
          ? Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.beritaController.resultData.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                // childAspectRatio: (1 / 1.3),
                mainAxisExtent: 220,
              ),
              itemBuilder: (_, index) {
                var dataJudul =
                    widget.beritaController.resultData[index].judul!;
                // var dataBerita =
                //     widget.beritaController.resultData[index].berita!;
                var dataTanggal = DateTime.tryParse(
                    widget.beritaController.resultData[index].tanggal!);
                // Uint8List decodePhoto;
                // if (widget.beritaController.resultData[index].gambar != null) {
                //   decodePhoto = const Base64Decoder().convert(
                //       widget.beritaController.resultData[index].gambar!);
                // }

                return FutureBuilder<Map<String, String>>(
                  future: _getYoutubeData(dataJudul),
                  builder: (context, snapshot) {
                    String? thumbnailUrl = snapshot.data?['thumbnail'];
                    String? title = snapshot.data?['title'];

                    return BoxContainer(
                      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                      shadow: true,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // THUMBNAIL BERITA
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (dataJudul.contains('youtube.com') ||
                                        dataJudul.contains('youtu.be')) {
                                      _launchURL(dataJudul);
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      image: snapshot.connectionState ==
                                                  ConnectionState.done &&
                                              thumbnailUrl != null
                                          ? DecorationImage(
                                              image: NetworkImage(thumbnailUrl),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: snapshot.connectionState !=
                                            ConnectionState.done
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : null,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      color: MyColors.green,
                                      size: MySizes.iconXs,
                                    ),
                                    Text(
                                      DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                          .format(dataTanggal!),
                                      style: const TextStyle(
                                          fontSize: MySizes.fontSizeXsm),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(5),
                              Text(
                                title ?? 'video',
                                style: const TextStyle(
                                    fontSize: MySizes.fontSizeMd,
                                    fontWeight: FontWeight.bold),
                              ),
                              // const Gap(10),
                              // Text(
                              //   dataBerita,
                              //   style: const TextStyle(
                              //       fontSize: MySizes.fontSizeSm,
                              //       color: Colors.black54),
                              //   maxLines: 3,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
