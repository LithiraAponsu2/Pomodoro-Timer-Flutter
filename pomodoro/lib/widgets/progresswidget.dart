import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';

import '../Service/timerservice.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(
                30,
                Colors.grey[350],
                FontWeight.w700,
              ),
            ),
            Text(
              "${provider.goal}/12",
              style: textStyle(
                30,
                Colors.grey[350],
                FontWeight.w700,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Round",
              style: textStyle(
                25,
                Colors.grey[350],
                FontWeight.w700,
              ),
            ),
            Text(
              "Goal",
              style: textStyle(
                25,
                Colors.grey[350],
                FontWeight.w700,
              ),
            )
          ],
        ),
      ],
    );
  }
}
