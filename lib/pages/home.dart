import 'package:flutter/material.dart';
import 'dart:convert';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {

    // data = ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    parameters = ModalRoute.of(context)?.settings.arguments as Map;
    Map data = jsonDecode(jsonEncode(parameters));
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.edit_location),
                label: const Text("Choose Location"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                  ),
                ),
              ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 70,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
