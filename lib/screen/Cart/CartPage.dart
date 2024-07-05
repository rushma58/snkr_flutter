import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/selectedItem/selected_shoe_model.dart';
import 'package:snkr_flutter/screen/Cart/each_cart_card.dart';
import 'package:snkr_flutter/screen/Cart/proceedToPurchase/purchase_page.dart';

import '../../core/constants/noData/no_item_cart.dart';
import '../../core/utils/colors.dart';
import '../../feature/cart/controller/add_to_cart_controller.dart';
import '../../feature/cart/model/getCart/get_cart_model.dart';
import '../../feature/product/addProduct/response/add_product_model_response.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.find<CartController>();
  Set<int> selectedItemIds = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartController.getCart();
    });
  }

  void refreshCart() {
    setState(() {
      selectedItemIds.clear();
    });
    cartController.getCart();
  }

  void toggleItemSelection(GetCartModel cart) {
    setState(() {
      if (selectedItemIds.contains(cart.id)) {
        selectedItemIds.remove(cart.id);
      } else {
        selectedItemIds.add(cart.id ?? 0);
      }
    });
  }

  List<SelectedShoeModel> get selectedItems {
    SelectedShoeModel selectedShoeModel;
    return selectedItemIds.map((id) {
      final cart = cartController.getCartList!.firstWhere((c) => c.id == id);
      return selectedShoeModel = SelectedShoeModel(
        shoe_id: cart.shoe!.shoe_id,
        quantity: 1,
        unit_price: double.parse(cart.shoe!.final_price.toString()),
        total_price: double.parse(cart.shoe!.final_price.toString()),
        cartId: cart.id ?? 0,
      );
    }).toList();
  }

  List<AddProductModelResponse> get selectedItemDetails {
    AddProductModelResponse productDetail;

    return selectedItemIds.map((id) {
      final product = cartController.getCartList!.firstWhere((c) => c.id == id);
      return productDetail = product.shoe!;
    }).toList();
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
                  return EachCartCard(
                    cart: cart,
                    isSelected: selectedItemIds.contains(cart.id),
                    onSelect: (bool isSelected) => toggleItemSelection(cart),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "proceed_to_purchase",
        onPressed: selectedItemIds.isNotEmpty
            ? () {
                Get.to(() => PurchasePage(
                      selectedItems: selectedItems,
                      selectedShoeDetails: selectedItemDetails,
                    ));
              }
            : null,
        label: Text(
          "Proceed to Purchase (${selectedItemIds.length})",
          style: fWhiteSemiBold14,
        ),
        icon: const Iconify(
          MaterialSymbols.shopping_cart_outline,
          color: cWhite,
        ),
        backgroundColor: selectedItemIds.isNotEmpty ? cBlack : Colors.grey,
      ),
    );
  }
}
