import 'dart:html';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Tool.dart';

class Team {
  int _number;
  LatLng _location;
  List<Tool> _toolList;
  String _bio;
  String _name;
  String _password;

  Team(this._number, this._location, this._toolList, this._bio, this._name,
      this._password);

  int compareTo(Team team) {
    return _number.compareTo(team.getNumber());
  }

  int getNumber() {
    return _number;
  }

  LatLng getLocation() {
    return _location;
  }

  List<Tool> getToolList() {
    return _toolList;
  }

  String getBio() {
    return _bio;
  }

  String getName() {
    return _name;
  }

  String getPassword() {
    return _password;
  }
}
