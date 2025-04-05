import 'package:flutter/material.dart';

import '../common/color_extention.dart';
import '../confirm-achats/albums/all_albums_view.dart';
import '../confirm-achats/ep/all_ep_view.dart';
import '../confirm-achats/mixtape/all_mixtape_view.dart';
import '../confirm-achats/songs/all_songs_view.dart';



class AccueilPage extends StatelessWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: TColor.bg,
                pinned: true,
                floating: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SyMusic",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            color: Colors.white54,
                            size: 28,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.segment_outlined,
                            color: Colors.white54,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                bottom: AppBar(
                  backgroundColor: TColor.bg,
                  elevation: 0,
                  title: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.7),
                    labelColor: Colors.white,
                    tabs: [
                      Tab(child: Text('Chansons')),
                      Tab(child: Text('Album')),
                      Tab(child: Text('Mixtape')),
                      Tab(child: Text('Ep')),
                      Tab(child: Text('Clip')),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              AllSongsView(),
              AllAlbumsView(),
              AllMixtapeView(),
              AllEpView(),
              Icon(Icons.music_video_outlined, size: 350),
            ],
          ),
        ),
      ),
    );
  }
}

