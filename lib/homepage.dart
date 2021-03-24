import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_recommendation/splash_screen.dart';


class HomePage extends StatelessWidget {
  final String assetName = 'assets/images/3d-glasses.svg';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(child: SvgPicture.asset(assetName,width: 170,height: 170,)),
              SizedBox(height: 30,),
              Text('Welcome!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.redAccent),),
              SizedBox(height: 20,),
              //welcome message
              Text('welcome to our movie recommendation app its just for studying '
                  'purpose and we gonna recommend you a movie to watch ',maxLines: 4,
              style: TextStyle(fontSize: 18,color: Colors.grey),textAlign: TextAlign.center,),
              SizedBox(height: 40,),
              Container(
                width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent
                  ),  
                  child: FlatButton(onPressed: (){
                   Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return SplashScreen();
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
      ),
    );

  }
}
