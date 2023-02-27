import 'package:flutter/material.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration:
          const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
      child: IconButton(
        icon: const Icon(Icons.pause),
        color: Colors.white,
        iconSize: 55,
        onPressed: () {},
      ),
    );
  }
}
