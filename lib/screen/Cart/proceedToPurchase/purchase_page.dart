import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/order/model/selectedItem/selected_shoe_model.dart';

import '../../../core/helper/api/url_services.dart';
import '../../../feature/product/addProduct/response/add_product_model_response.dart';

class PurchasePage extends StatefulWidget {
  final List<SelectedShoeModel> selectedItems;
  final List<AddProductModelResponse> selectedShoeDetails;

  const PurchasePage(
      {Key? key,
      required this.selectedItems,
      required this.selectedShoeDetails})
      : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final TextEditingController _locationController = TextEditingController();
  double totalPrice = 0;
  double deliveryPrice = 100;
  double finalPrice = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice = widget.selectedItems
        .fold(0, (sum, item) => sum + (item.total_price as double));
    finalPrice = totalPrice + deliveryPrice;
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
                    //final item = widget.selectedItems[index];
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

                        // trailing: Text("Rs. ${product.final_price}",
                        //     style: fRedSemiBold16),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _locationController,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement the final purchase logic here
                      print("Purchased items: ${widget.selectedItems}");
                      print("Delivery location: ${_locationController.text}");
                      // You can add API calls or further logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cBlack,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child:
                        const Text("Confirm Purchase", style: fWhiteSemiBold16),
                  ),
                ),
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
