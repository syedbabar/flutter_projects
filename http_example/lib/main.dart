import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_example/model/posts.dart';
import 'package:http_example/model/photos.dart';

import 'network/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Http Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: loadPhotos(),
    );
  }

  Widget loadPost() {
    return FutureBuilder(
        future: getPosts(), // get post from server
        builder: (context, snapshot) {
          // return data in widgets
          if (!snapshot.hasData) // show until the data is not showing
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          List<Post> posts = snapshot.data; // store the data in post list
          return ListView.builder(
            // return data in custom column
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      posts[index].title,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white),
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(
                          posts[index].body,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              );
            },
          );
        });
  }

  Widget loadPhotos() {
    return FutureBuilder(
        future: getPhotos(), // get post from server
        builder: (context, snapshot) {
          // return data in widgets
          if (!snapshot.hasData) // show until the data is not showing
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          List<Photos> photos = snapshot.data; // store the data in post list
          return ListView.builder(
            // return data in custom column
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(photos[index].url),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              photos[index].title,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
