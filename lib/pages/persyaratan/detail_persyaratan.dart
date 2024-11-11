import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:jombang/controllers/detail_persyaratan_controller.dart';

class DetailPersyaratanPage extends StatelessWidget {
  // final String persyaratan;
  // DetailPersyaratanPage({super.key, required this.persyaratan});
  DetailPersyaratanPage({super.key});
  final DetailPersyaratanController detailPersyaratanController =
      Get.put(DetailPersyaratanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detailPersyaratanController.persyaratanHeader.value),
        leading: const BackButton(color: Colors.black),
      ),
      body: Obx(
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
                  itemCount: detailPersyaratanController.persyaratanItem.length,
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
                                      .persyaratanItem[index].persyaratan!,
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
    );
  }
}
