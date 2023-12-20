import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationManager {
  static FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static NotificationDetails notificationDetails = const NotificationDetails();

  static String channelId = 'general';
  static String channelName = 'General';
  static String channelDesciption = 'Notification from firebase flutter';

  static void initialize() {
    /// 2 requesting permission
    requestPermission();

    initializePlatfrom();

  }

  ///3 a Requesting permission
  static void requestPermission() {
    if (Platform.isIOS) {
      requestIOSPermission();
    } else if (Platform.isAndroid) {
      requestAndriodPermission();
    }
  }

  /// TODO Request ios permission
  static void requestIOSPermission() {}

  static Future<void> requestAndriodPermission() async {
    var andriodInfo = await DeviceInfoPlugin().androidInfo;
    int? sdkInt = andriodInfo.version.sdkInt;

    if (sdkInt >= 33) {
      _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
  }

  static void initializePlatfrom() {

    /// 4a Initializing andriod and ios
    InitializationSettings initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings('drawable/logo'),
    );


    _notificationsPlugin.initialize(initializationSettings);

    ///5  get npotifiaction details
    getNotificationDetails(null);


  }

  static Future<NotificationDetails>  getNotificationDetails(RemoteMessage? message) async {


    notificationDetails = NotificationDetails(
      android: await andriodNotificationDetails(message)
    );

    return notificationDetails;
  }

  static Future<AndroidNotificationDetails> andriodNotificationDetails(RemoteMessage? message) async {

        return AndroidNotificationDetails(
            channelId,
            channelName,
          channelDescription: channelDesciption,
          importance: Importance.high,
          priority: Priority.high,
          fullScreenIntent: true,
          playSound: true,

          icon:  'drawable/logo',
          channelAction: AndroidNotificationChannelAction.createIfNotExists,
        );
  }
}
