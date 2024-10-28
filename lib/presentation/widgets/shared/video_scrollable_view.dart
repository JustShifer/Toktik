import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key, 
    required this.videos});

  @override
  Widget build(BuildContext context) {


    return  PageView.builder(
      //crea un espacio en negro como para cargar mas cosas pero sin encontrar mas.
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // Video player + grandient
             SizedBox(
              child:  FullscreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.urlVideo,
                ),
              ),

            Positioned(
              bottom: 50,
              right: 30,
              child: VideoButtons(
                video: videoPost))
          ],
        );
      },
    );
  }
}