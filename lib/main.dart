import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tool_share/view/loginView.dart';
import 'model/Team.dart';

Team? _loggedInTeam;
HashMap<int, Team> _teamMap = HashMap();
late File _teamData;

void main() {
  restoreData();
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

void restoreData() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory _directory = await getApplicationDocumentsDirectory();
  _teamData = File('${_directory.path}/data.txt');
  try {
    _teamData.readAsString();
  } on FileSystemException catch (e) {
    _teamData.writeAsStringSync('');
    print('exception caught');
  }
  try {
    json.decode(_teamData.readAsStringSync());
  } on FormatException catch (e) {
    _teamMap = HashMap();
    return;
  }
  teamMapFromJson(json.decode(_teamData.readAsStringSync()));
}

void teamMapFromJson(Map<String, dynamic> map) {
  Map<String, dynamic> _tempMap = HashMap();
  for (String string in map.keys) {}
  print('bruhh');
  for (String string in map.keys) {
    _teamMap.addAll({int.parse(string): Team.fromJson(map[string])});
  }
}

void saveData() {
  Map<String, dynamic> _tempMap = HashMap();
  for (int key in _teamMap.keys) {
    _tempMap.addAll({key.toString(): _teamMap[key]!.toJson()});
  }
  _teamData.writeAsStringSync(json.encode(_tempMap));
}

void logInTeam(Team team) {
  _loggedInTeam = team;
}

void logOutTeam() {
  _loggedInTeam = null;
}

void deleteTeam(Team? team) {
  _teamMap.remove(team!.getNumber());
  print(_teamMap.toString());
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
