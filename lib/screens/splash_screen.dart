import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
    },);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff0172B2),
            Color(0xff014981),
            Color(0xff001645)
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Text('Travel', style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 44,
                      color: Colors.white
                    ),),
                    const SizedBox(width: 10,),
                    Image.asset('assets/images/globe-icon.png', width: 36,),
                ],
              ),
              const SizedBox(height: 10,),
              const Text('Find Your Dream\nDestination With Us',
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'RobotoMedium',
                  fontSize: 20,
                  color: Colors.white,
              ),)
          ],
        ),
      ),
    );
  }
}
