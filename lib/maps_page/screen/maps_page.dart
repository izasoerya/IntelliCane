import 'package:flutter/material.dart';
import 'package:intellicane/maps_page/widget/maps_api.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Page'),
        ),
        body: const MapsAPI(),
      ),
    );
  }
}
