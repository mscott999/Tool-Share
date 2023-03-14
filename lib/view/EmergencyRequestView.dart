import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tool_share/main.dart';
import 'package:tool_share/viewmodel/EmergencyReqeustViewModel.dart';

import '../model/Team.dart';

class EmergencyRequestView extends StatefulWidget {
  _emergencyRequestViewState createState() => _emergencyRequestViewState();
}

class _emergencyRequestViewState extends State<EmergencyRequestView> {
  Widget build(BuildContext context) {
    bool _requestsExist = false;
    for (Team team in getTeamMap().values) {
      if (team.getEmergencyRequests().isNotEmpty) {
        _requestsExist = true;
        break;
      }
    }
    ;
    if (!_requestsExist) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tool Share'),
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [
          Text('Emergency Requests', style: TextStyle(fontSize: 35)),
          Text(
              'There are currently no tools being requested. Would you like to submit an emergency request?'),
          ElevatedButton(
            onPressed: () {
              EmergencyRequestViewModel.routeToNewEmergencyRequest(context);
            },
            child: Text('New Emergency Request'),
          )
        ]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tool Share'),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        Text('Emergency Requests', style: TextStyle(fontSize: 35)),
        EmergencyRequestViewModel.getRequests(context, this),
        ElevatedButton(
          onPressed: () {
            EmergencyRequestViewModel.routeToNewEmergencyRequest(context);
          },
          child: Text('New Emergency Request'),
        )
      ]),
    );
  }
}
