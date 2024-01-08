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

      // Pass the openedAppMessage to the appropriate handling method
      handleOpenedAppMessage(openedAppMessage);
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      print("FCM Message in background: ${message.data}");

      // Create a MessageStructure object with the background message
      MessageStructure backgroundMessage = MessageStructure(message: message);

      // Pass the backgroundMessage to the appropriate handling method
      await handleBackgroundMessage(backgroundMessage);
    });

    // Get the initial message (if any)
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print("FCM Initial Message: ${initialMessage.data}");

      // Create a MessageStructure object with the initial message
      MessageStructure initialMessageStructure =
          MessageStructure(message: initialMessage);

      // Pass the initialMessageStructure to the appropriate handling method
      handleInitialMessage(initialMessageStructure);
    }
  }

  // Define the handling methods based on your requirements
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
