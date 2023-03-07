import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../Service/timerservice.dart';

class ProgressTree extends StatefulWidget {
  const ProgressTree({super.key});

  @override
  State<ProgressTree> createState() => _ProgressTreeState();
}

class _ProgressTreeState extends State<ProgressTree> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  double value = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Center(
      child: Container(
        height: 180,
        width: 180,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 50, 54, 100),
          shape: BoxShape.circle,
        ),
        child: RiveAnimation.asset(
          'assets/tree_demo.riv',
          fit: BoxFit.scaleDown,
          onInit: (artboard) {
            controller = StateMachineController.fromArtboard(
              artboard,
              'State Machine 1',
            );

            if (controller != null) {
              artboard.addController(controller!);
              inputValue = controller?.findInput("input");
              // inputValue?.change();
              // print(provider.selectedTime);
              provider.addListener(() {
                value =
                    (1 - (provider.currentDuration / provider.selectedTime)) *
                        100;
                inputValue?.change(value);
                // print(value);
              });
            }
          },
        ),
      ),
    );
  }
}
