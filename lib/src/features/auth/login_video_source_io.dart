import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

/// Copies the login clip to a local MP4 the platform player can seek.
///
/// The source is a QuickTime HEVC file with the movie header after the
/// media data. Android cannot play that straight from a Flutter asset.
Future<VideoPlayerController> openLoginVideo(String assetPath) async {
  final data = await rootBundle.load(assetPath);
  final bytes = data.buffer.asUint8List(
    data.offsetInBytes,
    data.lengthInBytes,
  );
  _retagAsMp4(bytes);

  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/imsh_login_bg.mp4');
  await file.writeAsBytes(bytes, flush: true);
  return VideoPlayerController.file(file);
}

void _retagAsMp4(Uint8List bytes) {
  if (bytes.length < 20) return;
  final isFtyp =
      bytes[4] == 0x66 &&
      bytes[5] == 0x74 &&
      bytes[6] == 0x79 &&
      bytes[7] == 0x70;
  final isQuickTime = bytes[8] == 0x71 && bytes[9] == 0x74;
  if (!isFtyp || !isQuickTime) return;

  // major brand: mp42
  bytes[8] = 0x6d;
  bytes[9] = 0x70;
  bytes[10] = 0x34;
  bytes[11] = 0x32;
  // compatible brand: isom
  if (bytes[16] == 0x71 && bytes[17] == 0x74) {
    bytes[16] = 0x69;
    bytes[17] = 0x73;
    bytes[18] = 0x6f;
    bytes[19] = 0x6d;
  }
}
