import 'package:flutter/material.dart';
import 'package:tool_share/main.dart';

import '../model/Tool.dart';
import '../view/HomeView.dart';

class AddToolViewModel {
  static int _targetQuantity = 2;
  static String _targetName = '';
  static bool _targetSunday = false;
  static bool _targetMonday = false;
  static bool _targetTuesday = false;
  static bool _targetWednesday = false;
  static bool _targetThursday = false;
  static bool _targetFriday = false;
  static bool _targetSaturday = false;

  static void attemptAdd(BuildContext context) {
    bool _alreadyExists = false;
    getLoggedInTeam()!.getToolList().forEach((Tool tool) {
      if (_targetName == tool.getTitle()) {
        _alreadyExists = true;
      }
    });
    if (_targetName.isEmpty) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialog(
              title: const Text('No Tool Name Provided'),
              children: [
                Column(children: [
                  const Text('Please provide the equipment\'s name or title.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (!_targetSunday &&
        !_targetMonday &&
        !_targetTuesday &&
        !_targetWednesday &&
        !_targetThursday &&
        !_targetFriday &&
        !_targetSaturday) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Tool Always unavailable'),
              children: [
                Column(children: [
                  const Text(
                      'Equipment must be avaliable for at least one day of the week'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (_alreadyExists) {
      print('Running');
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Equipment Already Added'),
              children: [
                Column(children: [
                  Text(_targetName +
                      ' has already been added to this team. Do you wish to overwrite?'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            getLoggedInTeam()!.getToolList().removeWhere(
                                (tool) => tool.getTitle() == _targetName);
                            Navigator.pop(context);
                            getLoggedInTeam()!.addTool(Tool(
                                _targetQuantity,
                                [
                                  _targetSunday,
                                  _targetMonday,
                                  _targetTuesday,
                                  _targetWednesday,
                                  _targetThursday,
                                  _targetFriday,
                                  _targetSaturday
                                ],
                                _targetName));
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: const Text(
                                        'Equipment Successfully Added'),
                                    children: [
                                      Column(children: [
                                        Text('"' +
                                            _targetName +
                                            '" has been added to your team!'),
                                        ElevatedButton(
                                            onPressed: () {
                                              routeToHome(context);
                                            },
                                            child: const Text('Ok')),
                                      ]),
                                    ],
                                  );
                                });
                          },
                          child: const Text('Yes')),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                ]),
              ],
            );
          });
      print('runningdone');
    } else {
      getLoggedInTeam()!.addTool(Tool(
          _targetQuantity,
          [
            _targetSunday,
            _targetMonday,
            _targetTuesday,
            _targetWednesday,
            _targetThursday,
            _targetFriday,
            _targetSaturday
          ],
          _targetName));
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Equipment Successfully Added'),
              children: [
                Column(children: [
                  Text('"' + _targetName + '" has been added to your team!'),
                  ElevatedButton(
                      onPressed: () {
                        routeToHome(context);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    }
  }

  static void routeToHome(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => HomeView())));
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

  static void setTargetSunday(bool value) {
    _targetSunday = value;
  }

  static bool getTargetSunday() {
    return _targetSunday;
  }

  static void setTargetMonday(bool value) {
    _targetMonday = value;
  }

  static bool getTargetMonday() {
    return _targetMonday;
  }

  static void setTargetTuesday(bool value) {
    _targetTuesday = value;
  }

  static bool getTargetTuesday() {
    return _targetTuesday;
  }

  static void setTargetWednesday(bool value) {
    _targetWednesday = value;
  }

  static bool getTargetWednesday() {
    return _targetWednesday;
  }

  static void setTargetThursday(bool value) {
    _targetThursday = value;
  }

  static bool getTargetThursday() {
    return _targetThursday;
  }

  static void setTargetFriday(bool value) {
    _targetFriday = value;
  }

  static bool getTargetFriday() {
    return _targetFriday;
  }

  static void setTargetSaturday(bool value) {
    _targetSaturday = value;
  }

  static bool getTargetSaturday() {
    return _targetSaturday;
  }
}
