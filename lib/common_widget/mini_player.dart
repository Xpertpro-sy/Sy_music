import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/color_extention.dart';
import '../confirm-achats/songs/main-player-view.dart';
import '../view_mondel/all_songs_view_model.dart';

class MiniPlayerWidget extends StatefulWidget {
  const MiniPlayerWidget({super.key});

  @override
  State<MiniPlayerWidget> createState() => _MiniPlayerWidgetState();
}

double currentSlider = 0;

class _MiniPlayerWidgetState extends State<MiniPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    // final allVM = Get.find<AllSongsViewModel>();
    final AllSongsViewModel allVM = Get.find<AllSongsViewModel>();

    return Obx(() => AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: allVM.currentSong.value != null
          ? _buildPlayerContent(allVM)
          : const SizedBox.shrink(),
    ));
  }

  Widget _buildPlayerContent(AllSongsViewModel vm) {
    final sObj = vm.currentSong.value!;

    return Container(
      key: const ValueKey('mini-player'),
      height: 100,
      child: Stack(
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          Container(
            // key: const ValueKey('mini-player'),
            // height: 100,
            // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: TColor.bg.withOpacity(0.6),
              borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -1),
                )
              ],
            ),
            child: InkWell(
              onTap: () => Get.to(() => const MainPlayerView()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: sObj["image"].toString(),
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Image.asset(
                              "assets/img/cover.jpg",
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.music_note,
                              color: TColor.primaryText28,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sObj["name"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: TColor.primaryText60,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                sObj["artists"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: TColor.primaryText28,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                              () => Row(
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  vm.isPlaying.value
                                      ? "assets/img/pause.png"
                                      : "assets/img/play_btn.png",
                                  width: 30,
                                  color: TColor.primary,
                                ),
                                onPressed: vm.togglePlayPause,
                              ),
                              SizedBox(width: 6),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/img/next_song.png",
                                    width: 25,
                                    color: TColor.primary,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Début
                          Obx(() => Text(
                            vm.formatDuration(vm.currentPosition.value),
                            style: TextStyle(color: Colors.white),
                          )),

                          // Slider
                          Container(
                            width: MediaQuery.of(context).size.width - 120,
                            child: Obx(() => SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
                                trackShape: RectangularSliderTrackShape(),
                                trackHeight: 4,
                              ),
                              child: Slider(
                                value: vm.currentPosition.value,
                                max: vm.totalDuration.value,
                                min: 0,
                                inactiveColor: Colors.grey[500],
                                activeColor: Colors.white,
                                onChanged: (val) {
                                  vm.currentPosition.value = val;
                                  // Ajouter ici la logique de changement de position audio
                                },
                              ),
                            )),
                          ),

                          // Fin
                          Obx(() => Text(
                            vm.formatDuration(vm.totalDuration.value),
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}