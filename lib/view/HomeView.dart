import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tool Share'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
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
                    null;
                  },
                  child: Text(
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
                  child: Text('Remove Tool To Team', textScaleFactor: 1.4),
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
                  child: Text('Search For Tool', textScaleFactor: 1.4),
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
                  child: Text('Emergency Requests', textScaleFactor: 1.4),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Sign Out"),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Delete Team"),
                  ),
                ],
              )
            ]));
  }
}
