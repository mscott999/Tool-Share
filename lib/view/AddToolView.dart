import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tool_share/viewmodel/AddToolViewModel.dart';

class AddToolView extends StatefulWidget {
  _AddToolViewState createState() => _AddToolViewState();
}

class _AddToolViewState extends State<AddToolView> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Share')),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text('Add Tool To Team', style: TextStyle(fontSize: 35)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: TextField(
              onChanged: (String string) {
                AddToolViewModel.setTargetName(string.toLowerCase());
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
          const Text(
            'Please select which days of the week the tool is avaliable for lending:',
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Sunday:'),
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
                        const Text('Monday:'),
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
                        const Text('Tuesday:'),
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
                        const Text('Wednesday:'),
                        Checkbox(
                            tristate: false,
                            value: AddToolViewModel.getTargetWednesday(),
                            onChanged: (value) {
                              setState(() =>
                                  AddToolViewModel.setTargetWednesday(value!));
                            }),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Thursday:'),
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
                        const Text('Friday:'),
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
                        const Text('Saturday:'),
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
          ),
          Padding(
              padding: const EdgeInsets.symmetric(),
              child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    AddToolViewModel.attemptAdd(context);
                  })),
        ]),
      ),
    );
  }
}
