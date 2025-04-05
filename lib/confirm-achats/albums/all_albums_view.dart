import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/all_albums_row.dart';
import '../../view_mondel/all_albums_view_model.dart';

class AllAlbumsView extends StatefulWidget {
  const AllAlbumsView({super.key});

  @override
  State<AllAlbumsView> createState() => _AllAlbumsViewState();
}

class _AllAlbumsViewState extends State<AllAlbumsView> {

  final allVM = Get.put(AllAlbumsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx( () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: allVM.allListAlbum.length,
          itemBuilder: (context, index) {
            var sObj = allVM.allListAlbum[index];

            return AllAlbumsRow(
              sObj: sObj,
              onPressed: () {},
              onPressedPlay: () {},
            );
          }),
      ),
    );
  }
}
