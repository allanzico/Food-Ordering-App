import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'HomeScreen.dart';
import 'OrderScreen.dart';
import 'ProfileScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  HomeScreen homeScreen;
  OrderScreen orderScreen;
  ProfileScreen profileScreen;

  //List of pages
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    super.initState();

    homeScreen = HomeScreen();
    orderScreen = OrderScreen();
    profileScreen = ProfileScreen();

    pages = [homeScreen, orderScreen, profileScreen];
    currentPage = homeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            currentTabIndex == 1
                ? "Orders"
                : currentTabIndex == 2
                    ? "Profile"
                    : currentTabIndex == 3 ? "Profile" : "",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              //Change pages
              setState(() {
                currentTabIndex = index;
                currentPage = pages[index];
              });
            },
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    EvaIcons.homeOutline,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    EvaIcons.home,
                    color: Colors.black,
                  ),
                  title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(
                    EvaIcons.shoppingBagOutline,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    EvaIcons.shoppingBag,
                    color: Colors.black,
                  ),
                  title: Text("Orders")),
              BottomNavigationBarItem(
                  icon: Icon(
                    EvaIcons.personOutline,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    EvaIcons.person,
                    color: Colors.black,
                  ),
                  title: Text("Profile"))
            ]),
        body: currentPage,
      ),
    );
  }
}
