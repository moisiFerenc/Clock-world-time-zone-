import 'dart:core';
import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  Future<void> setupWorldTIme() async {
    WorldTime instaLeves = WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await instaLeves.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instaLeves.location,
      'flag': instaLeves.flag,
      'time': instaLeves.time,
      'isDayTime': instaLeves.isDayTime
   });

  }


  @override
  void initState(){
    super.initState();
    setupWorldTIme();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(''),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Center(
          child:  SpinKitWave(
            color: Colors.lightBlueAccent,
            size: 50.0,
          ),
      ),
    );
  }
}
