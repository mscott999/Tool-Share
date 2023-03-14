import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../main.dart';
import '../model/Team.dart';
import '../model/Tool.dart';
import '../view/EmergencyRequestView.dart';

class SearchToolViewModel {
  static late Map<Team, Marker> _markers;

  static LatLng _initialLocation = LatLng(47.595878, -122.124834);

  static Widget getMap(BuildContext context) {
    _markers = HashMap();
    getTeamMap().forEach((key, value) {
      _markers.putIfAbsent(
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
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
              ));
    });
    return SizedBox(
      height: 400,
      child: GoogleMap(
        mapType: MapType.normal,
        //onTap: _onMapTapped,
        initialCameraPosition:
            CameraPosition(target: _initialLocation, zoom: 11),
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        markers: _markers.values.toSet(),
      ),
    );
  }

  static List<String> getToolNames() {
    List<String> _sortedResults = [];
    getTeamMap().forEach((key, value) {
      value.getToolList().forEach((Tool tool) {
        _sortedResults.add(tool.getTitle().toLowerCase());
      });
    });
    _sortedResults = _sortedResults.toSet().toList();
    _sortedResults.sort();
    return _sortedResults;
  }

  static void searchForTool(String name, State state) {
    print('Searching for ' + name);
    getClosestPosition(name);
    state.setState(() {});
  }

  static void getClosestPosition(String name) {
    print('GCP start');
    LatLng _closest = _initialLocation;
    double _minDistance = double.infinity;
    _markers.forEach((key, value) {
      for (Tool tool in key.getToolList()) {
        if (tool.getTitle() == name) {
          print("tool found");
          String _snippet = 'x' +
              tool.getQuantity().toString() +
              ' ' +
              tool.getTitle() +
              ' avaliable on: ';
          if (tool.getDaysAvailable()[0]) {
            _snippet += 'Su ';
          }
          if (tool.getDaysAvailable()[1]) {
            _snippet += 'M ';
          }
          if (tool.getDaysAvailable()[2]) {
            _snippet += 'Tu ';
          }
          if (tool.getDaysAvailable()[3]) {
            _snippet += 'We ';
          }
          if (tool.getDaysAvailable()[4]) {
            _snippet += 'Th ';
          }
          if (tool.getDaysAvailable()[5]) {
            _snippet += 'Fr ';
          }
          if (tool.getDaysAvailable()[6]) {
            _snippet += 'Su ';
          }
          value = Marker(
              markerId: MarkerId((key.getNumber()).toString()),
              position: key.getLocation(),
              infoWindow: InfoWindow(
                title:
                    'Team ' + key.getNumber().toString() + ': ' + key.getName(),
                snippet: _snippet,
              ),
              icon: BitmapDescriptor.defaultMarker);
          double _distanceToTool = sqrt(pow(
                  (getLoggedInTeam()!.getLocation().latitude -
                          key.getLocation().latitude)
                      .abs(),
                  2) +
              pow(
                  (getLoggedInTeam()!.getLocation().longitude -
                          key.getLocation().longitude)
                      .abs(),
                  2));
          if (_distanceToTool < _minDistance) {
            _minDistance = _distanceToTool;
            _closest = key.getLocation();
          }
        }
      }
    });
    _initialLocation = _closest;
  }

  static void routeToEmergencyRequest(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => EmergencyRequestView())));
  }
}
