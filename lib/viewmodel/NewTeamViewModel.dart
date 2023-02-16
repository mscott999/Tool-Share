import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewTeamViewModel {
  static GoogleMapController? mapController;

  static Widget getMap() {
    return SizedBox(
      height: 200,
      child: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: LatLng(47.595878, -122.124834), zoom: 11),
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }

  static void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
