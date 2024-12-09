// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

class Makemarkersdraggable extends StatefulWidget {
  const Makemarkersdraggable({
    Key? key,
    this.width,
    this.height,
    required this.locationmarker,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng locationmarker;

  @override
  State<Makemarkersdraggable> createState() => _MakemarkersdraggableState();
}

class _MakemarkersdraggableState extends State<Makemarkersdraggable> {
  late google_maps.GoogleMapController mapController;
  late google_maps.LatLng currentLatLng;

  @override
  void initState() {
    super.initState();
    currentLatLng = google_maps.LatLng(
        widget.locationmarker.latitude, widget.locationmarker.longitude);
  }

  void _onMapCreated(google_maps.GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(google_maps.CameraPosition position) {
    setState(() {
      currentLatLng = position.target;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 300,
          child: google_maps.GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: google_maps.CameraPosition(
              target: currentLatLng,
              zoom: 14.0,
            ),
            markers: {
              google_maps.Marker(
                markerId: google_maps.MarkerId('draggableMarker'),
                position: currentLatLng,
                draggable: true,
                onDragEnd: (newPosition) {
                  setState(() {
                    currentLatLng = newPosition;
                  });
                },
              ),
            },
            onCameraMove: _onCameraMove,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Lat: ${currentLatLng.latitude}, Lng: ${currentLatLng.longitude}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
