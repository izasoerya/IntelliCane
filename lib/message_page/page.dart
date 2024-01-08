import 'package:flutter/material.dart';
import 'fcm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FCMHandler _fcmHandler = FCMHandler();

  @override
  void initState() {
    super.initState();
    _initFCM();
  }

  Future<void> _initFCM() async {
    await _fcmHandler.initFCM();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FCM Example'),
      ),
      body: Center(
        child: Text('Firebase Cloud Messaging Example'),
      ),
    );
  }
}
