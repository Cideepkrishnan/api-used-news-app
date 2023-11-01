import 'package:flutter/material.dart';
import 'package:news/view/Explore_screen/explore.dart';
import 'package:news/view/Home_screen/home.dart';
import 'package:news/view/Profile_screen/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class bottom extends StatefulWidget {
  static final title = 'salomon_bottom_bar';
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List _screens = [home(), explore(), profile()];
    return Scaffold(
      body: _screens[selectedIndex],
      extendBody: true,
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            // if (
            //   index == 3
            //   )
            setState(() {
              // _openBottomSheet();
              selectedIndex = value;
            });
          },
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.purple,
          // unselectedFontSize: 10,
          // type: BottomNavigationBarType.fixed,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.black,
              title: Text("Home"),
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              // label: "Home"
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.black,
              title: Text("Explore"),
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              // label: "Explore"
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.black,
              title: Text("Profile"),
              icon: Icon(
                Icons.person_outline,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 30,
              ),
              // label: "Profile"
            ),
          ]),
    );
  }
}
