import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/all_song_row.dart';
import '../../common_widget/mini_player.dart';
import '../../view_mondel/all_songs_view_model.dart';


class AllSongsView extends StatefulWidget {
  const AllSongsView({super.key});

  @override
  State<AllSongsView> createState() => _AllSongsViewState();
}

class _AllSongsViewState extends State<AllSongsView> {
  final allVM = Get.put(AllSongsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
                () => ListView.builder(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 80, // Espace pour le mini-player
              ),
              itemCount: allVM.allList.length,
              itemBuilder: (context, index) {
                final sObj = allVM.allList[index];
                return AllSongRow(
                  sObj: sObj,
                  isWeb: true,
                  onPressed: () {},
                  onPressedPlay: () {
                    allVM.setCurrentSong(sObj);
                    // playerPlayProcessDebounce(...);
                  },
                );
              },
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MiniPlayerWidget(),
          ),
        ],
      ),
    );
  }
}