import 'dart:io';

import 'package:flutter/material.dart';

import 'model/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Onboarding",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    slides = getSlider();
  }

  Widget _pageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: isCurrentPage ? 12.0 : 10.0,
      height: isCurrentPage ? 12.0 : 10.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(slides[index].getImagePath(),
                slides[index].getTitle(), slides[index].getDesc());
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? _buildNextCont()
          : _buildFinishCont(),
    );
  }

  Widget _buildNextCont() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      height: Platform.isIOS ? 70 : 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              pageController.animateToPage(slides.length - 1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            child: Text("Skip"),
          ),
          Row(
            children: <Widget>[
              for (int i = 0; i < slides.length; i++)
                currentIndex == i ? _pageIndicator(true) : _pageIndicator(false)
            ],
          ),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(currentIndex + 1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }

  Widget _buildFinishCont() {
    return Container(
      alignment: Alignment.center,
      height: Platform.isIOS ? 70 : 60,
      decoration: BoxDecoration(color: Colors.blue),
      child: Text(
        "Get Started Now",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

// ignore: must_be_immutable
class SliderTile extends StatelessWidget {
  String imagePath, title, desc;

  SliderTile(this.imagePath, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 20.0,
          ),
          Text(title),
          SizedBox(
            height: 12.0,
          ),
          Text(desc)
        ],
      ),
    );
  }
}
