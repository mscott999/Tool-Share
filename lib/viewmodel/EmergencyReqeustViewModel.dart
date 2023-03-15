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
    if (team == getLoggedInTeam()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Fulfill Self Request?'),
              children: [
                Column(children: [
                  const Text(
                      'This request was created by your own team. Do you wish to remove this request?'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            team.removeRequest(request);
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: const Text('Request Fulfilled'),
                                    children: [
                                      Column(children: [
                                        Text(
                                            'Your request has been fulfilled!'),
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
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Fulfill Request'),
              children: [
                Column(children: [
                  Text('Do you want to notify team ' +
                      team.getNumber().toString() +
                      ' that you possess the tool they need?'),
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
                                barrierDismissible: false,
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
  }

  static void routeToNewEmergencyRequest(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => NewEmergencyRequestView())));
  }
}
