import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskme/models/task_model.dart';
import 'package:taskme/utils/routes.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNotification() async {
    _configureLocalTimeZone();
    const DarwinInitializationSettings initIOSSettings =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      //onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    const AndroidInitializationSettings initAndroidSettings =
        AndroidInitializationSettings('appicon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initIOSSettings,
      android: initAndroidSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  Future _onDidReceiveNotificationResponse(
      NotificationResponse response) async {
    String? payload = response.payload;
    Get.toNamed(MyRoutes.getAllTasksPageRoute());
  }

  scheduleNotification(TaskModel task, int id) async {
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        task.title,
        task.description,
        _convertTime(task.time.toString(), task.date.toString()),
        const NotificationDetails(
            android: AndroidNotificationDetails("channelId", "channelName")),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: '$id',
      );
    } catch (error) {
      print(error.toString());
    }
  }

  void requestIOSPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  tz.TZDateTime _convertTime(String time, String date) {
    DateTime date = DateFormat.jm().parse(time);
    var myTime = DateFormat("HH:mm").format(date);
    final int hour = int.parse(myTime.split(':')[0]);
    final int min = int.parse(myTime.split(':')[1]);

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, min);
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timezone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timezone));
  }
}
