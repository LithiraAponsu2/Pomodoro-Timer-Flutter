import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = "FOCUS";
  int userGoal = 8;

  double selectedBreak = 300;
  double currentBreakDuration = 300;

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (currentDuration == 0) {
          handleNextRound();
        } else {
          currentDuration--;
          notifyListeners();
        }
      },
    );
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void selectBreak(double seconds) {
    selectedBreak = seconds;
    currentBreakDuration = seconds;
    notifyListeners();
  }

  void handleNextRound() {
    if (goal < userGoal) {
      if (currentState == "FOCUS" && rounds < 3) {
        currentState = "BREAK";
        currentDuration = selectedBreak;
        rounds++;
        goal++;
      } else if (currentState == "FOCUS" && rounds == 3) {
        currentState = "LONGBREAK";
        // currentDuration = 900;
        currentDuration = 10;
        rounds++;
        goal++;
      } else if (currentState == "BREAK") {
        currentState = "FOCUS";
        currentDuration = selectedTime;
        // rounds = 0;
      } else if (currentState == "LONGBREAK") {
        currentState = "FOCUS";
        currentDuration = selectedTime;
        rounds = 0;
      }
    } else {
      currentState = "DONE";
    }

    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = "FOCUS";
    currentDuration = 1500;
    rounds = goal = 0;
    timerPlaying = false;
    notifyListeners();
  }
}
