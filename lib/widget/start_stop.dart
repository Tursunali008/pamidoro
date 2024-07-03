import 'package:flutter/material.dart';
import 'package:pamidoro/provider/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({super.key});

  @override
  Widget build(BuildContext context) {
    final timer = Provider.of<PomodoroTimer>(context);

    return ElevatedButton(
      onPressed: timer.isRunning ? timer.stopTimer : timer.startTimer,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Icon(
        timer.isRunning ? Icons.pause : Icons.play_arrow,
        size: 60,
      ),
    );
  }
}
