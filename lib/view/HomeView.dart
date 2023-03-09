import 'package:flutter/material.dart';

import '../viewmodel/HomeViewModel.dart';

class HomeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tool Share'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 100),
                    ),
                    onPressed: () {
                      HomeViewModel.routeToAddTool(context);
                    },
                    child: const Text(
                      'Add New Tool To Team',
                      textScaleFactor: 1.4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 100),
                    ),
                    onPressed: () {
                      null;
                    },
                    child:
                        const Text('Remove Tool To Team', textScaleFactor: 1.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 100),
                    ),
                    onPressed: () {
                      null;
                    },
                    child: const Text('Search For Tool', textScaleFactor: 1.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, left: 8.0, right: 8.0, bottom: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 100),
                    ),
                    onPressed: () {
                      null;
                    },
                    child:
                        const Text('Emergency Requests', textScaleFactor: 1.4),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        null;
                      },
                      child: Text("Sign Out"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, onPrimary: Colors.yellow),
                      onPressed: () {
                        null;
                      },
                      child: const Text("Delete Team"),
                    ),
                  ],
                )
              ]),
        ));
  }
}
