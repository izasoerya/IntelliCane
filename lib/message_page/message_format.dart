import 'package:firebase_messaging/firebase_messaging.dart';

class MessageStructure {
  MessageStructure({required this.message}) {
    initializeFields();
  }

  RemoteMessage message;
  late String notificationTitle;
  late String notificationBody;
  late String dataTitle;
  late String dataBody;

  void initializeFields() {
    notificationTitle = message.notification?.title ?? "";
    notificationBody = message.notification?.body ?? "";
    dataTitle = message.data['title'] ?? "";
    dataBody = message.data['body'] ?? "";
  }
}
