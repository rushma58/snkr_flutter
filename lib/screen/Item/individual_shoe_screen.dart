import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/cart/controller/add_to_cart_controller.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_model.dart';
import 'package:snkr_flutter/screen/Order/Address/address.dart';
import 'package:snkr_flutter/screen/Order/OrderConfirmation/order_confirmation.dart';

import '../../core/helper/api/url_services.dart';
import '../../core/helper/sharedPreferences/shared_preferences.dart';
import '../../core/helper/snackBar/snack_bar_helper.dart';
import '../../core/widgets/top_nav_bar.dart';

class IndividualShoeScreen extends StatefulWidget {
  final FetchProductModel individualProduct;

  const IndividualShoeScreen({super.key, required this.individualProduct});

  @override
  State<IndividualShoeScreen> createState() => _IndividualShoeScreenState();
}

class _IndividualShoeScreenState extends State<IndividualShoeScreen> {
  late bool isWishlisted = false;

  late CartController cartController;

  @override
  void initState() {
    super.initState();
    cartController = Get.put(CartController());
  }

  Future<bool> isTokenValid() async {
    String? token = await getStringData('expiry');
    if (token != null) {
      return !JwtDecoder.isExpired(token);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
            appBarName: "Individual Shoe",
            filterRequired: false,
            backFunction: ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      //margin: const EdgeInsets.all(10),
                      child: Image.network(
                        (baseUrl + widget.individualProduct.images.toString()),
                        height: 300,
                        // width: 100,
                        fit: BoxFit.fitWidth,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Center(
                            child: Iconify(
                              EmojioneMonotone.running_shoe,
                              size: Get.width * 0.7,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    widget.individualProduct.name.toString(),
                    style: fBlackSemiBold30,
                  ),
                  Text(
                    widget.individualProduct.sku.toString(),
                    style: fBlackRegular16,
                  ),
                  Text(
                    "Rs. ${widget.individualProduct.final_price}",
                    style: fRedSemiBold16,
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Product Description: ",
                        style: fBlackSemiBold18,
                      ),
                      Text(
                        widget.individualProduct.description.toString(),
                        style: fBlackRegular14,
                      )
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Material Used: ",
                        style: fBlackSemiBold18,
                      ),
                      Text(
                        widget.individualProduct.material.toString(),
                        style: fBlackRegular14,
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isWishlisted = !isWishlisted;
                      });
                    },
                    icon: Iconify(
                      isWishlisted ? Mdi.heart : Mdi.heart_outline,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Iconify(MaterialSymbols.shopping_cart_outline,
                        size: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              heroTag: "buy_now_tag",
              onPressed: () {
                Get.to(OrderConfirmScreen(
                  address: Address(
                      fullName: "fullName",
                      mobileNumber: "mobileNumber",
                      streetName: "streetName",
                      address: "address",
                      city: "city",
                      state: "state",
                      zipCode: "zipCode"),
                ));
              },
              label: const Text(
                "Buy Now",
                style: fBlackRegular14,
              ),
              icon: const Iconify(MaterialSymbols.shopping_cart_outline),
              backgroundColor: cSilver,
            ),
            // Obx(() {
            //   return FloatingActionButton.extended(
            //     heroTag: "add_to_cart_tag",
            //     onPressed: cartController.isLoading
            //         ? null
            //         : () async {
            //             bool isValid = await isTokenValid();
            //             if (isValid) {
            //               cartController.shoe_id_controller.text =
            //                   widget.individualProduct.shoe_id.toString();
            //               await cartController.addToCart();
            //             } else {
            //               customInfoSnackBar(
            //                   "Your session has expired. Please log in again.");
            //               // Here you can also navigate to the login screen if needed
            //             }
            //           },
            //     label: const Text(
            //       "Add to Cart",
            //       style: fBlackRegular14,
            //     ),
            //     icon: const Iconify(MaterialSymbols.shopping_cart_outline),
            //     backgroundColor: cSilver,
            //   );
            // }),

            GetBuilder<CartController>(
              builder: (controller) {
                return FloatingActionButton.extended(
                  heroTag: "add_to_cart_tag",
                  onPressed: cartController.isLoading
                      ? null
                      : () async {
                          bool isValid = await isTokenValid();
                          if (isValid) {
                            cartController.shoe_id_controller.text =
                                widget.individualProduct.shoe_id.toString();
                            await cartController.addToCart();
                          } else {
                            customInfoSnackBar(
                                "Your session has expired. Please log in again.");
                          }
                        },
                  label: const Text(
                    "Add to Cart",
                    style: fBlackRegular14,
                  ),
                  icon: const Iconify(MaterialSymbols.shopping_cart_outline),
                  backgroundColor: cSilver,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: const PreferredSize(
  //       preferredSize: Size.fromHeight(kToolbarHeight),
  //       child: TopNavBar(
  //           appBarName: "Individual Shoe",
  //           filterRequired: false,
  //           backFunction: ''),
  //     ),
  //     body: Stack(
  //       children: [
  //         SingleChildScrollView(
  //           child: Padding(
  //             padding: const EdgeInsets.all(18.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   child: Image.network(
  //                     (baseUrl + widget.individualProduct.images.toString()),
  //                     fit: BoxFit.fitWidth,
  //                   ),
  //                 ),
  //                 Text(
  //                   widget.individualProduct.name.toString(),
  //                   style: fBlackSemiBold30,
  //                 ),
  //                 Text(
  //                   widget.individualProduct.sku.toString(),
  //                   style: fBlackRegular16,
  //                 ),
  //                 Text(
  //                   "Rs. ${widget.individualProduct.final_price}",
  //                   style: fRedSemiBold16,
  //                 ),
  //                 const Divider(),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const Text(
  //                       "Product Description: ",
  //                       style: fBlackSemiBold18,
  //                     ),
  //                     Text(
  //                       widget.individualProduct.description.toString(),
  //                       style: fBlackRegular14,
  //                     )
  //                   ],
  //                 ),
  //                 const Divider(),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const Text(
  //                       "Material Used: ",
  //                       style: fBlackSemiBold18,
  //                     ),
  //                     Text(
  //                       widget.individualProduct.material.toString(),
  //                       style: fBlackRegular14,
  //                     )
  //                   ],
  //                 ),
  //                 const Divider(),
  //                 DropdownButton<String>(
  //                   hint: const Text("Select Size"),
  //                   items: widget.individualProduct.sizes.map((String value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                   onChanged: (_) {},
  //                 ),
  //                 DropdownButton<String>(
  //                   hint: const Text("Select Color"),
  //                   items: widget.individualProduct.colors.map((String value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                   onChanged: (_) {},
  //                 ),
  //                 const Divider(),
  //                 const Text(
  //                   "Customer Reviews: ",
  //                   style: fBlackSemiBold18,
  //                 ),
  //                 ...widget.individualProduct.reviews.map((review) {
  //                   return Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(review.reviewerName, style: fBlackRegular14),
  //                       Text(review.comment, style: fBlackRegular14),
  //                       Row(
  //                         children: List.generate(5, (index) {
  //                           return Icon(
  //                             index < review.rating
  //                                 ? Icons.star
  //                                 : Icons.star_border,
  //                           );
  //                         }),
  //                       ),
  //                       const Divider(),
  //                     ],
  //                   );
  //                 }).toList(),
  //                 const Divider(),
  //                 const Text(
  //                   "Related Products: ",
  //                   style: fBlackSemiBold18,
  //                 ),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     children: widget.relatedProducts.map((product) {
  //                       return Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Column(
  //                           children: [
  //                             Image.network(product.image),
  //                             Text(product.name),
  //                             Text("Rs. ${product.price}"),
  //                           ],
  //                         ),
  //                       );
  //                     }).toList(),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           top: 10,
  //           right: 10,
  //           child: Column(
  //             children: [
  //               IconButton(
  //                 onPressed: () {},
  //                 icon: const Iconify(Mdi.heart_outline),
  //               ),
  //               IconButton(
  //                 onPressed: () {},
  //                 icon: const Iconify(MaterialSymbols.shopping_cart_outline),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton.extended(
  //       onPressed: () {},
  //       label: const Text("Add to Cart"),
  //       icon: const Icon(Icons.shopping_cart),
  //     ),
  //   );
  // }
}
