import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/feature/cart/model/getCart/get_cart_model.dart';

import '../../core/helper/api/url_services.dart';
import '../../core/utils/fonts.dart';
import '../../feature/cart/controller/add_to_cart_controller.dart';

class EachCartCard extends StatefulWidget {
  final GetCartModel cart;
  const EachCartCard({
    super.key,
    required this.cart,
  });

  @override
  State<EachCartCard> createState() => _EachCartCardState();
}

class _EachCartCardState extends State<EachCartCard> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    // return Column(children: [
    //   for (int i = 1; i < 5; i++)
    //     Container(
    //       height: 130,
    //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //       padding: const EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //         color: const Color.fromARGB(255, 248, 244, 242),
    //         borderRadius: BorderRadius.circular(20),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.black.withOpacity(0.2), // Shadow color
    //             spreadRadius: 2, // Spread radius
    //             blurRadius: 2, // Blur radius
    //             offset: const Offset(0, 2), // Shadow position, (x,y)
    //           ),
    //         ],
    //       ),
    //       child: Row(
    //         children: [
    //           Container(
    //             height: 70,
    //             width: 70,
    //             margin: const EdgeInsets.only(right: 10),
    //             child: Image.asset("assets/images/$i.png"),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(
    //                   "Product name",
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Text(
    //                   "Rs. 5500",
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const Spacer(),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 10),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Icon(
    //                   Icons.delete,
    //                   color: Colors.red,
    //                   size: 30,
    //                 ),
    //                 Row(
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.all(5),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20),
    //                       ),
    //                       child: const Icon(
    //                         CupertinoIcons.add,
    //                         size: 20,
    //                         color: Colors.blue,
    //                       ),
    //                     ),
    //                     Container(
    //                       padding: const EdgeInsets.symmetric(horizontal: 1),
    //                       child: const Text(
    //                         "01",
    //                         style: TextStyle(
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black),
    //                       ),
    //                     ),
    //                     Container(
    //                       padding: const EdgeInsets.all(5),
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20),
    //                       ),
    //                       child: const Icon(
    //                         CupertinoIcons.minus,
    //                         size: 20,
    //                         color: Colors.blue,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    // ]);

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
          Container(
            //margin: const EdgeInsets.all(8),
            child: Image.network(
              (baseUrl + widget.cart.shoe!.images.toString()),
              height: 100,
              width: 100,
              fit: BoxFit.fitHeight,
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
                  widget.cart.shoe!.name.toString(),
                  style: fBlackSemiBold16,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.cart.shoe!.brand.toString(),
                  style: fBlackSemiBold14,
                ),
              ),
              //const Spacer(),
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rs. ${widget.cart.shoe!.price.toString()}",
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
                            widget.cart.id.toString();
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
