import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/screen/Cart/each_cart_card.dart';

import '../../core/utils/colors.dart';
import '../../core/widgets/top_nav_bar.dart';
import '../../feature/cart/controller/add_to_cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    cartController.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
          appBarName: "My Cart",
          filterRequired: false,
          backFunction: '',
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () {
                    if (cartController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cartController.getCartList!.length,
                          itemBuilder: (context, index) {
                            final cart = cartController.getCartList![index];
                            return EachCartCard(cart: cart);
                          },
                        ),
                      );
                    }
                  },
                ),
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
