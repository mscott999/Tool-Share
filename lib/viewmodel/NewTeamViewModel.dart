import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tool_share/main.dart';
import '../model/Team.dart';
import '../view/HomeView.dart';

class NewTeamViewModel {
  static late BuildContext _bContext;
  static String _targetNumber = '';
  static String _targetPassword = '';
  static String _targetName = '';
  static String _targetDescription = '';

  static Widget getMap(BuildContext context) {
    _bContext = context;
    return Column(
      children: const [
        Text('Please select the team\'s location:',
            style: TextStyle(fontSize: 20)),
        SizedBox(
          height: 300,
          child: GoogleMap(
            mapType: MapType.normal,
            onTap: _onMapTapped,
            initialCameraPosition: CameraPosition(
                target: LatLng(47.595878, -122.124834), zoom: 11),
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
          ),
        )
      ],
    );
  }

  static void _onMapTapped(LatLng location) {
    showDialog(
        context: _bContext,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Confirm Location?'),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Latitude: ' +
                      location.latitude.toStringAsFixed(6) +
                      '\nLongitude: ' +
                      location.longitude.toStringAsFixed(6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            attemptNewUser(location);
                          },
                          child: const Text('Yes')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No')),
                    ],
                  )
                ],
              ),
            ],
          );
        });
  }

  static void attemptNewUser(LatLng location) {
    Navigator.pop(_bContext);
    if (int.tryParse(_targetNumber) == null || int.parse(_targetNumber) <= 0) {
      showDialog(
          context: _bContext,
          builder: (bContext) {
            return SimpleDialog(
              title: const Text('Invalid Number'),
              children: [
                Column(children: [
                  const Text('Please provide a valid team number.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bContext);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (getTeamMap().containsKey(int.parse(_targetNumber))) {
      showDialog(
          context: _bContext,
          builder: (bContext) {
            return SimpleDialog(
              title: const Text('Invalid Number'),
              children: [
                Column(children: [
                  const Text(
                      'Please provide a valid team number which has not yet been taken.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bContext);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (_targetPassword.length < 4) {
      showDialog(
          context: _bContext,
          builder: (bContext) {
            return SimpleDialog(
              title: const Text('Invalid Password'),
              children: [
                Column(children: [
                  const Text(
                      'Please provide a password with at least four characters.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bContext);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (_targetName.length < 4) {
      showDialog(
          context: _bContext,
          builder: (bContext) {
            return SimpleDialog(
              title: const Text('Invalid Team Name'),
              children: [
                Column(children: [
                  const Text('Please provide the name of the robotics team.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bContext);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (_targetDescription.isEmpty) {
      showDialog(
          context: _bContext,
          builder: (bContext) {
            return SimpleDialog(
              title: const Text('Invalid Team Description'),
              children: [
                Column(children: [
                  const Text(
                      'Please provide a short description for the robotics team.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bContext);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else {
      Team _newTeam = Team(int.parse(_targetNumber), location, [],
          _targetDescription, _targetName, _targetPassword);
      addTeamToMap(_newTeam);
      logInTeam(_newTeam);
      showDialog(
          context: _bContext,
          builder: (bContext) {
            return SimpleDialog(
              title: const Text('Team Successfully initialized'),
              children: [
                Column(children: [
                  Text('Team ' +
                      _newTeam.getNumber().toString() +
                      ' has been added to the application!'),
                  ElevatedButton(
                      onPressed: () {
                        routeToHome(_bContext);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    }
  }

  static void setTargetNumber(String string) {
    _targetNumber = string;
  }

  static void setTargetPassword(String string) {
    _targetPassword = string;
  }

  static void setTargetName(String string) {
    _targetName = string;
  }

  static void setTargetDescription(String string) {
    _targetDescription = string;
  }

  static void routeToHome(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => HomeView())));
  }
}
