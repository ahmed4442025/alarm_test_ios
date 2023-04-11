import 'package:flutter/material.dart';

import 'widgets/sound_widget/sound_widget.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          SoundWidget(),
          SoundWidget(),
          SoundWidget(),
        ],
      ),
    );
  }
}
