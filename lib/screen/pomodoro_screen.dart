import 'package:flutter/material.dart';
import 'package:pamidoro/provider/pomodoro_provider.dart';
import 'package:pamidoro/widget/duration_button.dart';
import 'package:pamidoro/widget/start_stop.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timer = Provider.of<PomodoroTimer>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('POMOTIMER'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FOCUS',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              timer.timerString,
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 5, 15, 30, 60].map((int minutes) {
                return DurationButton(minutes: minutes);
              }).toList(),
            ),
            const SizedBox(height: 20),
            StartStopButton(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '${timer.roundsCompleted}/${timer.totalRounds}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('ROUND'),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      '${timer.goalsCompleted}/${timer.totalGoals}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('GOAL'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
