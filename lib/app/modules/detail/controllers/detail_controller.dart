import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final audioPlayer = AudioPlayer();
  var isLaoding = false.obs;
  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var durationPosition = Duration.zero.obs;

  void playMusic(String url) async {
    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying(state == PlayerState.playing);
      isLaoding(state == PlayerState.playing);
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      duration.value = newDuration;
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      durationPosition.value = newPosition;
    });

    isLaoding(true);
    isPlaying(true);

    if (url.isNotEmpty) {
      UrlSource audioUrl = UrlSource(url);
      await audioPlayer.play(audioUrl);
    }
  }

  void setMusicPosition(double value) async {
    final position = Duration(seconds: value.toInt());
    await audioPlayer.seek(position);
  }

  void pauseMusic() async {
    await audioPlayer.pause();
    isPlaying(false);
    isLaoding(false);
  }

  void stopMusic() async {
    await audioPlayer.stop();
    isPlaying(false);
    isLaoding(false);
  }
}
