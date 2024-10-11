// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_app/Utils/constants.dart';

import '../Widgets/bottom_nav_bar.dart';

class GroceryOnBoard extends StatelessWidget {
  const GroceryOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: ClipPathOnBoard(),
            child: Container(
              color: onboardbackground,
              // we will do this curve later
              width: size.width,
              height: size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Image.asset(
                  "assets/grocery/onboarding_profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Buy Groceries\nEasilly With Us",
                  style: TextStyle(
                      fontSize: 30, height: 1.3, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Listen podcast and open your\nworld with this application",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => BottomNavBar()),
                        (rout) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: gradientColor,
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathOnBoard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // // TODO: implement getClip
    // throw UnimplementedError();
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 70,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// {
//   // TODO: implement shouldReclip
//   throw UnimplementedError();
// }
}
