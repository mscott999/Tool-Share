import 'package:flutter/material.dart';
import '../main.dart';
import '../view/AddToolView.dart';
import '../view/DeleteToolView.dart';
import '../view/EmergencyRequestView.dart';
import '../view/LoginView.dart';
import '../view/SearchToolView.dart';

class HomeViewModel {
  static void logOut(BuildContext context) {
    logOutTeam();
    routeToLogin(context);
  }

  static void delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Delete Team?'),
            children: [
              Column(children: [
                const Text('This is an irreversible action. Proceed?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, onPrimary: Colors.yellow),
                        onPressed: () {
                          Navigator.pop(context);
                          deleteTeam(getLoggedInTeam());
                          logOut(context);
                        },
                        child: const Text('Yes')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                  ],
                ),
              ]),
            ],
          );
        });
    deleteTeam(getLoggedInTeam());
    logOut(context);
  }

  static void routeToAddTool(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => AddToolView())));
  }

  static void routeToDeleteTool(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => DeleteToolView())));
  }

  static void routeToSearchTool(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => SearchToolView())));
  }

  static void routeToEmergencyRequest(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => EmergencyRequestView())));
  }

  static void routeToLogin(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => LoginView())));
  }
}
