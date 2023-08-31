import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool isLoading = true;
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Bangkok',
        flag: 'thailand.png',
        url: 'Asia/Bangkok'
    );

    await instance.getData();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
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
      backgroundColor: Colors.cyan[300],
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Show loading indicator
            : Text("LoadingComplete"), // Show time data or error message
      ),

    );
  }
}
