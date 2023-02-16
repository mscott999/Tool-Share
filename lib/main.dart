import 'package:flutter/material.dart';
import 'package:tool_share/view/loginView.dart';

void main() {
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
