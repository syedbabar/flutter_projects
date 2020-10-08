import 'package:first_flutter_app/CustomTheme.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Listview Example",
      theme: CustomTheme().lightOrangeTheme(),
      home: CityListPage(),
    );
  }
}

class HomeListPage extends StatelessWidget {
  final List<String> items = List<String>.generate(30, (i) => "Items ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swipe to dismiss")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index) {
          final item = items[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              items.remove(index);
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Item dismissed"),
                  backgroundColor: Colors.redAccent));
            },
            background: Container(
              color: Colors.redAccent,
            ),
            child: ListTile(
              title: Text("$item"),
            ),
          );
        },
      ),
    );
  }
}

class CityListPage extends StatelessWidget {
  final List<String> citiesList = [
    "Karachi",
    "Lahore",
    "Peshawar",
    "Islamabad",
    "Khanpur",
    "Karachi",
    "Lahore",
    "Peshawar",
    "Islamabad",
    "Islamabad",
    "Islamabad",
    "Islamabad",
    "Islamabad",
    "Khanpur"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listBody(),
    );
  }

  Widget _listBody() {
    return ListView.builder(
      itemCount: citiesList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          color: Colors.orangeAccent,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              FlutterLogo(
                size: 40.0,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(citiesList[index]),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  ),
                  Text(citiesList[index]),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
