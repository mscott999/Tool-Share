import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tool_share/model/EmergencyRequest.dart';
import 'Tool.dart';

class Team {
  int _number;
  LatLng _location;
  List<Tool> _toolList;
  List<EmergencyRequest> _emergencyRequests;
  late List<EmergencyRequest> _fulfilledRequests;
  String _bio;
  String _name;
  String _password;

  Team(this._number, this._location, this._toolList, this._emergencyRequests,
      this._bio, this._name, this._password) {
    _fulfilledRequests = [];
  }

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

  void addTool(Tool tool) {
    _toolList.add(tool);
    print(_toolList.toString());
  }

  void removeTool(Tool tool) {
    _toolList.remove(tool);
  }

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

  List<EmergencyRequest> getEmergencyRequests() {
    return _emergencyRequests;
  }

  List<EmergencyRequest> getFulfilledRequests() {
    return _fulfilledRequests;
  }

  void removeFulfilledRequest(EmergencyRequest request) {
    _fulfilledRequests.remove(request);
  }

  void removeRequest(EmergencyRequest emergencyRequest) {
    _emergencyRequests.remove(emergencyRequest);
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
