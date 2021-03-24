
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Question2 extends StatelessWidget {

  @override
  final Function(bool) onTap;
  const Question2({Key key, this.onTap}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset('assets/images/family(1).svg',width: 170,height: 170,)),
              SizedBox(height: 50,),
              Text('Are you watching with your family?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.redAccent),),

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
