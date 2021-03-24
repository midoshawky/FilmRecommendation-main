import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app_recommendation/final_result.dart';
class Waiting extends StatefulWidget {
  @override
  _WaitingState createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  void initState() {
    super.initState();
  startTimer();
  }
  startTimer()async{
    var duration =Duration(seconds: 4);
    return Timer(duration,route);
  }
  route(){
    Navigator.push(context, MaterialPageRoute(

        builder:(context) =>FinalResult()

    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset('assets/images/popcorn.gif',

            width: 800,),

            Text('Processing!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.redAccent),),
          ],
        ),
      ),
    );
  }
}
