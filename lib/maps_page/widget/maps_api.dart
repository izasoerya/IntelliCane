import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
// import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:latlong2/latlong.dart';
import 'package:intellicane/database/data_geojson_sleman.dart';

class MapsAPI extends StatelessWidget {
  const MapsAPI({super.key});

  @override
  Widget build(BuildContext context) {
    GeoJsonParser geoJsonParser = GeoJsonParser();
    geoJsonParser.parseGeoJsonAsString(dataGeoJSON);
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(-7.756165, 110.375403),
        initialZoom: 13.1,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        PolygonLayer(polygons: geoJsonParser.polygons),
        PolylineLayer(polylines: geoJsonParser.polylines),
        MarkerLayer(markers: geoJsonParser.markers),
        RichAttributionWidget(attributions: [
          TextSourceAttribution('© OpenStreetMap contributors',
              onTap: () => 'https://www.openstreetmap.org/copyright'),
        ])
      ],
    );
  }
}
