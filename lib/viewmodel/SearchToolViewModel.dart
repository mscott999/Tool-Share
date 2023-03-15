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
  static late GoogleMap _googleMap;

  static void loadDefaultMarkers() {
    print('bruh');
    _markers = HashMap();
    getTeamMap().forEach((key, value) {
      _markers.addAll({
        value: Marker(
          markerId: MarkerId(key.toString()),
          position: value.getLocation(),
          infoWindow: InfoWindow(
              title: 'Team ' + key.toString() + ': ' + value.getName(),
              snippet: value.getBio()),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        )
      });
    });
  }

  static Widget getMap(BuildContext context) {
    _googleMap = GoogleMap(
      mapType: MapType.normal,
      //onTap: _onMapTapped,
      initialCameraPosition: CameraPosition(target: _initialLocation, zoom: 11),
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      markers: _markers.values.toSet(),
    );
    return SizedBox(
      height: 550,
      child: _googleMap,
    );
  }

  static void updateMap(LatLng initialCameraPosition, Set<Marker> markers) {
    _googleMap = GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition:
          CameraPosition(target: initialCameraPosition, zoom: 11),
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      markers: markers,
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
    getClosestPosition(name, state);
    for (Team t in _markers.keys) {
      print(t.getName());
    }
  }

  static void getClosestPosition(String name, State state) {
    print('GCP start');
    LatLng _closest = _initialLocation;
    double _minDistance = double.infinity;
    _markers.forEach((key, value) {
      for (Tool tool in key.getToolList()) {
        if (tool.getTitle() == name) {
          updateMarker(key, tool, state);
          print("tool found");
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
        } else {
          _markers[key] = Marker(
            markerId: MarkerId(key.getNumber().toString()),
            position: key.getLocation(),
            infoWindow: InfoWindow(
                title:
                    'Team ' + key.getNumber().toString() + ': ' + key.getName(),
                snippet: key.getBio()),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          );
        }
      }
    });
    _initialLocation = _closest;
    state.setState(() {
      updateMap(_closest, _markers.values.toSet());
    });
  }

  static void updateMarker(Team team, Tool tool, State state) {
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
    Marker _marker = Marker(
        markerId: MarkerId((team.getNumber()).toString()),
        position: team.getLocation(),
        infoWindow: InfoWindow(
          title: 'Team ' + team.getNumber().toString() + ': ' + team.getName(),
          snippet: _snippet,
        ),
        icon: BitmapDescriptor.defaultMarker);
    _markers[team] = _marker;
    print('changed');
    print(_markers[team]!.infoWindow.snippet);
  }

  static void routeToEmergencyRequest(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => EmergencyRequestView())));
  }
}
