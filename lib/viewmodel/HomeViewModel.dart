import 'package:flutter/material.dart';
import '../view/AddToolView.dart';
import '../view/DeleteToolView.dart';
import '../view/SearchToolView.dart';

class HomeViewModel {
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
}
