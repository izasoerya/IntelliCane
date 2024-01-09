import 'package:firebase_messaging/firebase_messaging.dart';
import 'message_format.dart';

class FCMHandler {
  Future<void> initFCM(
      void Function(RemoteMessage message) incomingMessage) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Invoke the external callback with the incoming message
      incomingMessage(message);

      print("FCM Message Data: ${message.data}");
      print("FCM Message Notification: ${message.notification}");
      String notificationTitle = message.notification?.title ?? "No Title";
      String notificationBody = message.notification?.body ?? "No Body";

      print("Notification Title: $notificationTitle");
      print("Notification Body: $notificationBody");

      // Create a MessageStructure object with the received message
      MessageStructure receivedMessage = MessageStructure(message: message);

      // Pass the receivedMessage to the appropriate handling method
      handleReceivedMessage(receivedMessage);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("FCM Message opened app: ${message.data}");

      // Create a MessageStructure object with the opened app message
      MessageStructure openedAppMessage = MessageStructure(message: message);
      handleOpenedAppMessage(openedAppMessage);
    });
  }

  void handleReceivedMessage(MessageStructure message) {
    // Handle the received message here
  }

  void handleOpenedAppMessage(MessageStructure message) {
    // Handle the opened app message here
  }

  Future<void> handleBackgroundMessage(MessageStructure message) async {
    // Handle the background message here
  }

  void handleInitialMessage(MessageStructure message) {
    // Handle the initial message here
  }
}
