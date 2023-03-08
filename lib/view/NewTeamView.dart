import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewmodel/NewTeamViewModel.dart';

class NewTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tool Share')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('New Team', style: TextStyle(fontSize: 35)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextField(
                  onChanged: (String string) {
                    NewTeamViewModel.setTargetNumber(string);
                  },
                  decoration: InputDecoration(
                    hintText: 'Team number',
                    filled: true,
                    fillColor: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextField(
                  onChanged: (String string) {
                    NewTeamViewModel.setTargetPassword(string);
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextField(
                  onChanged: (String string) {
                    NewTeamViewModel.setTargetName(string);
                  },
                  decoration: InputDecoration(
                    hintText: 'Team name',
                    filled: true,
                    fillColor: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextField(
                  maxLines: null,
                  onChanged: (String string) {
                    NewTeamViewModel.setTargetDescription(string);
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    filled: true,
                    fillColor: Colors.green,
                  ),
                ),
              ),
              NewTeamViewModel.getMap(context),
            ],
          ),
        ));
  }
}
