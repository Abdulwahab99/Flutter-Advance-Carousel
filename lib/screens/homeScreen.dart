import 'package:flutter/material.dart';

final imagesList = [
  "assets/images/newyork.jpg",
  "assets/images/capetown.jpg",
  "assets/images/switzerland.jpg",
];

final colorList = [
  Colors.redAccent.shade100,
  Colors.blueAccent.shade100,
  Colors.amber.shade50
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: currentPage, viewportFraction: .7);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(currentPage);
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        pageSnapping: true,
        onPageChanged: _pageChange,
        itemBuilder: (context, index) {
          return iteamBuilder(index);
        },
        itemCount: 3,
      ),
    );
  }

  Widget iteamBuilder(index) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * .7,
        // width: MediaQuery.of(context).size.width * .6,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
        color: Colors.grey.shade400,
        child: Material(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          child: Image.asset(
            imagesList[index],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  _pageChange(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
