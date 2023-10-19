import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService();

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String> behaviorSubject = BehaviorSubject();

  Future<void> initialize() async {
    const androidInitialize = AndroidInitializationSettings('@mipmap/ic_launcher');

    tz.initializeTimeZones();
    tz.setLocalLocation(
      tz.getLocation(
        await FlutterTimezone.getLocalTimezone(),
      ),
    );

    final initializationSettingsDarwin = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: initializationSettingsDarwin,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings, /*onDidReceiveNotificationResponse: selectNotification*/
    );
  }

  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {
    debugPrint('id $id');
  }

  void selectNotification(NotificationResponse notificationResponse) {
    if (notificationResponse.payload != null &&
        notificationResponse.payload!.isNotEmpty) {
      behaviorSubject.add(notificationResponse.payload!);
    }
  }

  Future<void> showTaskNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidNotification = AndroidNotificationDetails(
      'Resourse',
      'chanel_name',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );

    const darwinNotification = DarwinNotificationDetails(
      presentSound: true,
      presentAlert: true,
    );

    const notification = NotificationDetails(
      android: androidNotification,
      iOS: darwinNotification,
    );

    await _flutterLocalNotificationsPlugin.show(id, title, body, notification);
  }

  Future<NotificationDetails> _notificationDetails() async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      groupKey: 'com.example.resourse_app',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      color: Color(0xff2196f3),
    );

    const iosNotificationDetails = DarwinNotificationDetails(
      threadIdentifier: 'thread1',
    );

    final details = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      behaviorSubject.add(details.notificationResponse?.payload ?? '');
    }
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosNotificationDetails,
    );

    return platformChannelSpecifics;
  }

  Future<void> showScheduledLocalNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required DateTime date,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.local(
        date.year,
        date.month,
        date.day,
        date.hour,
        date.minute,
      ),
      platformChannelSpecifics,
      payload: payload,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> deleteLocalNotification({
    required int index,
  }) async {
    await _flutterLocalNotificationsPlugin.cancel(index);
  }
}
