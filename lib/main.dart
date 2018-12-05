import 'package:flutter/material.dart';

import 'increment.dart';
import 'newapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Top Headlines",),
                Tab(text: "Sports",),
                Tab(text: "Entertainment",)
              ],
            ),
            title: Text('Flutter ITK'),
          ),
          body: TabBarView(
            children: [
              new NewsAPIIndonesia(),
              Icon(Icons.directions_transit),
              Icon(Icons.music_video)
            ],
          ),
        ),
      ),
    );
  }
}


