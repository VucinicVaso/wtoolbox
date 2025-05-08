import 'dart:async';
import '../../3rd_party/lib_local_notification.dart';

abstract class WTLocalNotificationService {

  FlutterLocalNotificationsPlugin? localNotificationPlugin;

  String? channelId, channelName, channelDescription;
  void setChannelId(String? v) { channelId = v; }
  void setChannelName(String? v) { channelName = v; }
  void setChannelDescription(String? v) { channelDescription = v; }

  Future<bool>? initialize();

  Future<NotificationDetails> notificationDetails();

  Future<void> showNotification({ required int id, required String title, required String body });

  void onDidReceiveNotificationResponse(NotificationResponse? response);

}