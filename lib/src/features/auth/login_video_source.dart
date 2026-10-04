import 'package:video_player/video_player.dart';

import 'login_video_source_stub.dart'
    if (dart.library.io) 'login_video_source_io.dart' as source;

Future<VideoPlayerController> openLoginVideo(String assetPath) {
  return source.openLoginVideo(assetPath);
}
