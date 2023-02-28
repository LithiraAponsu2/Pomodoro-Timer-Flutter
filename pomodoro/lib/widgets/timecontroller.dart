import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Service/timerservice.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Container(
      width: 100,
      height: 100,
      decoration:
          const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
      child: IconButton(
        icon: provider.timerPlaying
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow_sharp),
        color: Colors.white,
        iconSize: 55,
        onPressed: () => provider.timerPlaying
            ? Provider.of<TimerService>(context, listen: false).pause()
            : Provider.of<TimerService>(context, listen: false).start(),
      ),
    );
  }
}
