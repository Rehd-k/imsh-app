import 'package:video_player/video_player.dart';

Future<VideoPlayerController> openLoginVideo(String assetPath) async {
  return VideoPlayerController.asset(assetPath);
}
