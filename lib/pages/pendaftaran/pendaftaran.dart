import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sampang/controllers/pendaftaran_controller.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_header.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_left.dart';
import 'package:sampang/pages/cek_data_kendaraan/text_right.dart';
import 'package:sampang/pages/pendaftaran/loading_button.dart';
import 'package:sampang/pages/persyaratan/background_header.dart';
import 'package:sampang/utils/colors.dart';
import 'package:sampang/utils/containers/app_bar_header.dart';
import 'package:sampang/utils/containers/box_container.dart';

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({super.key});

  @override
  State<PendaftaranPage> createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  final PendaftaranController pendaftaranController =
      Get.find<PendaftaranController>();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          child: Column(
            children: [
              const BackgroundHeader(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .89,
                child: SingleChildScrollView(
                  child: Form(
                    key: pendaftaranController.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // UPLOAD IMAGE
                          GetBuilder<PendaftaranController>(
                            builder: (c) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      child: BoxContainer(
                                        padding: const EdgeInsets.all(20),
                                        shadow: true,
                                        child: Column(
                                          children: [
                                            const Text(
                                              'FOTO KTP',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Gap(10),
                                            SizedBox(
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
                                                                .pickedFile1!
                                                                .path),
                                                          )
                                                        : const AssetImage(
                                                                'assets/images/no_image.png')
                                                            as ImageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  16.0)),
                                                ),
                                                child: Wrap(
                                                  alignment: WrapAlignment.end,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.end,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.camera),
                                                      title:
                                                          const Text('Camera'),
                                                      onTap: () {
                                                        pendaftaranController
                                                            .selectImage1(
                                                                ImageSource
                                                                    .camera);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.image),
                                                      title:
                                                          const Text('Gallery'),
                                                      onTap: () {
                                                        pendaftaranController
                                                            .selectImage1(
                                                                ImageSource
                                                                    .gallery);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                    InkWell(
                                      child: BoxContainer(
                                        padding: const EdgeInsets.all(20),
                                        shadow: true,
                                        child: Column(
                                          children: [
                                            const Text(
                                              'FOTO STNK',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Gap(10),
                                            SizedBox(
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
                                                                .pickedFile2!
                                                                .path),
                                                          )
                                                        : const AssetImage(
                                                                'assets/images/no_image.png')
                                                            as ImageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0)),
                                              ),
                                              child: Wrap(
                                                alignment: WrapAlignment.end,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.end,
                                                children: [
                                                  ListTile(
                                                    leading: const Icon(
                                                        Icons.camera),
                                                    title: const Text('Camera'),
                                                    onTap: () {
                                                      pendaftaranController
                                                          .selectImage2(
                                                              ImageSource
                                                                  .camera);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading:
                                                        const Icon(Icons.image),
                                                    title:
                                                        const Text('Gallery'),
                                                    onTap: () {
                                                      pendaftaranController
                                                          .selectImage2(
                                                              ImageSource
                                                                  .gallery);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const Gap(20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      child: BoxContainer(
                                        padding: const EdgeInsets.all(20),
                                        shadow: true,
                                        child: Column(
                                          children: [
                                            const Text(
                                              'FOTO KARTU UJI',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Gap(10),
                                            SizedBox(
                                              height: 115,
                                              width: 115,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                fit: StackFit.expand,
                                                children: [
                                                  Image(
                                                    image: pendaftaranController
                                                                .pickedFile3 !=
                                                            null
                                                        ? FileImage(
                                                            File(pendaftaranController
                                                                .pickedFile3!
                                                                .path),
                                                          )
                                                        : const AssetImage(
                                                                'assets/images/no_image.png')
                                                            as ImageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  16.0)),
                                                ),
                                                child: Wrap(
                                                  alignment: WrapAlignment.end,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.end,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.camera),
                                                      title:
                                                          const Text('Camera'),
                                                      onTap: () {
                                                        pendaftaranController
                                                            .selectImage3(
                                                                ImageSource
                                                                    .camera);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.image),
                                                      title:
                                                          const Text('Gallery'),
                                                      onTap: () {
                                                        pendaftaranController
                                                            .selectImage3(
                                                                ImageSource
                                                                    .gallery);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                    InkWell(
                                      child: BoxContainer(
                                        padding: const EdgeInsets.all(20),
                                        shadow: true,
                                        child: Column(
                                          children: [
                                            const Text(
                                              'FOTO SERTIFIKAT UJI',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Gap(10),
                                            SizedBox(
                                              height: 115,
                                              width: 115,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                fit: StackFit.expand,
                                                children: [
                                                  Image(
                                                    image: pendaftaranController
                                                                .pickedFile4 !=
                                                            null
                                                        ? FileImage(
                                                            File(pendaftaranController
                                                                .pickedFile4!
                                                                .path),
                                                          )
                                                        : const AssetImage(
                                                                'assets/images/no_image.png')
                                                            as ImageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0)),
                                              ),
                                              child: Wrap(
                                                alignment: WrapAlignment.end,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.end,
                                                children: [
                                                  ListTile(
                                                    leading: const Icon(
                                                        Icons.camera),
                                                    title: const Text('Camera'),
                                                    onTap: () {
                                                      pendaftaranController
                                                          .selectImage4(
                                                              ImageSource
                                                                  .camera);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading:
                                                        const Icon(Icons.image),
                                                    title:
                                                        const Text('Gallery'),
                                                    onTap: () {
                                                      pendaftaranController
                                                          .selectImage4(
                                                              ImageSource
                                                                  .gallery);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(30),

                          // PILIH TANGGAL UJI
                          Row(
                            children: [
                              // TEXT FIELD SEARCH
                              Expanded(
                                child: TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        DateFormat('dd MMMM yyyy', 'id_ID')
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

                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: pendaftaranController.nouji,
                            onEditingComplete: () => node.nextFocus(),
                            onFieldSubmitted: (value) => pendaftaranController
                                .getDetailDataKendaraan(value),
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
                          Obx(() {
                            if (pendaftaranController
                                .isLoadingDetailKendaraan.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return BoxContainer(
                                padding: const EdgeInsets.all(10),
                                radius: 5,
                                showBorder: true,
                                borderColor: Colors.grey.shade200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TextHeader(
                                      nama: 'Identitas Kendaraan',
                                    ),
                                    const Gap(10),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'No Kendaraan'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .noKendaraan ??
                                              '-',
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'Nama Pemilik'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .pemilik ??
                                              '-',
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'Jenis Kendaraan'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .jnsKend ??
                                              '-',
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'Nama Komersil'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .namaKomersil ??
                                              '-',
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'Merk'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .merk ??
                                              '-',
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'Tipe'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .tipe ??
                                              '-',
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'No. Chasis'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .noChasis ??
                                              '-',
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const TextLeft(nama: 'No. Mesin'),
                                        const Spacer(),
                                        TextRight(
                                          nama: pendaftaranController
                                                  .resultDataDetailKendaraan
                                                  .value
                                                  .noMesin ??
                                              '-',
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                          }),

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
                                        'Daftar Uji',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                          const Gap(10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
