import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: _buildAppbar(),
          body: _buildTabBody(),
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text("Working with tabs"),
      bottom: _buildTabBar(),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.directions_car),
          text: "Tab 1",
        ),
        Tab(
          icon: Icon(Icons.home),
          text: "Tab 2",
        ),
        Tab(
          icon: Icon(Icons.home),
          text: "Tab 3",
        )
      ],
    );
  }

  TabBarView _buildTabBody() {
    return TabBarView(
      children: <Widget>[
        centeredText("Tab 1"),
        centeredText("Tab 2"),
        centeredText("Tab 3")
      ],
    );
  }

  Center centeredText(String text) {
    return Center(
      child: Text(text),
    );
  }
}
