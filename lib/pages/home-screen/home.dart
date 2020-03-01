import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makemebela/pages/feed-screen/feed_screen.dart';
import 'package:makemebela/pages/notification-screen/notification_screen.dart';
import 'package:makemebela/pages/search-screen/search_screen.dart';
import 'package:makemebela/pages/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Feeds(),
          SearchScreen(),
          NotificationScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        activeColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25.0,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 25.0,
              ),
              title: Text("Suche")),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_filter,
              size: 25.0,
            ),
            title: Text("Photo"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 25.0,
            ),
            title: Text("Liebling"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 25.0,
            ),
            title: Text("Mein Konto"),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
