import 'dart:convert';

import 'package:flutter/material.dart';

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

    data =data.isNotEmpty ? data: ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    // parameters = ModalRoute.of(context)?.settings.arguments as Map;
    // data = jsonDecode(jsonEncode(parameters));
    //print(data);

    String bgImage = data['isDayTime'] ?? false ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ?? false ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      print('Result from location selection: $result'); // Add this line
                      if(result != null){
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      }
                    },
                    icon: const Icon(Icons.edit_location, color: Colors.red,),
                  label: const Text("Choose Location",style: TextStyle(color: Colors.red),),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style:const TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                    ),
                  ),
                ],
                ),
                const SizedBox(height: 20),
                Text(
                  data['time'],
                  style:const TextStyle(
                    fontSize: 70,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
