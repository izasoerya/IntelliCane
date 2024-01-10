import 'package:firebase_messaging/firebase_messaging.dart';

class MessageStructure {
  MessageStructure({required this.message}) {
    initializeFields();
  }

  RemoteMessage message;
  late String notificationTitle;
  late String notificationBody;
  late String dataTitle;
  late double dataLatitude;
  late double dataLongitude;

  void initializeFields() {
    notificationTitle = message.notification?.title ?? "";
    notificationBody = message.notification?.body ?? "";
    dataTitle = message.data['id'] ?? "";
    dataLatitude = message.data["latitude"] != null
        ? double.parse(message.data["latitude"] as String)
        : 0.0;
    dataLongitude = message.data["longitude"] != null
        ? double.parse(message.data["longitude"] as String)
        : 0.0;
  }
}
