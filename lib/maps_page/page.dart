import 'package:flutter/material.dart';
import 'package:intellicane/maps_page/generate_icon.dart';
import 'maps_api.dart';
import 'bottom_screen.dart';

class MainPageMaps extends StatelessWidget {
  const MainPageMaps({
    key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps Sample App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Maps Sample App',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: BackButton(
            color: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder(
          future: fetchIds(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // show loading spinner while waiting
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // show error message if something went wrong
            } else {
              return const Stack(
                children: [
                  GoogleMapsAPI(),
                  Positioned.fill(
                    child: DraggableBottomScreen(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class CanePosition extends StatelessWidget {
  const CanePosition({
    key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
