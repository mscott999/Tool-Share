import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tool_share/main.dart';
import 'package:tool_share/model/EmergencyRequest.dart';

import '../viewmodel/NewEmergencyRequestViewModel.dart';

class NewEmergencyRequestView extends StatefulWidget {
  _NewEmergencyRequestViewState createState() =>
      _NewEmergencyRequestViewState();
}

class _NewEmergencyRequestViewState extends State<NewEmergencyRequestView> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Share')),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text('New Emergency Request', style: TextStyle(fontSize: 35)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: TextField(
              onChanged: (String string) {
                NewEmergencyRequestViewModel.setTargetName(string);
              },
              decoration: const InputDecoration(
                hintText: 'Name of Tool',
                filled: true,
                fillColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                const Text('Please select the quantity of tools:'),
                NumberPicker(
                  value: NewEmergencyRequestViewModel.getTargetQuantity(),
                  minValue: 1,
                  maxValue: 99,
                  step: 1,
                  itemCount: 3,
                  axis: Axis.horizontal,
                  onChanged: (value) {
                    setState(() =>
                        NewEmergencyRequestViewModel.setTargetQuantity(value));
                  },
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(),
              child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    NewEmergencyRequestViewModel.attemptNewRequest(context);
                  })),
        ]),
      ),
    );
  }
}
