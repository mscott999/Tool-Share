import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tool_share/view/loginView.dart';

File? teamCSV;
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
  teamCSV = File(filePath);
  print(teamCSV!.path);
  teamCSV?.writeAsString('name');
  print(await teamCSV!.readAsString());
}
