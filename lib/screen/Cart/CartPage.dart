import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:snkr_flutter/screen/Cart/CartAppBar.dart';
import 'package:snkr_flutter/screen/Cart/CartItemSamples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CartAppBar(),
          Container(
            height: 700,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Column(
              children: [
                CartItemSamples(),
              ],
            ),
          ),
        ],
      ),
      //  bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Colors.black,
      //   height: 75,
      //   items: const [
      //     Icon(
      //       Icons.home,
      //       size: 30,
      //       color: Colors.white,
      //       ),
      //        Icon(
      //       Icons.menu_book,
      //       size: 30,
      //       color: Colors.white,
      //       ),
      //        Icon(
      //       Icons.list,
      //       size: 30,
      //       color: Colors.white,
      //       ),
      //        Icon(
      //       Icons.person,
      //       size: 30,
      //       color: Colors.white,
      //       ),

      //   ],
      // ),
    );
  }
}
