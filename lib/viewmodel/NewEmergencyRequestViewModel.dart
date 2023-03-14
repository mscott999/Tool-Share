import 'package:flutter/material.dart';
import 'package:tool_share/main.dart';
import 'package:tool_share/model/EmergencyRequest.dart';

import '../view/EmergencyRequestView.dart';

class NewEmergencyRequestViewModel {
  static int _targetQuantity = 2;
  static String _targetName = '';

  static void attemptNewRequest(BuildContext context) {
    if (_targetName.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Invalid Request'),
              children: [
                Column(children: [
                  const Text('No name has been given for the request tool.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else {
      getLoggedInTeam()!
          .getEmergencyRequests()
          .add(EmergencyRequest(_targetName, _targetQuantity));
      routeToEmergencyRequest(context);
    }
  }

  static void setTargetQuantity(int value) {
    _targetQuantity = value;
    print('quantity: ' + _targetQuantity.toString());
  }

  static int getTargetQuantity() {
    return _targetQuantity;
  }

  static void setTargetName(String string) {
    _targetName = string;
    print('Name: ' + _targetName);
  }

  static void routeToEmergencyRequest(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => EmergencyRequestView())));
  }
}
