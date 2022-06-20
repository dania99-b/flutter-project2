import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:permission_handler/permission_handler.dart';

import '../API/api.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var Mymarkers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(30.0444, 31.2357),
              zoom: 12,
            ),
            onMapCreated: (GoogleMapController googleMapController) {
              setState(() {
                Mymarkers.add(
                  Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.0444, 31.2357),
                  ),
                );
              });
            },
            markers: Mymarkers,
          )
        ],
      ),
    );
  }
}
