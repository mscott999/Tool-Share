import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tool_share/main.dart';
import 'package:tool_share/model/Team.dart';
import 'package:tool_share/viewmodel/SearchToolViewModel.dart';

class SearchToolView extends StatefulWidget {
  @override
  _SearchToolViewState createState() => _SearchToolViewState();
}

class _SearchToolViewState extends State<SearchToolView> {
  static late List<String> _toolNames;

  @override
  initState() {
    SearchToolViewModel.loadDefaultMarkers();
  }

  Widget build(BuildContext context) {
    _toolNames = SearchToolViewModel.getToolNames();
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Share')),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text('Search For Tool', style: TextStyle(fontSize: 35)),
          Padding(
            padding: EdgeInsets.symmetric(),
            child: Column(
              children: [
                Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return _toolNames.where((String _option) {
                      return _option
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String _option) {
                    SearchToolViewModel.searchForTool(_option, this);
                  },
                  fieldViewBuilder: ((BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search by tool name:',
                        filled: true,
                        fillColor: Colors.green,
                      ),
                      onSubmitted: (String string) {
                        if (_toolNames.contains(string)) {
                          SearchToolViewModel.searchForTool(string, this);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: const Text('Tool not found'),
                                  children: [
                                    Column(children: [
                                      Text('"' +
                                          string +
                                          '" does not belong to any team. Would you like to submit an emergency request?'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                SearchToolViewModel
                                                    .routeToEmergencyRequest(
                                                        context);
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
                      },
                    );
                  }),
                ),
                SearchToolViewModel.getMap(context),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
