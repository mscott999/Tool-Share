import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tool_share/model/EmergencyRequest.dart';
import 'Tool.dart';

class Team {
  int _number;
  LatLng _location;
  late List<Tool> _toolList;
  List<EmergencyRequest> _emergencyRequests;
  late List<EmergencyRequest> _fulfilledRequests;
  String _bio;
  String _name;
  String _password;

  Team(this._number, this._location, this._toolList, this._emergencyRequests,
      this._bio, this._name, this._password) {
    _fulfilledRequests = [];
  }

  Team.fromJson(Map<String, dynamic> json)
      : _number = int.parse(json['_number']),
        _location = LatLng(json['_latitude'], json['_longitude']),
        _emergencyRequests = jsonDecode(json['_emergencyRequests'])
            .map((i) => EmergencyRequest.fromJson(i))
            .toList(),
        _fulfilledRequests = jsonDecode(json['_fulfilledRequests'])
            .map((i) => EmergencyRequest.fromJson(i))
            .toList(),
        _bio = json['_bio'],
        _name = json['_name'],
        _password = json['_password'];

  Map<String, dynamic> toJson() {
    List<Map> _toolList = this._toolList.map((i) => i.toJson()).toList();
    List<Map> _emergencyRequests =
        this._emergencyRequests.map((i) => i.toJson()).toList();
    List<Map> _fulfilledRequests =
        this._fulfilledRequests.map((i) => i.toJson()).toList();
    return {
      '_number': _number.toString(),
      '_latitude': _location.latitude.toString(),
      '_longitude': _location.longitude.toString(),
      '_toolList': _toolList,
      '_emergencyReqeusts': _emergencyRequests,
      '_fulfilledRequests': _fulfilledRequests,
      '_bio': _bio,
      '_name': _name,
      '_password': _password,
    };
  }

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
