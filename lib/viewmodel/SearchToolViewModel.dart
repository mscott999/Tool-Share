import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../main.dart';
import '../model/Team.dart';
import '../model/Tool.dart';
import '../view/EmergencyRequestView.dart';

class SearchToolViewModel {
  static late Map<Team, Marker> markers;

  static Widget getMap(BuildContext context) {
    markers = HashMap();
    getTeamMap().forEach((key, value) {
      markers.putIfAbsent(
          value,
          () => Marker(
                markerId: MarkerId(value.getNumber.toString()),
                position: value.getLocation(),
                infoWindow: InfoWindow(
                    title: 'Team ' +
                        value.getNumber().toString() +
                        ': ' +
                        value.getName(),
                    snippet: value.getBio()),
                icon: BitmapDescriptor.defaultMarker,
              ));
    });
    return SizedBox(
      height: 400,
      child: GoogleMap(
        mapType: MapType.normal,
        //onTap: _onMapTapped,
        initialCameraPosition:
            CameraPosition(target: LatLng(47.595878, -122.124834), zoom: 11),
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        markers: markers.values.toSet(),
      ),
    );
  }

  static List<String> getToolNames() {
    List<String> _sortedResults = [];
    getTeamMap().forEach((key, value) {
      value.getToolList().forEach((Tool tool) {
        _sortedResults.add(tool.getTitle());
      });
    });
    _sortedResults = _sortedResults.toSet().toList();
    _sortedResults.sort();
    return _sortedResults;
  }

  static void searchForTool(String name) {
    null;
    print('Searching for ' + name);
  }

  static void routeToEmergencyRequest(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => EmergencyRequestView())));
  }
}
