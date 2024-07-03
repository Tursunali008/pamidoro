import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PomodoroTimer extends ChangeNotifier {
  int totalRounds = 4;
  int totalGoals = 12;
  int roundsCompleted = 0;
  int goalsCompleted = 0;
  int remainingSeconds = 0;
  bool isRunning = false;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  PomodoroTimer() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    setDuration(25);
  }

  void setDuration(int minutes) {
    remainingSeconds = minutes * 60;
    notifyListeners();
  }

  String get timerString {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    if (isRunning) return;
    isRunning = true;
    _tick();
    notifyListeners();
  }

  void stopTimer() {
    isRunning = false;
    notifyListeners();
  }

  Future<void> _tick() async {
    while (isRunning && remainingSeconds > 0) {
      await Future.delayed(Duration(seconds: 1));
      if (!isRunning) return;
      remainingSeconds--;
      notifyListeners();
    }

    if (remainingSeconds == 0) {
      roundsCompleted++;
      if (roundsCompleted >= totalRounds) {
        goalsCompleted++;
        roundsCompleted = 0;
      }
      _showNotification();
      stopTimer();
    }
  }

  Future<void> _showNotification() async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'pomodoro_channel',
      'Pomodoro Notifications',
      channelDescription: 'Notifications for Pomodoro Timer',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Pomodoro Timer',
      'Time is up!',
      platformChannelSpecifics,
      payload: 'Pomodoro completed',
    );
  }
}
