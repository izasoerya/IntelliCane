import 'package:flutter/material.dart';
import 'maps_api.dart';
import 'package:google_fonts/google_fonts.dart';

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
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green[700],
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Stack(
          children: [
            GoogleMapsAPI(),
            Positioned.fill(
              child: CanePosition(
                latitude: -6.1753924,
                longitude: 106.8271528,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Text("Intellicane User-1", style: GoogleFonts.poppins()),
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

// class InitFCM extends StatefulWidget {
//   const InitFCM({
//     required this.updateLocation,
//     super.key,
//   });

//   final void Function() updateLocation;

//   @override
//   State<InitFCM> createState() => _WidgetFCMState();
// }

// class _WidgetFCMState extends State<InitFCM> {
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
//     return const MainPageApplication();
//   }
// }
