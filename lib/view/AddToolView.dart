import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tool_share/viewmodel/AddToolViewModel.dart';

class AddToolView extends StatefulWidget {
  _AddToolViewState createState() => new _AddToolViewState();
}

class _AddToolViewState extends State<AddToolView> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Share')),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text('Add Tool To Team', style: TextStyle(fontSize: 35)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: TextField(
            onChanged: (String string) {},
            decoration: const InputDecoration(
              hintText: 'Name of Tool',
              filled: true,
              fillColor: Colors.green,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(),
          child: Column(
            children: [
              Text('Please select the quantity of tools:'),
              NumberPicker(
                value: AddToolViewModel.getTargetQuantity(),
                minValue: 1,
                maxValue: 99,
                step: 1,
                itemCount: 3,
                axis: Axis.horizontal,
                onChanged: (value) {
                  setState(() => AddToolViewModel.setTargetQuantity(value));
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
          padding: EdgeInsets.symmetric(),
          child: Column(
            children: [
              Text(
                  'Please select which days of the week the tool is avaliable for lending:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Sunday:'),
                          Checkbox(
                              tristate: false,
                              value: AddToolViewModel.getTargetSunday(),
                              onChanged: (value) {
                                setState(() =>
                                    AddToolViewModel.setTargetSunday(value!));
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Monday:'),
                          Checkbox(
                              tristate: false,
                              value: AddToolViewModel.getTargetMonday(),
                              onChanged: (value) {
                                setState(() =>
                                    AddToolViewModel.setTargetMonday(value!));
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Tuesday:'),
                          Checkbox(
                              tristate: false,
                              value: AddToolViewModel.getTargetTuesday(),
                              onChanged: (value) {
                                setState(() =>
                                    AddToolViewModel.setTargetTuesday(value!));
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Wednesday:'),
                          Checkbox(
                              tristate: false,
                              value: AddToolViewModel.getTargetWednesday(),
                              onChanged: (value) {
                                setState(() =>
                                    AddToolViewModel.setTargetWednesday(
                                        value!));
                              }),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Thursday:'),
                          Checkbox(
                              tristate: false,
                              value: AddToolViewModel.getTargetThursday(),
                              onChanged: (value) {
                                setState(() =>
                                    AddToolViewModel.setTargetThursday(value!));
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Friday:'),
                          Checkbox(
                              tristate: false,
                              value: AddToolViewModel.getTargetFriday(),
                              onChanged: (value) {
                                setState(() =>
                                    AddToolViewModel.setTargetFriday(value!));
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Saturday:'),
                          Checkbox(
                              tristate: false,
                              value: AddToolViewModel.getTargetSaturday(),
                              onChanged: (value) {
                                setState(() =>
                                    AddToolViewModel.setTargetSaturday(value!));
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(),
            child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  AddToolViewModel.attemptAdd(context);
                })),
      ]),
    );
  }
}
