// import 'package:flutter/material.dart';
// import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_model.dart';
// import 'package:snkr_flutter/screen/Item/ItemPage.dart';

// class MostPopular extends StatefulWidget {
//   final FetchProductModel product;
//   const MostPopular({super.key, required this.product});

//   @override
//   State<MostPopular> createState() => _MostPopularState();
// }

// class _MostPopularState extends State<MostPopular> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       childAspectRatio: 0.78,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       children: [
//         for (int i = 1; i < 5; i++)
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 248, 244, 242),
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2), // Shadow color
//                   spreadRadius: 2, // Spread radius
//                   blurRadius: 2, // Blur radius
//                   offset: const Offset(0, 2), // Shadow position, (x,y)
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 3),
//                   alignment: Alignment.centerLeft,
//                   child: const Text(
//                     "Product Title",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       fontSize: 17,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   child: const Text(
//                     "Product Description please",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 // const Padding(
//                 //   padding: EdgeInsets.only(bottom: 20),
//                 // ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ItemPage()));
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.all(10),
//                     child: Image.asset(
//                       "assets/images/$i.png",
//                       height: 100,
//                       width: 100,
//                     ),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(bottom: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Rs. 5555",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 17,
//                         ),
//                       ),
//                       Icon(
//                         Icons.shopping_cart_checkout,
//                         size: 30,
//                         color: Colors.black,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_model.dart';
import 'package:snkr_flutter/screen/Item/individual_shoe_screen.dart';

class MostPopular extends StatelessWidget {
  final FetchProductModel product;

  const MostPopular({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const baseUrl = "http://10.0.2.2:8000/";
    return Container(
      //height: Get.width * 0.3,
      width: Get.width * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 248, 244, 242),
        color: cSilver,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 3),
            alignment: Alignment.centerLeft,
            child: Text(
              product.name.toString(),
              style: fBlackSemiBold16,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => IndividualShoeScreen(
                    individualProduct: product,
                  ));
              // Navigate to product details page
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Image.network(
                (baseUrl + product.images.toString()),
                height: 100,
                width: 100,
                fit: BoxFit.contain,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Iconify(EmojioneMonotone.running_shoe);
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs. ${product.final_price}',
                style: fBlackSemiBold14,
              ),
              const Icon(
                Icons.shopping_cart_checkout,
                size: 20,
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
