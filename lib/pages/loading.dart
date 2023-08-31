import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(50),
        child: Text("loading"),
      )
    );
  }
}
