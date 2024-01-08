import 'package:firebase_messaging/firebase_messaging.dart';

// ...

class FCMHandler {
  Future<void> initFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("FCM Message Data: ${message.data}");
      print("FCM Message Notification: ${message.notification}");
      // Handle the received message data and notification here
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("FCM Message opened app: ${message.data}");
      // Handle the opened app message here
    });

    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);

    // Get the initial message (if any)
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print("FCM Initial Message: ${initialMessage.data}");
      // Handle the initial message here
    }
  }

  Future<void> _onBackgroundMessage(RemoteMessage message) async {
    print("FCM Message in background: ${message.data}");
    // Handle the background message here
  }
}

// ...
