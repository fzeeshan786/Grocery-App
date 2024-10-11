import 'package:flutter/material.dart';
import 'package:grocery_app/Pages/product_detail_screen.dart';
import 'package:grocery_app/Utils/constants.dart';
import 'package:grocery_app/Widgets/product_item_display.dart';
import '../Model/products.dart';

class HomeScreenGrocery extends StatefulWidget {
  const HomeScreenGrocery({super.key});

  @override
  State<HomeScreenGrocery> createState() => _HomeScreenGroceryState();
}

class _HomeScreenGroceryState extends State<HomeScreenGrocery> {
  String categoryes = 'ALL';
  List<Grocery> grocery = groceryItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scaffold
      backgroundColor: backgroundColor,
      body: SafeArea(
          //SafeArea
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            headerParts(),

            //########################   for search bar and filter ################
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              grocery = groceryItems
                                  .where(
                                    (element) =>
                                        element.name.toLowerCase().contains(
                                              value.toLowerCase(),
                                            ),
                                  )
                                  .toList();
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 30,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search Grocery",
                              hintStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green[50]),
                    child: Icon(
                      Icons.tune_rounded,
                      size: 30,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),

            //################################  for category  ########################
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      groceryCategories.length,
                      // groceryCategories.length,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                categoryes = groceryCategories[index];
                                categoryes == "ALL"
                                    ? grocery = groceryItems
                                    : grocery = groceryItems
                                        .where((element) =>
                                            element.category.toLowerCase() ==
                                            categoryes.toLowerCase())
                                        .toList();
                              });
                            },
                            child: SizedBox(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    groceryCategories[index],
                                    style: TextStyle(
                                        fontSize: categoryes ==
                                                groceryCategories[index]
                                            ? 18
                                            : 16,
                                        color: categoryes ==
                                                groceryCategories[index]
                                            ? textGreen
                                            : Colors.black,
                                        fontWeight: categoryes ==
                                                groceryCategories[index]
                                            ? FontWeight.w900
                                            : FontWeight.w500),
                                  ),
                                  categoryes == groceryCategories[index]
                                      ? CircleAvatar(
                                          radius: 4,
                                          backgroundColor: textGreen,
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          ))),
            ),

            //########################   display the category items ###########
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: List.generate(
                    grocery.length,
                    // groceryItems.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                              product: grocery[index],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: ProductItemsDisplay(grocery: grocery[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
              child: Text(
                "Recent Shop",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  groceryItems
                      .where((items) => items.isRecent)
                      .length, //filete isrecent == true
                  (index) {
                    Grocery recent = groceryItems
                        .where((items) => items.isRecent)
                        .toList()[index];
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.symmetric(horizontal: 20)
                          : EdgeInsets.only(right: 20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            // mistake
                            Container(
                              padding: EdgeInsets.all(40),
                              // width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(recent.image))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    recent.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    recent.category,
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 2,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "\$${recent.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -2,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  // #########################   profile name or profile picture    ###########################
  Padding headerParts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Welcome\n",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                  text: "Nafiu Ibrahim",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                      height: 1.5))
            ]),
          ),
          Spacer(),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.yellow.shade800,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvPjv1lHEIpzgDk_e3Sm-e4EVOzggYdb5aHA&s"),
                )),
          )
        ],
      ),
    );
  }
}
