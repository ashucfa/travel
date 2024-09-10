import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

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
                const Text('Coming Soon', style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 44,
                    color: Colors.white
                ),),
                const SizedBox(width: 10,),
                Image.asset('assets/images/globe-icon.png', width: 36,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
