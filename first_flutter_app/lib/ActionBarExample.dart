import 'package:first_flutter_app/CustomTheme.dart';
import 'package:flutter/material.dart';

class ActionBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().darkGreenTheme(),
      home: ActionBar(),
    );
  }
}

class _ActionbarState extends State<ActionBar> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppbar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _homeAppbar() {
    return AppBar(
      title: Text("Actionbar Example"),
      backgroundColor: Colors.green,
    );
  }

  Widget _body() {
    return Container(
      child: Center(
        child: Text("You pushed $count times"),
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          count++;
        });
      },
    );
  }
}

class ActionBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActionbarState();
  }
}
