import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:sd/ui/home_screen.dart';
class Splash extends StatefulWidget{

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  HomeScreen(),
    )
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060720),
      body:
      Padding(

        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(child: Image.asset("assets/weather-app.png",width: 150,height: 150,)),
            SizedBox(height: 10,),
            Center(child: Text("Weather App",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500,fontSize: 30,letterSpacing: 3),)),

          ],
        ),
      ),
    );
  }
}
