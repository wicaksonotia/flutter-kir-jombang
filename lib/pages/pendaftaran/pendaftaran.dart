import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jombang/controllers/pendaftaran_controller.dart';
import 'package:jombang/pages/pendaftaran/loading_button.dart';
import 'package:jombang/pages/persyaratan/background_header.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/utils/containers/app_bar_header.dart';

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
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppbarHeader(
            header: 'Pendaftaran',
          ),
        ),
        backgroundColor: Colors.white,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BackgroundHeader(),
                Form(
                  key: pendaftaranController.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: pendaftaranController.nouji,
                          onEditingComplete: () => node.nextFocus(),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'this field is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "No Uji Kendaraan",
                          ),
                        ),
                        const Gap(10),
                        // Row(
                        //   children: [
                        // TextFormField(
                        //   keyboardType: TextInputType.name,
                        //   controller: pendaftaranController.tanggaluji,
                        //   onEditingComplete: () => node.nextFocus(),
                        //   decoration: InputDecoration(
                        //     labelText: DateFormat('dd MMMM yyyy', 'id_ID')
                        //         .format(DateTime.now())
                        //         .toString(),
                        //   ),
                        // ),

                        //     ElevatedButton(
                        //       onPressed: () {
                        //         pendaftaranController.chooseDate();
                        //       },
                        //       child: Text('Select Date'),
                        //     )
                        //   ],
                        // ),
                        Row(
                          children: [
                            // TEXT FIELD SEARCH
                            Expanded(
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: DateFormat('dd MMMM yyyy', 'id_ID')
                                      .format(pendaftaranController
                                          .selectedDate.value)
                                      .toString(),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: MyColors.orange,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  pendaftaranController.chooseDate();
                                },
                                icon: const Icon(Icons.date_range_rounded),
                                color: Colors.white,
                              ),
                            ),
                          ],
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
                                          image: pendaftaranController
                                                      .pickedFile1 !=
                                                  null
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
                                                topRight:
                                                    Radius.circular(16.0)),
                                          ),
                                          child: Wrap(
                                            alignment: WrapAlignment.end,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.end,
                                            children: [
                                              ListTile(
                                                leading:
                                                    const Icon(Icons.camera),
                                                title: const Text('Camera'),
                                                onTap: () {
                                                  pendaftaranController
                                                      .selectImage1(
                                                          ImageSource.camera);
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                    const Icon(Icons.image),
                                                title: const Text('Gallery'),
                                                onTap: () {
                                                  pendaftaranController
                                                      .selectImage1(
                                                          ImageSource.gallery);
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
                                          image: pendaftaranController
                                                      .pickedFile2 !=
                                                  null
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
                                          crossAxisAlignment:
                                              WrapCrossAlignment.end,
                                          children: [
                                            ListTile(
                                              leading: const Icon(Icons.camera),
                                              title: const Text('Camera'),
                                              onTap: () {
                                                pendaftaranController
                                                    .selectImage2(
                                                        ImageSource.camera);
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.image),
                                              title: const Text('Gallery'),
                                              onTap: () {
                                                pendaftaranController
                                                    .selectImage2(
                                                        ImageSource.gallery);
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
                        // Button Submit
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
                                    'Save',
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
              ],
            ),
          ),
        ));
  }
}
