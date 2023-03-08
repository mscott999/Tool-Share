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

  //String toCSV() {
  //  return _number.toString() + ',' +
  //         _location.latitude.toString() + ',' +
  //         _location.longitude.toString() + ',' +
  //         _toolList.to
  //         _bio + ',' +
  //         _name + ',' +
  //         _password + ',' +
//
  //}

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
