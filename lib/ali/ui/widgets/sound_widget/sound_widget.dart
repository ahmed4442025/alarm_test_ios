import 'package:alarm_test_ios/ali/ui/widgets/sound_widget/sound_widget_view_model.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SoundWidget extends StatefulWidget {
  const SoundWidget({Key? key}) : super(key: key);

  @override
  State<SoundWidget> createState() => _SoundWidgetState();
}

class _SoundWidgetState extends State<SoundWidget> {
  void _refresh() {
    if (mounted) setState(() {});
  }

  late final SoundWidgetViewModel _model = SoundWidgetViewModel(_refresh);

  @override
  void initState() {
    super.initState();
    _model.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Slider(
            value: 2,
            min: 0,
            max: 5,
            onChanged: (double value) {
              setState(() {
                // audioPlayer.seek(Duration(seconds: value.toInt()));
              });
            },
          ),
          controllers,
        ],
      ),
    );
  }

  Widget get progress =>ProgressBar(
    thumbColor: Colors.white ,//AppColors.whiteColors,
    barHeight: 3, // 3.h,
    baseBarColor: Colors.greenAccent,// AppColors.colorApps2,
    bufferedBarColor: Colors.greenAccent, //AppColors.colorApps2,
    progressBarColor: Colors.white54,//AppColors.whiteColors,
    timeLabelTextStyle: const TextStyle(
        color: Colors.white54,//AppColors.whiteColors,
        fontSize: 12,//12.sp,
        // fontFamily: Fonts.poppins
    ),
    progress: quranSoundCubit.positionData?.position ?? Duration.zero,
    buffered: quranSoundCubit.positionData?.bufferedPosition ?? Duration.zero,
    total: quranSoundCubit.positionData?.duration ?? Duration.zero,
    onSeek: _model.player?.seek);


  Widget get controllers {
    return StreamBuilder<PlayerState>(
        stream: _model.player?.playerStateStream,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: _model.previous,
              ),
              IconButton(
                icon: snapshot.data?.playing ?? false ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                onPressed: _model.playOrStop,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: _model.next,
              ),
            ],
          );
        });
  }
}
