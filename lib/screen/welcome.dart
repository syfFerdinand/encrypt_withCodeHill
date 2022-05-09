import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../config/Theme.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), ()=>Navigator.pushReplacementNamed(context, "/home"));

    return SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcome/welcome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text("Code de Hill",
                style: TextStyle(
                    color: NowUIColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 40.0)),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
            ),
            SizedBox(
              height: 150,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Agne',
                  color: NowUIColors.white,
                ),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText("Chiffrer ou dechiffrer \n un message avec une \n matrice 2*2",textAlign:TextAlign.center ),
                  ],
                ),
              ),
              //child: Text("Hello box",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),

          ],
        ),
      ),
    ));
  }
}
