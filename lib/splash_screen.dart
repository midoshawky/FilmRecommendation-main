import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_recommendation/homepage.dart';
import 'package:movie_app_recommendation/question1_ui.dart';
import 'package:movie_app_recommendation/question2_ui.dart';
import 'package:movie_app_recommendation/question3_ui.dart';
import 'package:movie_app_recommendation/suggestion_ui.dart';


class SplashScreen extends StatelessWidget {

  List entries = List();
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(

      body: PageView(

        scrollDirection: Axis.horizontal,
        controller: controller,
        children:  <Widget>[

          Center(
            child: Question1(
              onTap: (adult){
                entries.add(adult);
                controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
              },
            ),
          ),
          Center(
            child:Question2(
              onTap: (family){
              entries.add(family);
              controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
            },),
          ),
          Center(
            child:Question3(
              onSelect: (movieGenereId){
                entries.add(movieGenereId);
                controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
              },
            ),
          ),
          Center(
            child:Suggestion(entries: entries,),
          )
        ],
      )

    );
  }
}



