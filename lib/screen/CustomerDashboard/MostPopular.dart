import 'package:flutter/material.dart';
import 'package:snkr_flutter/screen/Item/ItemPage.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.78,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 5; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 244, 242),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 2, // Blur radius
                  offset: const Offset(0, 2), // Shadow position, (x,y)
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 3),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Product Title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Product Description please",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(bottom: 20),
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/$i.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. 5555",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        size: 30,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
