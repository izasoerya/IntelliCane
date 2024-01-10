import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../config/fcm.dart';

class GoogleMapsAPI extends StatefulWidget {
  const GoogleMapsAPI({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapsAPI> createState() => _GoogleMapsAPIState();
}

class _GoogleMapsAPIState extends State<GoogleMapsAPI> {
  final Completer<GoogleMapController> _controller = Completer();
  var temp = const RemoteMessage();

  LatLng currentLocation = const LatLng(-7.797068, 110.370529);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  final FCMHandler _fcmHandler = FCMHandler();
  @override
  void initState() {
    super.initState();
    _initFCM();
  }

  Future<void> _initFCM() async {
    await _fcmHandler.initFCM(updateLocation);
  }

  void updateLocation(RemoteMessage message) {
    setState(() {
      double latitude = double.parse(message.data["latitude"] as String);
      double longitude = double.parse(message.data["longitude"] as String);
      currentLocation = LatLng(latitude, longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 17.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("currentLocation"),
                position:
                    LatLng(currentLocation.latitude, currentLocation.longitude),
              )
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("Button Pressed!");
            },
            child: const Text("Button")),
      ],
    );
  }
}
