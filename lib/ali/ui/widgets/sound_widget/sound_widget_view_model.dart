import 'package:just_audio/just_audio.dart';

class SoundWidgetViewModel {
  final Function _refresh;

  SoundWidgetViewModel(this._refresh);

  static AudioPlayer? _player;

  AudioPlayer? get player => _player;

  List<String> links = List.generate(8, (index) => "https://server8.mp3quran.net/ahmad_huth/00${index + 1}.mp3");

  // init
  void init() async {
    print("from init");
    if (_player == null) {
      _player = AudioPlayer();
      var playList = ConcatenatingAudioSource(children: links.map((e) => AudioSource.uri(Uri.parse(e), tag: e)).toList());
      await _player!.setLoopMode(LoopMode.all);
      await _player!.setAudioSource(playList);
    }
  }

  // play and stop

  void playOrStop() {
    if (player?.playing ?? false) {
      _stop();
      return;
    }
    if (!(player?.playing ?? false)) _play();
  }

  void _play() async {
    await _player?.play();
  }

  void _stop() async {
    await _player?.stop();
  }

  void next() async {
    await _player?.seekToNext();
  }

  void previous() async {
    await _player?.seekToPrevious();
  }
}
