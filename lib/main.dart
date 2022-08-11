import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context)=>MyApp(),
      "/second":(context)=>SecondScreen(name: '', age: '',)
    },
  ));

}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.name, required this.age})
      :super(key: key);
  final String name;
  final String age;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(name),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Navigate"),
      ),

    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Screen"),
        ),
        body: Column(
          children: [
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter Password"

              ),

            )
            ,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, "/second");
              }, child: Text("Navigate"),

            ),
          ],
        )

    );
  }
}


}
class ScreenArgs{
  final String name;
  final String age;
  ScreenArgs(this.name,this.age);
}