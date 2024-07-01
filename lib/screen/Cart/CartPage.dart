import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/screen/Cart/each_cart_card.dart';

import '../../core/constants/noData/no_item_cart.dart';
import '../../core/utils/colors.dart';
import '../../feature/cart/controller/add_to_cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartController.getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cBlack,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Cart",
              style: fWhiteSemiBold24,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image.asset(
                "assets/icons/main_logo.png",
                height: 30,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
      // body: Container(
      //   decoration: const BoxDecoration(color: cWhite),
      //   child: Obx(
      //     () {
      //       if (cartController.isLoading.value) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else if (cartController.getCartList == null ||
      //           cartController.getCartList!.isEmpty) {
      //         return const Center(child: NoItemCart());
      //       } else {
      //         return ListView.builder(
      //           padding: const EdgeInsets.all(10),
      //           itemCount: cartController.getCartList!.length,
      //           itemBuilder: (context, index) {
      //             final cart = cartController.getCartList![index];
      //             return EachCartCard(cart: cart);
      //           },
      //         );
      //       }
      //     },
      //   ),
      // ),

      body: Container(
        decoration: const BoxDecoration(color: cWhite),
        child: GetBuilder<CartController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.getCartList == null ||
                controller.getCartList!.isEmpty) {
              return const Center(child: NoItemCart());
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.getCartList!.length,
                itemBuilder: (context, index) {
                  final cart = controller.getCartList![index];
                  return EachCartCard(cart: cart);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
