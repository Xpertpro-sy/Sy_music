import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/all_mixtape_row.dart';
import '../../view_mondel/all_mixtape_view_model.dart';

class AllMixtapeView extends StatefulWidget {
  const AllMixtapeView({super.key});

  @override
  State<AllMixtapeView> createState() => _AllMixtapeViewState();
}

class _AllMixtapeViewState extends State<AllMixtapeView> {

  final allVM = Get.put(AllMixtapeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx( () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: allVM.allListMixtape.length,
          itemBuilder: (context, index) {
            var sObj = allVM.allListMixtape[index];

            return AllMixtapeRow(
              sObj: sObj,
              onPressed: () {},
              onPressedPlay: () {},
            );
          }),
      ),
    );
  }
}
