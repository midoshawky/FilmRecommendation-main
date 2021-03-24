
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Question1 extends StatelessWidget {

  final Function(bool) onTap;
  const Question1({Key key, this.onTap}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset('assets/images/plus-18-movie.svg',width: 170,height: 170,color: Colors.redAccent,)),
              SizedBox(height: 50,),
              Text('Firstly tell us is your age +18?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.redAccent),),

              SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.greenAccent.shade400
                      ),
                      child: FlatButton(onPressed: (){
                        onTap(true);
                      },child: Text('Yes',
                        style: TextStyle(
                            fontSize: 18
                            ,fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),))),
                  SizedBox(width: 50,),
                  Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent
                      ),
                      child: FlatButton(onPressed: (){
                        onTap(false);
                      },child: Text('No',
                        style: TextStyle(
                            fontSize: 18
                            ,fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),)))


                ],
              ),



            ],


          ),
        ),
      ),
    );
  }
}
