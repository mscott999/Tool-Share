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
                  onSelected: (String string) {
                    SearchToolViewModel.searchForTool(
                        string,
                        0,
                        getLoggedInTeam()!.getLocation(),
                        double.infinity,
                        false,
                        this,
                        context);
                  },
                  fieldViewBuilder: ((BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Search by tool name:',
                        filled: true,
                        fillColor: Colors.green,
                      ),
                      onSubmitted: (String string) {
                        SearchToolViewModel.searchForTool(
                            string,
                            0,
                            getLoggedInTeam()!.getLocation(),
                            double.infinity,
                            false,
                            this,
                            context);
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
