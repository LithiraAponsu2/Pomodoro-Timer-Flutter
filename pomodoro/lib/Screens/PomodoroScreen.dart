import 'package:flutter/material.dart';
import 'package:pomodoro/utils.dart';
import 'package:pomodoro/widgets/progresswidget.dart';
import 'package:pomodoro/widgets/timecontroller.dart';
import 'package:pomodoro/widgets/timeoptions.dart';
import 'package:pomodoro/widgets/timercard.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Pomodoro",
          style: textStyle(
            25,
            Colors.white,
            FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [
              SizedBox(
                height: 15,
              ),
              TimerCard(),
              SizedBox(
                height: 40,
              ),
              TimeOptions(),
              SizedBox(
                height: 40,
              ),
              TimeController(),
              SizedBox(
                height: 40,
              ),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
