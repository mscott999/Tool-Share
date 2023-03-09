import 'package:flutter/material.dart';
import 'package:tool_share/main.dart';
import 'package:tool_share/view/HomeView.dart';
import '../view/NewTeamView.dart';

class LoginViewModel {
  static String _targetNumber = '';
  static String _targetPassword = '';

  static void attemptLogin(BuildContext context) {
    if (_targetNumber.isEmpty || int.tryParse(_targetNumber) == null) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Invalid Number'),
              children: [
                Column(children: [
                  const Text('Please provide a team number.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (_targetPassword.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Invalid Password'),
              children: [
                Column(children: [
                  const Text('Please provide a team password.'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok')),
                ]),
              ],
            );
          });
    } else if (!getTeamMap().containsKey(int.parse(_targetNumber)) ||
        getTeamMap()[int.parse(_targetNumber)].getPassword() !=
            _targetPassword) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Invalid Credentials'),
              children: [
                Column(children: [
                  const Text(
                      'The given team number and password do not match any team.'),
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
      logInTeam(getTeamMap()[int.parse(_targetNumber)]);
      routeToHome(context);
    }
  }

  static void routeToNewUser(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => NewTeamView())));
  }

  static void routeToHome(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => HomeView())));
  }

  static void setTargetNumber(String string) {
    _targetNumber = string;
  }

  static void setTargetPassword(String string) {
    _targetPassword = string;
  }
}
