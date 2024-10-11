import 'package:flutter/material.dart';

import '../Pages/home_screen_grocery.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeScreenGrocery(),
    Center(
      child: Text("Data"),
    ),
    HomeScreenGrocery(),
    Center(
      child: Text("Mail"),
    ),
    Center(
      child: Text("Profile"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart,
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.mail,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: ""),
          ]),
    );
  }
}
