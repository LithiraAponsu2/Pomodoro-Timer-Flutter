import 'package:flutter/material.dart';
import 'package:pomodoro/Service/timerservice.dart';
import 'package:pomodoro/utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 45,

      width: MediaQuery.of(context).size.width - 15,
      // color: Color.fromARGB(255, 21, 26, 47),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.5), // <= No more error here :)
        color: Color.fromARGB(255, 21, 26, 47),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(initialScrollOffset: 300.0),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: selectedTimes.map((time) {
            return InkWell(
              onTap: () => provider.selectTime(
                double.parse(time),
              ),
              child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  width: 55,
                  height: 35,
                  decoration: int.parse(time) == provider.selectedTime
                      ? BoxDecoration(
                          color: Color.fromARGB(255, 231, 120, 116),
                          borderRadius: BorderRadius.circular(17.5),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 112, 118, 147),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                  child: Center(
                    child: Text(
                      (int.parse(time) ~/ 60).toString(),
                      style: textStyle(
                        25,
                        int.parse(time) == provider.selectedTime
                            ? Color.fromARGB(255, 31, 34, 62)
                            : Color.fromARGB(255, 152, 159, 198),
                        FontWeight.w700,
                      ),
                    ),
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
