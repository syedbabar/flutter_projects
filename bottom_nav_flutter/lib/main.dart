import 'package:flutter/material.dart';

import 'home/home.dart';

void main() {
  runApp(HomePage());
}

// native bottom navigation

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

/*class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeStatePage();
  }
}

class HomeStatePage extends State<HomePage> {
  int current_index = 0;

  final List<Widget> _widgets = [
    Text("Index 0: Home"),
    ListPage(),
    Text("Index 2: Profile")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom navigation example"),
      ),
      body: Center(child: _widgets.elementAt(current_index)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile"))
        ],
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      current_index = index;
    });
  }
}*/
