import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<String> nameLists = ["babar", "muneeb", "ahad", "aarish"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: nameLists.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(nameLists[index]),
          );
        });
  }
}
