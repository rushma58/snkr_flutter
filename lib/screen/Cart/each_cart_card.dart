import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/feature/cart/model/getCart/get_cart_model.dart';

import '../../core/helper/api/url_services.dart';
import '../../core/utils/fonts.dart';
import '../../feature/cart/controller/add_to_cart_controller.dart';

class EachCartCard extends StatelessWidget {
  final GetCartModel cart;
  final bool isSelected;
  final Function(bool) onSelect;
  EachCartCard({
    super.key,
    required this.cart,
    required this.isSelected,
    required this.onSelect,
  });

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(10),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            activeColor: cBlack,
            value: isSelected,
            onChanged: (bool? value) {
              onSelect(value ?? false);
            },
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              (imageBaseUrl + cart.shoe!.images.toString()),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Iconify(EmojioneMonotone.running_shoe, size: 80);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                alignment: Alignment.centerLeft,
                child: Text(
                  cart.shoe!.name.toString(),
                  style: fBlackSemiBold16,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                alignment: Alignment.centerLeft,
                child: Text(
                  cart.shoe!.brand.toString(),
                  style: fBlackSemiBold14,
                ),
              ),
              //const Spacer(),
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rs. ${cart.shoe!.final_price.toString()}",
                  style: fRedSemiBold16,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Obx(() {
          //   return GestureDetector(
          //     onTap: cartController.isLoading
          //         ? null
          //         : () async {
          //             cartController.cart_id_controller.text =
          //                 widget.cart.id.toString();
          //             await cartController.deleteCart();
          //           },
          //     child: Container(
          //       margin: const EdgeInsets.all(10),
          //       child: const Icon(
          //         Icons.delete,
          //         color: Colors.red,
          //         size: 30,
          //       ),
          //     ),
          //   );
          // }),

          GetBuilder<CartController>(
            builder: (controller) {
              return GestureDetector(
                onTap: cartController.isLoading
                    ? null
                    : () async {
                        cartController.cart_id_controller.text =
                            cart.id.toString();
                        await cartController.deleteCart();
                      },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.delete,
                    color: cRed,
                    size: 30,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
