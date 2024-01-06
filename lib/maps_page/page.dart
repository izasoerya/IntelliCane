import 'package:flutter/material.dart';
import 'maps_api.dart';

class MainPageMaps extends StatelessWidget {
  const MainPageMaps({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps Sample App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Maps Sample App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[700],
        ),
        body: const GoogleMapsAPI(),
      ),
    );
  }
}
