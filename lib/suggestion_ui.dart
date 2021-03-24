
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:movie_app_recommendation/Data.dart';
import 'package:movie_app_recommendation/wait.dart';

import 'final_result.dart';
class Suggestion extends StatelessWidget {
  final List entries;
  Data _data = Data();
  String selectedMovie = "";
  Suggestion({Key key, this.entries}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    print("Entris $entries");
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Response>(
        future: _data.getFirstSuggestions(entries[0]),
        builder: (context,snapshot){
          if(snapshot.hasData)
            {
              List body = json.decode(snapshot.data.body)["results"];
              List filteredBody =  body.where((element) => element["genre_ids"].contains(entries[2])).toList();
              String movieName1 = filteredBody[0]["original_title"];
              String movieName2 = filteredBody[1]["original_title"];
              String moviePoster1 = filteredBody[0]["poster_path"];
              String moviePoster2 = filteredBody[1]["poster_path"];
              print(filteredBody);
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.values[5],
                    children: [

                      Text('Which one you would prefere to watch !'
                          'if you have to watch one of them?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.redAccent),maxLines: 2,textAlign: TextAlign.center,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilmChoice(
                              movieName: movieName1,
                              onSelect: (name) => selectedMovie = name,
                              coverurl:"https://image.tmdb.org/t/p/w500/$moviePoster1"),
                          FilmChoice(
                              movieName: movieName2,
                              onSelect: (name) => selectedMovie = name,
                              coverurl:"https://image.tmdb.org/t/p/w500/$moviePoster2"),
                        ],

                      ),
                      Container(
                          width: 230,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent
                          ),
                          child: FlatButton(onPressed: (){
                            Navigator.pop(context);
                            print(selectedMovie);
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return FinalResult(movieName: selectedMovie,);
                            }));
                          }
                              ,child: Text('LETS GO',
                                style: TextStyle(
                                    fontSize: 18
                                    ,fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),)))
                    ],
                  ),
                ),
              );
            }
          return Center(child: CircularProgressIndicator(
            valueColor:AlwaysStoppedAnimation<Color>(Colors.redAccent),
          ),);
        }
      )
    );
  }
}

//creating a class to create the UI of the one choice by passing to it the choice name
class FilmChoice extends StatelessWidget {
  String coverurl;
  String movieName;
  Function(String) onSelect;
  FilmChoice({this.coverurl,this.onSelect,this.movieName}){
    this.coverurl=coverurl;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(  width: 165,height: 300,
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          clipBehavior: Clip.antiAlias,
          child: Image.network(coverurl,fit: BoxFit.cover,),),
      ),
      borderRadius: BorderRadius.circular(20),
      onTap: () => onSelect(movieName),
    );
  }
}
