import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsAPI extends StatefulWidget {
  const GoogleMapsAPI({super.key});

  @override
  State<GoogleMapsAPI> createState() => _GoogleMapsAPIState();
}

class _GoogleMapsAPIState extends State<GoogleMapsAPI> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng currentLocation = LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
        initialCameraPosition: CameraPosition(
      target: currentLocation,
      zoom: 11.0,
    ));
  }
}
