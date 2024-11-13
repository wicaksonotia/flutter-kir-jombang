import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jombang/controllers/detail_persyaratan_controller.dart';
import 'package:jombang/pages/persyaratan/background_header.dart';

class DetailPersyaratanPage extends StatelessWidget {
  // final String persyaratan;
  // DetailPersyaratanPage({super.key, required this.persyaratan});
  DetailPersyaratanPage({super.key});
  final DetailPersyaratanController detailPersyaratanController =
      Get.put(DetailPersyaratanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: Text(
              detailPersyaratanController.persyaratanHeader.value,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                context.goNamed('persyaratan');
              },
            ),
          )),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            const BackgroundHeader(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .79,
              child: Obx(
                () => detailPersyaratanController.isLoading.value
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: ListView.builder(
                          itemCount: detailPersyaratanController
                              .persyaratanItem.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Row(
                                    children: [
                                      const Text(
                                        "\u2022",
                                        style: TextStyle(fontSize: 30),
                                      ), //bullet text
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          detailPersyaratanController
                                              .persyaratanItem[index]
                                              .persyaratan!,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
