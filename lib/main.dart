import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    onGenerateRoute: (settings) {
      if (settings.name == "/second") {
        final args = settings.arguments as ScreenArgs;
        return MaterialPageRoute(builder: (context) {
          return SecondScreen(name: args.name, age: args.age);
        });
      }
    },
    routes: {
      "/": (context) => MyApp(),
    },
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();

  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Column(
        children: [
          TextField(
            controller: age,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "age",
                hintText: "enter age"),
          ),
          TextField(
            controller: name,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText: "enter Name"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second",
                    arguments: ScreenArgs(name.text, age.text));
              },
              child: Text("Navigate")),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.name, required this.age})
      : super(key: key);

  final String name;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        color: Colors.red,
        height: 172,
        width: 172,
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.blue),
            ),
            Text(age)
          ],
        ),
      ),
    );
  }
}

class ScreenArgs {
  String name;
  String age;

  ScreenArgs(this.name, this.age);
}