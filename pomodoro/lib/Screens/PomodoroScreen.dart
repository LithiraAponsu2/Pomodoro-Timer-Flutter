import 'package:flutter/material.dart';
import 'package:pomodoro/utils.dart';
import 'package:pomodoro/widgets/breakoptions.dart';
import 'package:pomodoro/widgets/progressbar.dart';
import 'package:pomodoro/widgets/progresstree.dart';
import 'package:pomodoro/widgets/progresswidget.dart';
import 'package:pomodoro/widgets/timecontroller.dart';
import 'package:pomodoro/widgets/timeoptions.dart';
import 'package:pomodoro/widgets/timercard.dart';
import 'package:provider/provider.dart';

import '../Service/timerservice.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 34, 62),
      // backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 31, 34, 62),
        title: Text(
          "Pomodoro",
          style: textStyle(
            25,
            Color.fromARGB(255, 217, 224, 250),
            FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).reset(),
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(100, 152, 159, 198),
              size: 40,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  ProgressBar(),
                  ProgressTree(),
                ],
              ),
              // ProgressTree(),
              SizedBox(
                height: 20,
              ),
              TimerCard(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Focus Time",
                style: textStyle(
                  18,
                  Color.fromARGB(255, 231, 120, 116),
                  FontWeight.normal,
                ),
              ),
              TimeOptions(),
              SizedBox(
                height: 5,
              ),
              Text(
                "Break",
                style: textStyle(
                  18,
                  Color.fromARGB(255, 231, 120, 116),
                  FontWeight.normal,
                ),
              ),
              BreakOptions(),
              SizedBox(
                height: 1,
              ),
              // ProgressBar(),
              SizedBox(
                height: 20,
              ),
              TimeController(),
              SizedBox(
                height: 20,
              ),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
