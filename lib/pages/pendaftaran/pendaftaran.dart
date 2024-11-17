import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jombang/controllers/pendaftaran_controller.dart';
import 'package:jombang/pages/pendaftaran/loading_button.dart';

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({super.key});

  @override
  State<PendaftaranPage> createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  final pendaftaranController = Get.put(PendaftaranController());

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        leading: IconButton(
          icon: const Icon(Icons.ac_unit),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: pendaftaranController.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              const Gap(40),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: pendaftaranController.name,
                onEditingComplete: () => node.nextFocus(),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'this field is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              const Gap(10),
              GetBuilder<PendaftaranController>(
                builder: (c) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 40,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 115,
                          width: 115,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              Image(
                                image: pendaftaranController.pickedFile1 != null
                                    ? FileImage(
                                        File(pendaftaranController
                                            .pickedFile1!.path),
                                      )
                                    : const AssetImage(
                                            'assets/images/no_image.png')
                                        as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0)),
                                ),
                                child: Wrap(
                                  alignment: WrapAlignment.end,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        pendaftaranController
                                            .selectImage1(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Gallery'),
                                      onTap: () {
                                        pendaftaranController
                                            .selectImage1(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 40,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 115,
                          width: 115,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              Image(
                                image: pendaftaranController.pickedFile2 != null
                                    ? FileImage(
                                        File(pendaftaranController
                                            .pickedFile2!.path),
                                      )
                                    : const AssetImage(
                                            'assets/images/no_image.png')
                                        as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0)),
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.camera),
                                    title: const Text('Camera'),
                                    onTap: () {
                                      pendaftaranController
                                          .selectImage2(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.image),
                                    title: const Text('Gallery'),
                                    onTap: () {
                                      pendaftaranController
                                          .selectImage2(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
              const Gap(30),
              Obx(() {
                if (pendaftaranController.isLoading.value) {
                  return LoadingButton(
                    onClick: () async {},
                    color: Colors.blue,
                    childWidget: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return LoadingButton(
                    onClick: () async {
                      pendaftaranController.create();
                    },
                    color: Colors.blue,
                    childWidget: const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                  );
                }
              }),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
