import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../viewmodel/NewTeamViewModel.dart';

class NewTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Share')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('New Team', style: TextStyle(fontSize: 35)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Team number',
                filled: true,
                fillColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Team name',
                filled: true,
                fillColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Description',
                filled: true,
                fillColor: Colors.green,
              ),
            ),
          ),
          NewTeamViewModel.getMap(),
        ],
      ),
    );
  }
}
