import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jombang/controllers/search_bar_controller.dart';
import 'package:jombang/utils/colors.dart';
import 'package:jombang/pages/cek_data_kendaraan/search_bar_container.dart';
import 'package:jombang/utils/widgets/text_field_widget.dart';

class CekDataPage extends StatefulWidget {
  const CekDataPage({super.key});

  @override
  _CekDataPageState createState() => _CekDataPageState();
}

class _CekDataPageState extends State<CekDataPage> {
  final controller = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 100.0,
                floating: false,
                pinned: true,
                backgroundColor: MyColors.primary,
                title: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.goNamed('home');
                      },
                    ),
                    TextFieldWidget(
                      hint: "Ketik No Uji untuk cek data",
                      prefixIcon: Icons.search,
                      controller: controller.searchTextFieldController,
                      filled: true,
                      suffixIcon:
                          controller.isEmptyValue.value ? null : Icons.clear,
                      onTapSuffixIcon: () {
                        controller.searchTextFieldController.clear();
                        controller.isEmptyValue.value = true;
                      },
                      onChanged: (value) {
                        value.isEmpty
                            ? controller.isEmptyValue.value = true
                            : controller.isEmptyValue.value = false;
                      },
                    ),
                  ],
                ),
                flexibleSpace: const FlexibleSpaceBar(
                  // centerTitle: true,
                  // title: Text("Cek Data Kendaraan",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 16.0,
                  //     )),
                  background: Image(
                    image: AssetImage('assets/images/town.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'Identifikasi',
                      ),
                      Tab(
                        text: 'Dimensi',
                      ),
                      // Tab(icon: Icon(Icons.info), text: "Tab 1"),
                      // Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: const Center(
            child: Text("Sample text"),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
