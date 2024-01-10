// import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../message_page/message_format.dart';

class FCMHandler {
  Future<void> initFCM(void Function(RemoteMessage) mapsAPI) async {
    // Request permission for FCM
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      mapsAPI(message);
      // Invoke the external callback with the incoming message
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

// class WidgetFCM extends StatefulWidget {
//   const WidgetFCM({
//     // required this.updateLocation,
//     super.key,
//   });

//   // final void Function() updateLocation;

//   @override
//   State<WidgetFCM> createState() => _WidgetFCMState();
// }

// class _WidgetFCMState extends State<WidgetFCM> {
//   final FCMHandler _fcmHandler = FCMHandler();
//   RemoteMessage temp = const RemoteMessage();

//   @override
//   void initState() {
//     super.initState();
//     _initFCM();
//   }

//   Future<void> _initFCM() async {
//     await _fcmHandler.initFCM();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const MainPageMaps(
//       latitude: 0,
//       longitude: 0,
//     );
//   }
// }
