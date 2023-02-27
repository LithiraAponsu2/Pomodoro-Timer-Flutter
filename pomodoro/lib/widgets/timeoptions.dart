import 'package:flutter/material.dart';
import 'package:pomodoro/Service/timerservice.dart';
import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectedTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(
              double.parse(time),
            ),
            child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: 70,
                height: 50,
                decoration: int.parse(time) == provider.selectedTime
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      )
                    : BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white30),
                        borderRadius: BorderRadius.circular(5),
                      ),
                child: Center(
                  child: Text(
                    (int.parse(time) ~/ 60).toString(),
                    style: textStyle(
                      25,
                      int.parse(time) == provider.selectedTime
                          ? Colors.blueAccent
                          : Colors.white,
                      FontWeight.w700,
                    ),
                  ),
                )),
          );
        }).toList(),
      ),
    );
  }
}
