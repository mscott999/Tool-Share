import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tool_share/view/loginView.dart';

import 'model/Team.dart';

File? _teamCSV;
HashMap<int, Team> _teamMap = HashMap();
Team? _loggedInTeam;

void main() {
  initCSV();
  runApp(const ToolShare());
}

class ToolShare extends StatelessWidget {
  const ToolShare({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tool Share',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LoginView(),
    );
  }
}

void initCSV() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  String filePath = '${directory.path}/teams.csv';
  _teamCSV = File(filePath);
  print(_teamCSV!.path);
  _teamCSV?.writeAsString('name');
  print(await _teamCSV!.readAsString());
}

void logInTeam(Team team) {
  _loggedInTeam = team;
}

void logOutTeam() {
  _loggedInTeam = null;
}

Team? getLoggedInTeam() {
  return _loggedInTeam;
}

void addTeamToMap(Team team) {
  _teamMap.addAll({team.getNumber(): team});
}

HashMap getTeamMap() {
  return _teamMap;
}
