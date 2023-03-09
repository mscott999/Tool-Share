import 'package:flutter/material.dart';

import '../view/AddToolView.dart';

class HomeViewModel {
  static void routeToAddTool(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => AddToolView())));
  }
}
