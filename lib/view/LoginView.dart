import '../viewmodel/LoginViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Share')),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text('Sign in', style: TextStyle(fontSize: 35)),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Team number',
              filled: true,
              fillColor: Colors.green,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              filled: true,
              fillColor: Colors.green,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: null,
              child: Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: () {
                LoginViewModel.routeToNewUser(context);
              },
              child: Text("New Team"),
            ),
          ],
        ),
      ]),
    );
  }
}
