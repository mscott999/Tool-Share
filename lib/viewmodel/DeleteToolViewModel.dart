import 'package:flutter/material.dart';
import 'package:tool_share/main.dart';

import '../model/Tool.dart';

class DeleteToolViewModel {
  static Widget getTools(BuildContext context, State state) {
    return Column(children: <ElevatedButton>[
      for (int i = 0; i < getLoggedInTeam()!.getToolList().length; i++)
        ElevatedButton(
            onPressed: () {
              _selectTool(context, getLoggedInTeam()!.getToolList()[i], state);
            },
            child: Text(getLoggedInTeam()!.getToolList()[i].getTitle() +
                ': Quantity: ' +
                getLoggedInTeam()!.getToolList()[i].getQuantity().toString()))
    ]);
  }

  static void _selectTool(BuildContext context, Tool tool, State state) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Delete Tool?'),
            children: [
              Column(children: [
                Text('"' +
                    tool.getTitle() +
                    '" will be removed from this team. Proceed?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          getLoggedInTeam()!.removeTool(tool);
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return SimpleDialog(
                                  title: const Text('Tool Deleted'),
                                  children: [
                                    Column(children: [
                                      Text('"' +
                                          tool.getTitle() +
                                          '" has successfully been deleted!'),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            state.setState(() {});
                                          },
                                          child: const Text('Ok')),
                                    ]),
                                  ],
                                );
                              });
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
