import 'package:codehill/screen/Home.dart';
import 'package:codehill/screen/result.dart';
import 'package:codehill/screen/welcome.dart';
import 'package:flutter/material.dart';

import 'config/Theme.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home':(context)=>HomeScreen()
      },
      home: welcomeScreen(),
    );
  }
}
