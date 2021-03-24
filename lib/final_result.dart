import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app_recommendation/Data.dart';
class FinalResult extends StatelessWidget {
  Data _data = Data();
  final String movieName;
  FinalResult({Key key, this.movieName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Response>(
        future: _data.getData("up"),
        builder: (context,snapshot){
          if(snapshot.hasData)
            {
              List body = json.decode(snapshot.data.body);
              String movieName = body[body.length-1]["Title"].toString();
              double distancePercentage = ((1-body[body.length-1]["Distance"])*100).round().toDouble();
              return FutureBuilder<Response>(
                future: _data.getMovieData(movieName),
                builder: (context,snap){
                  if(snap.hasData)
                    {
                      String movieImgUrl = json.decode(snap.data.body)["poster"].toString();
                      String movieDescription = json.decode(snap.data.body)["plot"].toString();
                      return Stack(
                        fit: StackFit.loose,//overflow: Overflow.visible,
                        children: [
                          Positioned(
                            child: Container(
                              child: FadeInImage.assetNetwork(placeholder: "assets/images/filmplace.png", image:movieImgUrl,fit: BoxFit.cover),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width:MediaQuery.of(context).size.width,
                              height:MediaQuery.of(context).size.height*0.56 ,
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),color: Colors.white),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('i recommend you to watch '),
                                      Text(movieName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                                      Text(movieDescription,maxLines: 6,textAlign: TextAlign.center,),
                                      Container(
                                        color: Colors.grey.shade400,
                                        height: 1,
                                        width:MediaQuery.of(context).size.width*0.7 ,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('it is match your requirement by',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                                            Padding(
                                              child:  Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SizedBox(
                                                    child: CircularProgressIndicator(

                                                      valueColor:AlwaysStoppedAnimation<Color>(Colors.green[300]),
                                                      value: distancePercentage/100,
                                                    ),
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                  Text("$distancePercentage%",style: TextStyle(fontSize: 12),)
                                                ],
                                              ),
                                              padding: EdgeInsets.only(top: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      FlatButton(
                                        child: Text('Try another one',style: TextStyle(color: Colors.grey.shade400),),
                                        onPressed: (){},
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset('assets/images/popcorn.gif',

                          width: 800,),

                        Text('Processing!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                      ],
                    ),
                  );
                }
              );
            }
          return  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset('assets/images/popcorn.gif',

                  width: 800,),

                Text('Processing!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.redAccent),),
              ],
            ),
          );
        }
      ),

    );
  }
}
