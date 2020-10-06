import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:market/Screens/OrderScreen.dart';
import 'package:market/Screens/Favorites.dart';
import 'HomeScreen.dart';
import 'CartScreen.dart';
import 'ProfileScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  HomeScreen homeScreen;
  // CartScreen orderScreen;
  OrderScreen orderScreen;
  ProfileScreen profileScreen;
  CartScreen cartScreen;

  //List of pages
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    super.initState();

    homeScreen = HomeScreen();
    // orderScreen = OrderScreen();
    profileScreen = ProfileScreen();
    cartScreen = CartScreen();

    pages = [homeScreen, cartScreen, profileScreen];
    currentPage = homeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              // BottomNavigationBarItem(
              //     icon: Icon(
              //       EvaIcons.shoppingBagOutline,
              //       color: Colors.black,
              //     ),
              //     activeIcon: Icon(
              //       EvaIcons.shoppingBag,
              //       color: Colors.black,
              //     ),
              //     title: Text("Orders")),
              BottomNavigationBarItem(
                  icon: Icon(
                    EvaIcons.shoppingCartOutline,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    EvaIcons.shoppingCart,
                    color: Colors.black,
                  ),
                  title: Text("Cart")),
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
