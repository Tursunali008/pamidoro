import 'package:flutter/material.dart';
import 'package:pamidoro/provider/pomodoro_provider.dart';
import 'package:provider/provider.dart';

class DurationButton extends StatelessWidget {
  final int minutes;

  const DurationButton({super.key, required this.minutes});

  @override
  Widget build(BuildContext context) {
    final timer = Provider.of<PomodoroTimer>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => timer.setDuration(minutes),
        child: Text('$minutes'),
      ),
    );
  }
}
