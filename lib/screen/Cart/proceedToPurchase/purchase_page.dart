import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/order/model/selectedItem/selected_shoe_model.dart';

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
        title: const Text(
          "Purchase Summary",
          style: fWhiteSemiBold24,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: cWhite),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selected Items:", style: fBlackSemiBold18),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.selectedItems.length,
              itemBuilder: (context, index) {
                final item = widget.selectedItems[index];
                return Card(
                  child: ListTile(
                    title: Text("Shoe ID: ${item.shoe_id}",
                        style: fBlackSemiBold16),
                    subtitle: Text("Quantity: ${item.quantity}",
                        style: fBlackRegular14),
                    trailing:
                        Text("Rs. ${item.total_price}", style: fRedSemiBold16),
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
                const Text("Final Price:", style: fRedSemiBold16),
                Text("Rs. $finalPrice", style: fRedSemiBold16),
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
                child: const Text("Confirm Purchase", style: fWhiteSemiBold16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}
