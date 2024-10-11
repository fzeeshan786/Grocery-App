import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocery_app/Model/products.dart';
import 'package:grocery_app/Utils/constants.dart';
import 'package:read_more_text/read_more_text.dart';

class ProductDetailScreen extends StatefulWidget {
  final Grocery product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: headerParts(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
//  ##########################   for image and its background    #################
            Stack(
              children: [
                SizedBox(
                  height: 340,
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          spreadRadius: 20,
                          color: widget.product.color.withOpacity(0.1),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipPath(
                  clipper: ClipPathDetail(),
                  child: Container(
                    height: 320,
                    width: size.width,
                    color: widget.product.color.withOpacity(0.15),
                  ),
                ),
                Positioned(
                    bottom: -30,
                    left: 20,
                    right: 20,
                    child: Hero(
                      tag: widget.product.image,
                      child: Image.asset(
                        widget.product.image,
                        height: 400,
                      ),
                    )),
              ],
            ),

//  ############################# items details ############################
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.product.rate,
                        itemSize: 30,
                        allowHalfRating: true,
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        "(${widget.product.rate})",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      //   for quantity increment decrement
                      Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () => quantity > 1 ? quantity-- : null,
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green[50]),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() => quantity++);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReadMoreText(
                    "${widget.product.name} ${widget.product.description}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      height: 1.3,
                      color: Colors.black54,
                    ),
                    readMoreText: 'Read more',
                    readLessText: 'Read less',
                    numLines: 2,
                    // colorClickableText: widget.product.color,
                    // onReadMoreClicked: _onReadMoreClicked,
                    readMoreIconColor: widget.product.color,
                    // readMoreAlign: AlignmentDirectional.center,
                    readMoreTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.product.color,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 170,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 60,
                          left: 70,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: widget.product.color,
                          ),
                        ),
                        Positioned(
                          top: 73,
                          left: 83,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 19,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "\$${widget.product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: gradientColor,
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ############## Appbar back arrow and shopping cart #############
  AppBar headerParts(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      backgroundColor: widget.product.color.withOpacity(0.15),
      actions: [
        Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: widget.product.color,
            ),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: widget.product.color,
            ),
          ),
        ),
      ],
    );
  }
}

class ClipPathDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
