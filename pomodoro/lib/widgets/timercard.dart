import 'package:flutter/material.dart';
import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';

import '../Service/timerservice.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;
    return Column(
      children: [
        Text(
          provider.currentState,
          style: textStyle(
            35,
            Color.fromARGB(255, 231, 120, 116),
            FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 7,
              height: 50,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  // spreadRadius: 4,
                  // blurRadius: 4,
                  // offset: const Offset(0, 2),
                  // ),
                ],
              ),
              child: Center(
                child: Text(
                  (provider.currentDuration ~/ 60).toString().padLeft(2, '0'),
                  style: textStyle(
                    30,
                    Color.fromARGB(255, 200, 204, 231),
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(
                30,
                Color.fromARGB(255, 200, 204, 231),
                FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 7,
              height: 50,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 4,
                  //   blurRadius: 4,
                  //   offset: const Offset(0, 2),
                  // ),
                ],
              ),
              child: Center(
                child: Text(
                  seconds == 0
                      ? "${seconds.round()}0"
                      : seconds.round().toString().padLeft(2, '0'),
                  style: textStyle(
                    30,
                    Color.fromARGB(255, 200, 204, 231),
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
