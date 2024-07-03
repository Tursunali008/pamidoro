import 'package:flutter/material.dart';
import 'package:pamidoro/provider/pomodoro_provider.dart';
import 'package:pamidoro/screen/pomodoro_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PomodoroTimer(),
      
      child: MaterialApp(
        title: 'Pomodoro App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: PomodoroScreen(),
      ),
    );
  }
}
