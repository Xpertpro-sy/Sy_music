import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/all_ep_row.dart';
import '../../view_mondel/all_ep_view_model.dart';

class AllEpView extends StatefulWidget {
  const AllEpView({super.key});

  @override
  State<AllEpView> createState() => _AllEpViewState();
}

class _AllEpViewState extends State<AllEpView> {

  final allVM = Get.put(AllEpViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx( () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: allVM.allListEp.length,
          itemBuilder: (context, index) {
            var sObj = allVM.allListEp[index];

            return AllEpRow(
              sObj: sObj,
              onPressed: () {},
              onPressedPlay: () {},
            );
          }),
      ),
    );
  }
}
