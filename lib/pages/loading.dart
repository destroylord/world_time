import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:http/retry.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
