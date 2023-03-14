import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/EmergencyRequest.dart';
import '../model/Team.dart';
import '../view/NewEmergencyRequestView.dart';

class EmergencyRequestViewModel {
  static Widget getRequests(BuildContext context, State state) {
    List<Row> _requestRows = [];
    for (Team team in getTeamMap().values) {
      for (EmergencyRequest request in team.getEmergencyRequests()) {
        _requestRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Team ' + team.getNumber().toString() + ''),
            Text('Tool: ' + request.getName()),
            Text('Quantity: ' + request.getQuantity().toString()),
            ElevatedButton(
              onPressed: () {
                fulfillRequest(team, request, context, state);
              },
              child: Text('Fulfill'),
            ),
          ],
        ));
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _requestRows,
    );
  }

  static void fulfillRequest(
      Team team, EmergencyRequest request, BuildContext context, State state) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Fulfill Request'),
            children: [
              Column(children: [
                Text('Do you want to notify team ' +
                    team.getNumber().toString() +
                    'That you possess the tool they need?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          team.getFulfilledRequests().add(request);
                          team.removeRequest(request);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: const Text('Request Fulfilled'),
                                  children: [
                                    Column(children: [
                                      Text('Team ' +
                                          team.getNumber().toString() +
                                          '\'s request has been fulfilled!'),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok')),
                                    ]),
                                  ],
                                );
                              });
                          state.setState(() {});
                        },
                        child: const Text('Yes')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                  ],
                ),
              ]),
            ],
          );
        });
  }

  static void routeToNewEmergencyRequest(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => NewEmergencyRequestView())));
  }
}
