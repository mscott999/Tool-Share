import 'package:flutter/material.dart';
import 'package:tool_share/view/HomeView.dart';
import '../view/NewTeamView.dart';

class LoginViewModel {
  static void routeToNewUser(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => NewTeam())));
  }

  static void routeToHome(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => HomeView())));
  }
}
