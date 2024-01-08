import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'message_format.dart';
import 'fcm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FCMHandler _fcmHandler = FCMHandler();
  var temp = const RemoteMessage();
  @override
  void initState() {
    super.initState();
    _initFCM();
  }

  void incomingMessage(RemoteMessage message) {
    setState(() {
      temp = message;
    });
  }

  Future<void> _initFCM() async {
    await _fcmHandler.initFCM(incomingMessage);
  }

  @override
  Widget build(BuildContext context) {
    MessageStructure messageStructure = MessageStructure(message: temp);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FCM Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(messageStructure.notificationTitle),
            Text(messageStructure.notificationBody),
            Text(messageStructure.dataTitle),
            Text(messageStructure.dataBody),
          ],
        ),
      ),
    );
  }
}
