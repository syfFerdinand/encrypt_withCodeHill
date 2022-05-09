import 'package:codehill/screen/DecryptScreen.dart';
import 'package:codehill/screen/cryptoScreen.dart';
import 'package:flutter/material.dart';

import '../config/Theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState(){
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text("Code de Hill",
                style: TextStyle(
                    color: NowUIColors.bgColorScreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 22)),
          ),
          SizedBox(
            height: 10,
          ),
          TabBar(
              controller: _tabController,
              //labelColor: mainColor,
              tabs: const <Widget>[
                Tab(
                  child: Text("Chiffrement"),
                ),
                Tab(
                  child: Text("Dechiffrement"),
                ),
              ]),
          Expanded(child: TabBarView(
            controller: _tabController,
            children: [
              CryptScreen(),
              DecryptScreen(),
            ],
          ))
        ],
      ),
    );
  }
}

