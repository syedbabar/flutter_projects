import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iseha_flutter/constants/font_family.dart';
import 'package:iseha_flutter/constants/image_path.dart';
import 'package:iseha_flutter/constants/palettes/Palettes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iseha_flutter/ui/custom_ui.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DoctorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainCollapsingToolbar(),
      ),
    );
  }
}

class MainCollapsingToolbar extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar>
    with SingleTickerProviderStateMixin {
  bool isShowed = true;

  int currentIndex = 0;

  ScrollController _scrollController;

  List<Widget> tabsContent = [
    Container(height: 200, width: double.infinity, child: Text("tab 1")),
    Container(height: 200, width: double.infinity, child: Text("tab 2")),
    Container(height: 200, width: double.infinity, child: Text("tab 3")),
    Container(height: 200, width: double.infinity, child: Text("tab 4")),
  ];

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() => {
            isShowed = !_isAppBarExpanded ? false : true
//        showToast(_isAppBarExpanded.toString())});
          });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palettes().white,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(),
                ),
                backgroundColor: Palettes().white,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(5.0),
                    title: _appBar(),
                    background: MyFlexibleAppBar()),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  _buildProfileTabs(),
                ),
                pinned: true,
              ),
            ];
          },
          body: _buildTabBody(0),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
        margin: EdgeInsets.only(top: 30, left: 10.0, bottom: 5.0),
        child: _isAppBarExpanded
            ? Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Image(
                              image: AssetImage(ImagePath().loginApp),
                              height: 70,
                              width: 70,
                            ),
                          )),
                    ),
                    /* Expanded(flex: 1, child: Container()),*/
                    Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(
                                right: 20.0, top: 15.0, bottom: 15.0),
                            child: Image(
                              image: AssetImage(ImagePath().settingIcon),
                              height: 25,
                              width: 25,
                            ),
                          )),
                    )
                  ],
                ),
              )
            : Container(
                child: Text(
                "",
              )));
  }

  void showToast(String msg) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
  }

  Widget _buildProfileTabs() {
    return TabBar(
      onTap: (index) {
//        showToast(index.toString());
        setState(() {
          _buildTabBody(index);
        });
      },
      physics: ClampingScrollPhysics(),
      labelColor: Palettes().mainGreen,
      unselectedLabelColor: Palettes().black,
      labelStyle: TextStyle(fontFamily: CustomFonts().regular),
      indicatorColor: Palettes().mainGreen,
      tabs: [
        _buildTabText("Overview"),
        _buildTabText("Reviews"),
        _buildTabText("Hospitals"),
        _buildTabText("Offers")
      ],
    );
  }

  Widget _buildTabText(String text) {
    return Tab(
      text: text,
    );
  }

  Widget _buildTabBody(int index) {
    return Container(
      child: ListView.builder(
          itemCount: tabsContent.length,
          itemBuilder: (context, index) {
            return Container(
              child: tabsContent[index],
            );
          }),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Palettes().white),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class MyFlexibleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Palettes().white),
      child: Column(
        children: [_buildTopSection(), _buildMyAppointment()],
      ),
    );
  }

  Widget _buildTopSection() {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(ImagePath().doctorProfile),
            fit: BoxFit.cover,
          ),
          _buildProfileSection(),
          _buildTopOption()
        ],
      ),
    );
  }

  Widget _buildTopOption() {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: _buildOption(
                ImagePath().drawerIcon, CustomUi().leftCornerTransBg(), true),
          ),
          Expanded(flex: 1, child: Container()),
          Align(
            alignment: Alignment.topRight,
            child: _buildOption(ImagePath().settingIcon,
                CustomUi().rightCornerTransBg(), false),
          )
        ],
      ),
    );
  }

  Widget _buildOption(String image, BoxDecoration decoration, bool isDrawer) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: isDrawer
            ? EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left: 25)
            : EdgeInsets.only(top: 10.0, right: 25, bottom: 10, left: 15),
        decoration: decoration,
        child: Image(
          color: Colors.black,
          height: 25,
          width: 25,
          image: AssetImage(image),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black38),
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileDetails(),
              Expanded(flex: 1, child: Container()),
              _buildReviewsDetails()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Text(
            "Dr Anthony Williams",
            style: TextStyle(
                color: Palettes().white,
                fontFamily: CustomFonts().bold,
                fontSize: 14),
          )),
          Container(
              child: Text("Cardiologist",
                  style: TextStyle(
                      color: Palettes().white,
                      fontFamily: CustomFonts().bold,
                      fontSize: 12))),
          Container(
              child: Text("MBBS, Diploma in cardialogy",
                  style: TextStyle(
                      color: Palettes().white,
                      fontFamily: CustomFonts().bold,
                      fontSize: 12)))
        ],
      ),
    );
  }

  Widget _buildReviewsDetails() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  child: RatingBar(
                itemSize: 10.0,
                initialRating: 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              )),
              Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Text("4.5",
                      style: TextStyle(
                          color: Palettes().white,
                          fontFamily: CustomFonts().bold,
                          fontSize: 12)))
            ],
          ),
          Container(
              child: Text("(789 Reviews)",
                  style: TextStyle(
                      color: Palettes().white,
                      fontFamily: CustomFonts().regular,
                      fontSize: 10)))
        ],
      ),
    );
  }

  Widget _buildMyAppointment() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      height: 35,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.0),
      decoration: CustomUi().greenButtonBg(),
      child: Text(
        "My Appointments",
        style: TextStyle(
            color: Palettes().white,
            fontSize: 14,
            fontFamily: CustomFonts().regular),
      ),
    );
  }
}
