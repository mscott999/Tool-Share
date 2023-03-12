import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tool_share/main.dart';

import '../viewmodel/DeleteToolViewModel.dart';

class DeleteToolView extends StatefulWidget {
  _DeleteToolViewState createState() => _DeleteToolViewState();
}

class _DeleteToolViewState extends State<DeleteToolView> {
  Widget build(BuildContext context) {
    if (getLoggedInTeam()!.getToolList().isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Tool Share')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Delete Equipment', style: TextStyle(fontSize: 35)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              child: Text('Team ' +
                  getLoggedInTeam()!.getNumber().toString() +
                  ' does not yet have any tools added.'),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Share')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(),
              child: Text('Delete Equipment', style: TextStyle(fontSize: 35)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Please select a tool to remove from the team:'),
                  DeleteToolViewModel.getTools(context, this),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
