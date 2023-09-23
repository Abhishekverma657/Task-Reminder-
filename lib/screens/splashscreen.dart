import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/screens/homeScreen.dart';
 class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TodoHomeScreen()),
      );
    });
    return Scaffold(
   backgroundColor: Color.fromARGB(255, 13, 49, 83),
   
    body: Center(child: Container(
       height: MediaQuery.of(context).size.height/2,
       width:MediaQuery.of(context).size.width/1.5,
       
      child: LottieBuilder.asset("assets/splash.json",fit: BoxFit.cover,))),);
  }
}