import 'package:flutter/material.dart';

import '../config/Theme.dart';
import '../config/config.dart';

class ResultScreen extends StatelessWidget {


  ResultScreen({Key? key, required this.premiertitle,required  this.premierText,required  this.secondtitle,required  this.secondText}) : super(key: key);

  final String premiertitle;
  final String premierText;
  final String secondtitle;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 1,
              child: Container(
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 42.0),
                        child: Column(children: [
                          Text("${premiertitle}",
                              style: TextStyle(
                                  color: NowUIColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.0)),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24, top: 30, bottom: 24),
                            child: Text(
                              "${premierText}",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: NowUIColors.time)),
                          ),
                        ]),
                      ))),
            ),
            Flexible(
              flex: 1,
              child: Container(
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 42.0),
                        child: Column(children: [
                          Text("${secondtitle}",
                              style: TextStyle(
                                  color: NowUIColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.0)),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24, top: 30, bottom: 24),
                            child: Text(
                                "${secondText}",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: NowUIColors.time)),
                          ),
                        ]),
                      ))),
            ),
          ],
        ),
      ),
    );
  }


}
