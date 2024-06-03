import 'package:clippy_flutter/arc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:snkr_flutter/screen/Item/ItemAppBar.dart';
import 'package:snkr_flutter/screen/Item/ItemBottomNavBar.dart';

class ItemPage extends StatelessWidget {
  List<Color> Clrs = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.yellow,
  ];

  ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/1.png",
              height: 300,
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              "Product Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: const Iconify(
                                    Carbon.subtract,
                                    size: 18,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: const Text(
                                    "01",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: const Icon(Icons.add, size: 18),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "These are the details...",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Size :",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 5; i < 10; i++)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      i.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Colors:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Clrs[i],
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: const Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price :",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                            ),
                            Text(
                              "\$100",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Add Review Section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.rate_review),
                            SizedBox(width: 10),
                            Text(
                              "Add a review",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ItemBottomNavBar(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Colors.blue,
      //   height: 75,
      //   items: const [
      //     Icon(
      //       Icons.home,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.menu_book,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.list,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.card_travel,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //   ],
      // ),
    );
  }
}
