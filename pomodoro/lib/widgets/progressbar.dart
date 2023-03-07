import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Service/timerservice.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Center(
      child: Container(
        height: 180,
        width: 180,
        // color: Color.fromRGBO(242, 255, 0, 1),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 50, 54, 100),
          shape: BoxShape.circle,
        ),
        child: CircularProgressIndicator(
          value: 1 - (provider.currentDuration / provider.selectedTime),
          color: Color.fromARGB(255, 128, 112, 215),
          backgroundColor: Color.fromARGB(255, 12, 26, 49),

          // minHeight: 5,
        ),
      ),
    );
  }
}
