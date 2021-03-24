
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Question3 extends StatelessWidget {

  final Function(int) onSelect;
  const Question3({Key key, this.onSelect}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/images/clapperboard.svg',width: 170,height: 170,)),
            SizedBox(height: 100,),
            Text('What kind of movies you like to watch?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.redAccent),),

            SizedBox(height: 100,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Choice(name:'Comedy',onSelect:(key) => onSelect(35),),
                    Choice(name:'Action',onSelect:(key) => onSelect(28),),
                    Choice(name:'Adventure',onSelect:(key) => onSelect(12),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Choice(name:'Horror',onSelect:(key) => onSelect(27),),
                    Choice(name:'SCI-FI',onSelect:(key) => onSelect(878),),
                    Choice(name:'Romantic',onSelect:(key) => onSelect(10749),),
                  ],
                ),
              ],
            ),
          ],


        ),
      ),
    );
  }
}

//creating a class to create the UI of the one choice by passing to it the choice name
class Choice extends StatelessWidget {
  final String name;
  final Function(String) onSelect;

  const Choice({Key key, this.name, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(  width: 107,height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5 ,
            offset: Offset(0,0),
            blurRadius: 4
          )],
        ),
        child: FlatButton(onPressed: (){
          onSelect(name);
        },child: Text(name,
          style: TextStyle(
              fontSize: 16
              ,fontWeight: FontWeight.bold,
              color: Colors.black87
          ),)));
  }
}
