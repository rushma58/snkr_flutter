// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/emojione_monotone.dart';
// import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';
// import 'package:snkr_flutter/core/utils/colors.dart';
// import 'package:snkr_flutter/core/utils/fonts.dart';
// import 'package:snkr_flutter/feature/order/order-buyer/model/selectedItem/selected_shoe_model.dart';

// import '../../../core/helper/api/url_services.dart';
// import '../../../feature/cart/controller/add_to_cart_controller.dart';
// import '../../../feature/order/order-buyer/controller/order_place_controller.dart';
// import '../../../feature/product/addProduct/response/add_product_model_response.dart';

// class PurchasePage extends StatefulWidget {
//   final List<SelectedShoeModel> selectedItems;
//   final List<AddProductModelResponse> selectedShoeDetails;

//   const PurchasePage(
//       {super.key,
//       required this.selectedItems,
//       required this.selectedShoeDetails});

//   @override
//   State<PurchasePage> createState() => _PurchasePageState();
// }

// class _PurchasePageState extends State<PurchasePage> {
//   final TextEditingController _locationController = TextEditingController();
//   double totalPrice = 0;
//   double deliveryPrice = 100;
//   double finalPrice = 0;
//   List<int> cartIdsToDelete = [];

//   final orderPlaceController = Get.put(OrderPlaceController());
//   final cartController = Get.put(CartController());

//   late final Future<Khalti> khalti;

//   String pidx =
//       'oUqYyBhFpm4gfhC2ZZaEBU'; // Should be generated via a server-side POST request.

//   PaymentResult? paymentResult;

//   @override
//   void initState() {
//     super.initState();
//     calculateTotalPrice();

//     // Add selected items to the controller
//     for (var item in widget.selectedItems) {
//       orderPlaceController.addOrderItem(SelectedShoeModel(
//         shoe_id:
//             item.shoe_id, // Assuming your SelectedShoeModel has an id field
//         quantity: item.quantity,
//         unit_price: item.unit_price,
//         total_price: item.total_price,
//         cartId: item.cartId,
//       ));
//     }

//     cartIdsToDelete = widget.selectedItems
//         .map((item) => item.cartId)
//         .whereType<int>()
//         .toList();

//     // Set other controller values
//     orderPlaceController.total_price_controller.text = totalPrice.toString();
//     orderPlaceController.delivery_price_controller.text =
//         deliveryPrice.toString();
//     orderPlaceController.final_price_controller.text = finalPrice.toString();

//     final payConfig = KhaltiPayConfig(
//       publicKey:
//           'test_public_key_cb5f3df6f4cd4d4f9ee83aa792d17e66', // Merchant's public key
//       pidx: pidx, // This should be generated via a server side POST request.
//       returnUrl:
//           Uri.parse('https://test-pay.khalti.com/?pidx=oUqYyBhFpm4gfhC2ZZaEBU'),
//       environment: Environment.test,
//     );

//     khalti = Khalti.init(
//       enableDebugging: true,
//       payConfig: payConfig,
//       onPaymentResult: (paymentResult, khalti) {
//         log(paymentResult.toString());
//       },
//       onMessage: (
//         khalti, {
//         description,
//         statusCode,
//         event,
//         needsPaymentConfirmation,
//       }) async {
//         log(
//           'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
//         );
//       },
//       onReturn: () => log('Successfully redirected to return_url.'),
//     );
//   }

//   void calculateTotalPrice() {
//     totalPrice = widget.selectedItems
//         .fold(0, (sum, item) => sum + (item.total_price as double));
//     finalPrice = totalPrice + deliveryPrice;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: cBlack,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "Purchase Order",
//               style: fWhiteSemiBold16,
//             ),
//             Container(
//               padding: const EdgeInsets.all(2),
//               decoration: const BoxDecoration(
//                   color: cWhite,
//                   borderRadius: BorderRadius.all(Radius.circular(8))),
//               child: Image.asset(
//                 "assets/icons/main_logo.png",
//                 height: 30,
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//           ],
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: cWhite,
//             )),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(color: cWhite),
//           ),
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("Selected Items:", style: fBlackSemiBold18),
//                 const SizedBox(height: 10),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: widget.selectedShoeDetails.length,
//                   itemBuilder: (context, index) {
//                     //final item = widget.selectedItems[index];
//                     final product = widget.selectedShoeDetails[index];
//                     return Card(
//                       child: ListTile(
//                         tileColor: cGray,
//                         title: Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(right: 10),
//                               child: Image.network(
//                                 (baseUrl + product.images.toString()),
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (BuildContext context,
//                                     Object exception, StackTrace? stackTrace) {
//                                   return const Iconify(
//                                       EmojioneMonotone.running_shoe,
//                                       size: 100);
//                                 },
//                               ),
//                             ),
//                             Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("${product.name}",
//                                     style: fBlackSemiBold16),
//                                 Text("${product.brand}",
//                                     style: fBlackRegular14),
//                                 Text("Rs. ${product.final_price}",
//                                     style: fRedSemiBold16),
//                               ],
//                             ),
//                           ],
//                         ),

//                         // trailing: Text("Rs. ${product.final_price}",
//                         //     style: fRedSemiBold16),
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: orderPlaceController.delivery_location_controller,
//                   decoration: const InputDecoration(
//                     labelText: "Delivery Location",
//                     border: OutlineInputBorder(),
//                   ),
//                   maxLines: 2,
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Price:", style: fBlackSemiBold16),
//                     Text("Rs. $totalPrice", style: fBlackSemiBold16),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Delivery Price:", style: fBlackRegular16),
//                     Text("Rs. $deliveryPrice", style: fBlackRegular16),
//                   ],
//                 ),
//                 const Divider(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Final Price:", style: fRedSemiBold20),
//                     Text("Rs. $finalPrice", style: fRedSemiBold20),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 // Obx(() {
//                 //   return SizedBox(
//                 //     width: double.infinity,
//                 //     child: ElevatedButton(
//                 //       onPressed: orderPlaceController.isLoading.value
//                 //           ? null
//                 //           : () async {
//                 //               await orderPlaceController.placeOrder();
//                 //               for (int cartId in cartIdsToDelete) {
//                 //                 cartController.cart_id_controller.text =
//                 //                     cartId.toString();
//                 //                 await cartController.deleteCart();
//                 //               }
//                 //             },
//                 //       style: ElevatedButton.styleFrom(
//                 //         backgroundColor: cBlack,
//                 //         padding: const EdgeInsets.symmetric(vertical: 10),
//                 //       ),
//                 //       child:
//                 //           const Text("Pay via Khalti", style: fWhiteSemiBold16),
//                 //     ),
//                 //   );
//                 // }),
//                 FutureBuilder(
//                   future: khalti,
//                   initialData: null,
//                   builder: (context, snapshot) {
//                     final Khalti? khaltiSnapshot = snapshot.data as Khalti?;
//                     if (khaltiSnapshot == null) {
//                       return const CircularProgressIndicator.adaptive();
//                     }
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Image.asset(
//                         //   'assets/images/esewa.png',
//                         //   height: 200,
//                         //   width: 200,
//                         // ),
//                         //const SizedBox(height: 120),

//                         OutlinedButton(
//                           onPressed: () => khaltiSnapshot.open(context),
//                           child: const Text('Pay with Khalti'),
//                         ),
//                         //const SizedBox(height: 120),
//                         paymentResult == null
//                             ? Text(
//                                 'pidx up: $pidx',
//                                 style: const TextStyle(fontSize: 15),
//                               )
//                             : Column(
//                                 children: [
//                                   Text(
//                                     'pidx: ${paymentResult!.payload?.pidx}',
//                                   ),
//                                   Text('Status: ${paymentResult!.status}'),
//                                   Text(
//                                     'Amount Paid: ${paymentResult!.payload?.amount}',
//                                   ),
//                                   Text(
//                                     'Transaction ID: ${paymentResult!.payload?.transactionId}',
//                                   ),
//                                 ],
//                               ),
//                       ],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _locationController.dispose();
//     super.dispose();
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/selectedItem/selected_shoe_model.dart';

import '../../../core/helper/api/url_services.dart';
import '../../../feature/cart/controller/add_to_cart_controller.dart';
import '../../../feature/order/order-buyer/controller/order_place_controller.dart';
import '../../../feature/product/addProduct/response/add_product_model_response.dart';

class PurchasePage extends StatefulWidget {
  final List<SelectedShoeModel> selectedItems;
  final List<AddProductModelResponse> selectedShoeDetails;

  const PurchasePage(
      {super.key,
      required this.selectedItems,
      required this.selectedShoeDetails});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final TextEditingController _locationController = TextEditingController();
  double totalPrice = 0;
  double deliveryPrice = 100;
  double finalPrice = 0;
  List<int> cartIdsToDelete = [];

  final orderPlaceController = Get.put(OrderPlaceController());
  final cartController = Get.put(CartController());

  late Future<Khalti?>? khaltiFuture;

  PaymentResult? paymentResult;

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();

    // Add selected items to the controller
    for (var item in widget.selectedItems) {
      orderPlaceController.addOrderItem(SelectedShoeModel(
        shoe_id: item.shoe_id,
        quantity: item.quantity,
        unit_price: item.unit_price,
        total_price: item.total_price,
        cartId: item.cartId,
      ));
    }

    cartIdsToDelete = widget.selectedItems
        .map((item) => item.cartId)
        .whereType<int>()
        .toList();

    // Set other controller values
    orderPlaceController.total_price_controller.text = totalPrice.toString();
    orderPlaceController.delivery_price_controller.text =
        deliveryPrice.toString();
    orderPlaceController.final_price_controller.text = finalPrice.toString();

    khaltiFuture = initKhaltiPayment();
  }

  void calculateTotalPrice() {
    totalPrice = widget.selectedItems
        .fold(0, (sum, item) => sum + (item.total_price as double));
    finalPrice = totalPrice + deliveryPrice;
  }

  Future<Khalti?> initKhaltiPayment() async {
    final url = Uri.parse('https://a.khalti.com/api/v2/epayment/initiate/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Key 9df58714eee24b44b99b1c6e4328a497', // Replace with your actual key
      },
      body: jsonEncode({
        "return_url": "https://a.khalti.com/api/v2/epayment/detail/",
        "website_url": "https://example.com/",
        "amount": finalPrice * 100, // amount in paisa
        "purchase_order_id": "test12",
        "purchase_order_name": "test",
        "customer_info": {"name": "Khalti Bahadur", "phone": "9800000123"},
        "product_details": widget.selectedItems.map((item) {
          return {
            "identity": item.shoe_id,
            "name": "Shoe", // Adjust as necessary
            "total_price": (item.total_price ?? 0) * 100,
            "quantity": item.quantity,
            "unit_price": (item.unit_price ?? 0) * 100
          };
        }).toList(),
        "merchant_username": "SNKR Nepal",
        "merchant_extra": ""
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final pidx = data['pidx'];
      final returnUrl = data['payment_url'];

      final payConfig = KhaltiPayConfig(
        publicKey: 'test_public_key_cb5f3df6f4cd4d4f9ee83aa792d17e66',
        pidx: pidx,
        returnUrl: Uri.parse(returnUrl),
        environment: Environment.test,
      );

      return Khalti.init(
        enableDebugging: true,
        payConfig: payConfig,
        onPaymentResult: (paymentResult, khalti) {
          log(paymentResult.toString());
        },
        onMessage: (
          khalti, {
          description,
          statusCode,
          event,
          needsPaymentConfirmation,
        }) async {
          log(
            'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
          );
        },
        onReturn: () => log('Successfully redirected to return_url.'),
      );
    } else {
      log('Failed to initiate Khalti payment: ${response.body}');
      return null;
    }
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
              "Purchase Order",
              style: fWhiteSemiBold16,
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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: cWhite,
            )),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Selected Items:", style: fBlackSemiBold18),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.selectedShoeDetails.length,
                  itemBuilder: (context, index) {
                    final product = widget.selectedShoeDetails[index];
                    return Card(
                      child: ListTile(
                        tileColor: cGray,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Image.network(
                                (baseUrl + product.images.toString()),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return const Iconify(
                                      EmojioneMonotone.running_shoe,
                                      size: 100);
                                },
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${product.name}",
                                    style: fBlackSemiBold16),
                                Text("${product.brand}",
                                    style: fBlackRegular14),
                                Text("Rs. ${product.final_price}",
                                    style: fRedSemiBold16),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: orderPlaceController.delivery_location_controller,
                  decoration: const InputDecoration(
                    labelText: "Delivery Location",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Price:", style: fBlackSemiBold16),
                    Text("Rs. $totalPrice", style: fBlackSemiBold16),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Delivery Price:", style: fBlackRegular16),
                    Text("Rs. $deliveryPrice", style: fBlackRegular16),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Final Price:", style: fRedSemiBold20),
                    Text("Rs. $finalPrice", style: fRedSemiBold20),
                  ],
                ),
                const SizedBox(height: 20),
                FutureBuilder<Khalti?>(
                  future: khaltiFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator.adaptive();
                    } else if (snapshot.hasError) {
                      log('Error initializing Khalti: ${snapshot.error}');
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      log('Failed to initiate Khalti payment');
                      return const Text('Failed to initiate Khalti payment');
                    }

                    final khalti = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              try {
                                khalti.open(context);
                              } catch (e) {
                                log('Error opening Khalti payment: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Payment error: $e')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cBlack,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text("Pay via Khalti",
                                style: fWhiteSemiBold16),
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}
