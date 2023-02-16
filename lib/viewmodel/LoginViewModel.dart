import 'package:flutter/material.dart';
import '../view/NewTeam.dart';

class LoginViewModel {
  static void routeToNewUser(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => NewTeam())));
  }
}
