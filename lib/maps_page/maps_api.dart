import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intellicane/database/monitoring_db.dart';
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
    // Assuming you have a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Assuming 'collectionPath' is the path of the collection you want to listen to
    CollectionReference collection = firestore.collection('collectionPath');

    collection.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.added) {
          print('New document: ${change.doc.data()}');
        } else if (change.type == DocumentChangeType.modified) {
          print('Modified document: ${change.doc.data()}');
        } else if (change.type == DocumentChangeType.removed) {
          print('Removed document: ${change.doc.data()}');
        }
      });
    });
    setState(() {});
  }

  LatLng parseLatLng(String latLngString) {
    latLngString =
        latLngString.trim(); // remove leading and trailing whitespace
    latLngString = latLngString.replaceAll('LatLng(', ''); // remove 'LatLng('
    latLngString = latLngString.replaceAll(')', ''); // remove ')'

    List<String> parts = latLngString.split(',');
    if (parts.length < 2) {
      return const LatLng(0, 0);
    }

    return const LatLng(
      // double.parse(parts[0]),
      // double.parse(parts[1]),
      -7.797068, 110.370529,
    );
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
                zoom: 13.0,
              ),
              markers: <Marker>{
                if (patientDataAll.isNotEmpty) ...[
                  // spread operator to insert multiple items
                  for (int i = 0; i < patientDataAll.length; i++)
                    Marker(
                      markerId: MarkerId(patientDataAll[i]['id']),
                      position: parseLatLng(patientDataAll[i]['location']),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                    ),
                ] else
                  Marker(
                    markerId: const MarkerId('1'),
                    position: const LatLng(-7.797068, 110.370529),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure),
                  ),
              }),
        ),
      ],
    );
  }
}
