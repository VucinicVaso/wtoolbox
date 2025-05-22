import '../../../3rd_party/lib_local_notification.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../wtoolbox_local_notification_service.dart';

class WTLocalNotificationServiceImpl extends WTLocalNotificationService {

  WTLocalNotificationServiceImpl() {
    initialize();
  }

  @override
  Future<bool>? initialize() async {
    // setChannelId('com.app.id');
    // setChannelName('com.app.id');
    // setChannelDescription('WTOOLBOX notifications.');

    localNotificationPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@drawable/ic_launcher');

    const DarwinInitializationSettings iosInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS:     iosInitializationSettings
    );

    bool? result = await localNotificationPlugin!.initialize(
      settings, 
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    return result!;
  }

  @override
  Future<NotificationDetails> notificationDetails() async {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channelId!,
      channelName!,
      channelDescription: channelDescription!,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true
    );

    DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
    );

    return NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  @override
  Future<void> showNotification({ required int id, required String title, required String body }) async {
    NotificationDetails details = await notificationDetails();

    WTLogger.write('-------------- WTLocalNotificationServiceImpl.showNotification');
    WTLogger.write('\n id: $id, title: $title, \n body: $body');
    WTLogger.write('------------------------------------------------------------');

    await localNotificationPlugin!.show(id, title, body, details);
  }

  @override
  void onDidReceiveNotificationResponse(NotificationResponse? response) {
    WTLogger.write('-------------- WTLocalNotificationServiceImpl.onDidReceiveNotificationResponse');
    WTLogger.write('id: ${response!.id}, \n input: ${response.input}, \n payload: ${response.payload}');
    WTLogger.write('------------------------------------------------------------');
  }

}
