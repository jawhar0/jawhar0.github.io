import 'package:flutter/material.dart';
import 'package:maher_jaafar_portfolio/repositories/youtube_repository.dart';
import 'package:maher_jaafar_portfolio/screens/widgets/youtube_videos_widget/widgets/youtube_video_widget.dart';

class YoutubeVideosWidget extends StatelessWidget {
  YoutubeVideosWidget({
    Key key,
  }) : super(key: key);

  final youtubeRepo = YoutubeRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: youtubeRepo.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //final data = snapshot.data;
          //final myItems = data["items"];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: myItems.map<Widget>((e) {
            //   return (e['id']['kind'] == 'youtube#video')
            //       ?
            //       : Container();
            // }).toList(),
            children: [
              YoutubeVideoWidget(videoId: "-qgdkSU_cSY"),
              YoutubeVideoWidget(videoId: "U8FUmZT-BGU"),
              YoutubeVideoWidget(videoId: "soczCKU74KE"),
              YoutubeVideoWidget(videoId: "e7K71NNYBYY"),
              YoutubeVideoWidget(videoId: "uF90q43IbXc"),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
