import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/color_extention.dart';
import '../confirm-achats/songs/main-player-view.dart';
import '../view_mondel/all_songs_view_model.dart';

class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({super.key});

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
      height: 70,
      decoration: BoxDecoration(
        color: TColor.bg.withOpacity(0.97),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: InkWell(
        onTap: () => Get.to(() => const MainPlayerView()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
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
                        )

                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}